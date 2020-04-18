docker build -t bhanudocker3315/multi-client:latest -t bhanudocker3315/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t bhanudocker3315/multi-server:latest -t bhanudocker3315/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t bhanudocker3315/multi-worker:latest -t bhanudocker3315/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push bhanudocker3315/multi-client:latest
docker push bhanudocker3315/multi-server:latest
docker push bhanudocker3315/multi-worker:latest

docker push bhanudocker3315/multi-client:$SHA
docker push bhanudocker3315/multi-server:$SHA
docker push bhanudocker3315/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployments server=bhanudocker3315/multi-server:$SHA
kubectl set image deployments/client-deployments client=bhanudocker3315/multi-client:$SHA
kubectl set image deployments/worker-deployments client=bhanudocker3315/multi-worker:$SHA