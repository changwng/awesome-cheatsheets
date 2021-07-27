##############################################################################
# DOCKER
##############################################################################


docker build -t friendlyname .              # Create image using this directory's Dockerfile
docker run -p 4000:80 friendlyname          # Run "friendlyname" mapping port 4000 to 80
docker run -d -p 4000:80 friendlyname       # Same thing, but in detached mode  (Background mode)
docker exec -it [container-id] bash         # Enter a running container
docker ps                                   # See a list of all running containers ( Process Status)
docker stop <hash>                          # Gracefully stop the specified container
docker ps -a                                # See a list of all containers, even the ones not running
docker kill <hash>                          # Force shutdown of the specified container
docker rm <hash>                            # Remove the specified container from this machine
docker rm $(docker ps -a -q)                # Remove all containers from this machine
docker images -a                            # Show all images on this machine
docker rmi <imagename>                      # Remove the specified image from this machine
docker rmi $(docker images -q)              # Remove all images from this machine
docker logs <container-id> -f               # Live tail a container's logs
docker login                                # Log in this CLI session using your Docker credentials
docker tag <image> username/repository:tag  # Tag <image> for upload to registry
docker push username/repository:tag         # Upload tagged image to registry
docker run username/repository:tag          # Run image from a registry
docker system prune                         # Remove all unused containers, networks, images (both dangling and unreferenced), and optionally, volumes. (Docker 17.06.1-ce and superior)
docker system prune -a                      # Remove all unused containers, networks, images not just dangling ones (Docker 17.06.1-ce and superior)
docker volume prune                         # Remove all unused local volumes
docker network prune                        # Remove all unused networks
kubectl get nodes
# --- book execesize 8080(외부)을 :80(컨테이너내부)으로 포트 연결
#Base Development Extensions Pack
#  --모든 파일이 한곳에 들어 있음 /work/_Book_k8sInfra
#git clone https://github.com/sysnet4admin/_Book_k8sInfra
#git clone https://github.com/sysnet4admin/_Lecture_k8s_starter.kit
#git clone https://github.com/sysnet4admin/_Lecture_Ansible.expert

docker run -d -p 8080:80 --name nginx-exposed --restart always nginx
docker ps -f name=nginx-exposed  # filtering name
# 디렉토리 연결 /work/_Book_k8sInfra
docker run -d -p 8081:80 -v /work/html:/usr/share/nginx/html --name nginx-bind-mount --restart always nginx
cp /work/_Book_k8sInfra/ch4/4.2.3/index-BindMount.html /work/html/index.html
#docker volumns
docker volume create nginx-volume
docker volume inspect nginx-volume   # /var/lib/docker/volumes/nginx-volume/_data
docker run -d -p 8082:80 -v nginx-volume:/usr/share/nginx/html --name nginx-volume --restart always nginx
# ls /var/lib/docker/volumes/nginx-volume/_data
# vi /var/lib/docker/volumes/nginx-volume/_data/index.html
# sudo cp /work/_Book_k8sInfra/ch4/4.2.3/index-BindMount.html /var/lib/docker/volumes/nginx-volume/_data/index.html

docker ps -f ancestor=nginx
docker stop lb4
docker stop nginx-bind-mount
docker stop $(docker ps -q -f ancestor=nginx) # -q is quiet 
docker ps -a -f ancestor=nginx
docker rm $(docker ps -aq -f ancestor=nginx)  # all container remove

#java docker image build
>$ ./mvnw clean package
>$ ls target #app-in-host /work/_Book_k8sInfra/ch4/4.3.1/target/app-in-host.jar
docker build -t basic-img . #  -t is tag 이미지
# Successfully built 0f6952a799ab
# Successfully tagged basic-img:latest
docker images basic-img
docker build -t basic-img:1.0 -t basic-img:2.0 . # tag 2개

docker run -d -p 60431:80 --name basic-run --restart always basic-img
docker ps -f name=basic-run
sed -i `s/Application/Development/` Dockerfile
/* Dockerfile
FROM openjdk:8
LABEL description="Echo IP Java Application"
EXPOSE 60431
COPY ./target/app-in-host.jar /opt/app-in-image.jar
WORKDIR /opt
ENTRYPOINT [ "java", "-jar", "app-in-image.jar" ]

yum -y install java-1.8.0-openjdk-devel
./mvnw clean package
docker build -t optimal-img .

FROM gcr.io/distroless/java:8

docker run -d -p 60432:80 --name optimal-run --restart always optimal-img
# docker 파일 안에서 빌드 하기

#Docker file안에서 mvn빌드한후에 이동 하여 java 실행 하는 파일
docker build -t nohost-img .
docker images | head -n 4
docker run -d -p 60433:80 --name nohost-run --restart always nohost-img
*/

## kube에서 설치 하기

docker images hello-world
kubectl create deployment failure1 --image=hello-world
kubectl get pods -o wide
# 랭글링 이미지 삭제

## rror: failed to create deployment: Post "https://10.0.2.15:8443/apis/apps/v1/namespaces/default/deployments?fieldManager=kubectl-create": dial tcp 10.0.2.15:8443: connect: connection refused

#https://minikube.sigs.k8s.io/docs/start/
# kube 대신 적용 테스트
minikube kubectl -- get po -A
minikube dashboard

kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.4
kubectl expose deployment hello-minikube --type=NodePort --port=8080
kubectl get services hello-minikube
minikube service hello-minikube
kubectl port-forward service/hello-minikube 7080:8080

putty.exe -ssh -p 60010 root@localhost  -pw vagrant
putty.exe root@localhost:60010 -pw vagrant
@start putty -load "mySavedSession" -l root -pw vagrant

##############################################################################
# DOCKER COMPOSE
##############################################################################


docker-compose up                               # Create and start containers
docker-compose up -d                            # Create and start containers in detached mode
docker-compose down                             # Stop and remove containers, networks, images, and volumes
docker-compose logs                             # View output from containers
docker-compose restart                          # Restart all service
docker-compose pull                             # Pull all image service 
docker-compose build                            # Build all image service
docker-compose config                           # Validate and view the Compose file
docker-compose scale <service_name>=<replica>   # Scale special service(s)
docker-compose top                              # Display the running processes
docker-compose run -rm -p 2022:22 web bash      # Start web service and runs bash as its command, remove old container.

##############################################################################
# DOCKER SERVICES 
##############################################################################


docker service create <options> <image> <command>   # Create new service
docker service inspect --pretty <service_name>      # Display detailed information Service(s)
docker service ls                                   # List Services
docker service ps                                   # List the tasks of Services
docker service scale <service_name>=<replica>       # Scale special service(s)
docker service update <options> <service_name>      # Update Service options


##############################################################################
# DOCKER STACK 
##############################################################################


docker stack ls                                 # List all running applications on this Docker host
docker stack deploy -c <composefile> <appname>  # Run the specified Compose file
docker stack services <appname>                 # List the services associated with an app
docker stack ps <appname>                       # List the running containers associated with an app
docker stack rm <appname>                       # Tear down an application


##############################################################################
# DOCKER MACHINE
##############################################################################


docker-machine create --driver virtualbox myvm1                           # Create a VM (Mac, Win7, Linux)
docker-machine create -d hyperv --hyperv-virtual-switch "myswitch" myvm1  # Win10
docker-machine env myvm1                                                  # View basic information about your node
docker-machine ssh myvm1 "docker node ls"                                 # List the nodes in your swarm
docker-machine ssh myvm1 "docker node inspect <node ID>"                  # Inspect a node
docker-machine ssh myvm1 "docker swarm join-token -q worker"              # View join token
docker-machine ssh myvm1                                                  # Open an SSH session with the VM; type "exit" to end
docker-machine ssh myvm2 "docker swarm leave"                             # Make the worker leave the swarm
docker-machine ssh myvm1 "docker swarm leave -f"                          # Make master leave, kill swarm
docker-machine start myvm1                                                # Start a VM that is currently not running
docker-machine stop $(docker-machine ls -q)                               # Stop all running VMs
docker-machine rm $(docker-machine ls -q)                                 # Delete all VMs and their disk images
docker-machine scp docker-compose.yml myvm1:~                             # Copy file to node's home dir
docker-machine ssh myvm1 "docker stack deploy -c <file> <app>"            # Deploy an app

##############################################################################
# KUBENATE COMMAND
##############################################################################
kubectl get nodes
kubectl get pods --all-namespaces
kubectl get pods --all-namespaces | grep kube-proxy
# 마스터 노드가 아닌 다른곳에서 가져오기
scp root@192.168.1.10:/etc/kubernetes/admin.conf .
kubectl get nodes --kubeconfig admin.conf
#pod 생성
kubectl create -f ~/_Book_k8sInfra/ch3/3.1.6/nginx-pod.yaml
kubectl delete pod nginx-pod
kubectl get pods
kubectl get pods -o wide
systemctl stop kubelet
systemctl start kubelet

kubectl create deployment dpy-nginx --image=nginx
kubectl scale deployment dpy-nginx --replicas=3 #이거는 pod라 스케일 변경 안됌
#kubectl scale pod nginx-pod --replicas=3 #이거는 pod라 스케일 변경 안됌

