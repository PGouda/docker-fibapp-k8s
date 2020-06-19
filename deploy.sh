docker build -t sharangouda/docker-fib-client-k8s:latest -t sharangouda/docker-fib-client-k8s:$SHA -f ./client/Dockerfile ./client
docker build -t sharangouda/docker-fib-server-k8s:latest -t sharangouda/docker-fib-server-k8s:$SHA -f ./server/Dockerfile ./server
docker build -t sharangouda/docker-fib-worker-k8s:latest -t sharangouda/docker-fib-worker-k8s:$SHA -f ./worker/Dockerfile ./worker

docker push sharangouda/docker-fib-client-k8s:latest
docker push sharangouda/docker-fib-server-k8s:latest
docker push sharangouda/docker-fib-worker-k8s:latest
docker push sharangouda/docker-fib-client-k8s:$SHA
docker push sharangouda/docker-fib-server-k8s:$SHA
docker push sharangouda/docker-fib-worker-k8s:$SHA

kubectl apply -f ./k8s

kubectl set image deployment/server-deployment server=sharangouda/docker-fib-server-k8s:$SHA
kubectl set image deployment/client-deployment client=sharangouda/docker-fib-client-k8s:$SHA
kubectl set image deployment/worker-deployment worker=sharangouda/docker-fib-worker-k8s:$SHA


