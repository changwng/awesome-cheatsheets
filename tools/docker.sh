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
# 실제 처리
\_Book_k8sInfra\ch3\3.1.3 은 1.13.1로 되어 있다.
vagrant destroy -f 이면 전체 파일이 삭제 시킨다.
Page 256
C:\HashiCorp\Boxs\kube\_Book_k8sInfra\ch4\4.3.4\k8s-SingleMaster-18.9_9_w_auto-compl\Vagrantfile로 설치 하여
 vagrant up으로 설치 하여  docker 18.9.9를 설치한다.

kubectl get nodes
kubectl get pods --all-namespaces
kubectl get pods --all-namespaces | grep kube-proxy
# 마스터 노드가 아닌 다른곳에서 가져오기
scp root@192.168.1.10:/etc/kubernetes/admin.conf .
kubectl get nodes --kubeconfig admin.conf
kubectl get pods -o wide --kubeconfig admin.conf

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

##############################################################################
# Helm COMMAND
##############################################################################
cd ~/_Book_k8sInfra/ch5/5.2.3
export DESIRED_VERSION=v3.2.1;./helm-install.sh
http://artifacthub.io 에서 metallb 검색

$ helm repo add edu https://iac-source.github.io/helm-charts
$ helm repo update
 helm repo list
 $ helm install metallb edu/metallb \
--namespace=metallb-system \
--create-namespace \
--set controller.tag=v0.8.3 \
--set speaker.tag=v0.8.3 \
--set configmap.ipRange=192.168.1.11-192.168.1.29
#''''''' out put
NAME: metallb
LAST DEPLOYED: Tue Jul 27 19:35:47 2021
NAMESPACE: metallb-system
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
MetalLB load-balancer is successfully installed.
1. IP Address range 192.168.1.11-192.168.1.29 is available.
2. You can create a LoadBalancer service with following command below.
kubectl expose deployment [deployment-name] --type=LoadBalancer --name=[LoadBalancer-name] --port=[external port]
#'''''

https://github.com/IaC-Source/helm-charts 에서 values.yaml 확인

##변수값 확인
helm show values metallb-system

# 쿠버네이트 확인
kubectl get pods -n metallb-system -o wide
kubectl get configmap -n metallb-system
kubectl describe pods -n metallb-system | grep Image:

#위에 설정된것을 테스트 하기 위한것

kubectl create deployment echo-ip --image=sysnet4admin/echo-ip
kubectl expose deployment echo-ip --type=LoadBalancer --port=80
kubectl get service echo-ip
#''' output

NAME      TYPE           CLUSTER-IP    EXTERNAL-IP    PORT(S)        AGE
echo-ip   LoadBalancer   10.105.0.15   192.168.1.11   80:30254/TCP   6s
#'''

kubectl delete service echo-ip
kubectl delete deployment  echo-ip

# docker registry 설치
~/_Book_k8sInfra/ch4/4.4.2/create-registry.sh
docker ps -f name=registry
curl "http://0.0.0.0:8443"

cd ~/_Book_k8sInfra/ch4/4.3.4
docker build -t mutistage-img .
docker images | head -n 3
#yaml 파일 만드는 방식


kubectl create deployment failure2 --image=mutistage-img 
kubectl get pods -w

docker tag mutistage-img 192.168.1.10:8443/mutistage-img
docker images 192.168.1.10:8443/mutistage-img
docker push 192.168.1.10:8443/mutistage-img
curl 'http://192.168.1.10:8443/v1/repositories/mutistage-img/tags/latest'

   curl 'http://192.168.1.10:8443/v1/repositories/gateway/tags/latest'
curl http://192.168.1.10:8443/v2/_catalog
 

docker run 192.168.1.10:8443/mutistage-img



kubectl create deployment failure2 --dry-run=client -o yaml --image=mutistage-img > failure2.yaml
cp failure2.yaml success2.yaml
sed -i 's/replicas: 1/replicas: 3/' success2.yaml
sed -i 's/failure2/success2/' success2.yaml
vi success2.yaml
-----
- image:192.168.1.10:8443/mutistage-img
kubectl apply -f success2.yaml  # create
kubectl delete -f success2.yaml # delete

#3장 도커 빌드후에 도커 레지스트리로 올리기




# https://github.com/ramitsurana/awesome-kubernetes
## https://betterprogramming.pub/awesome-kubernetes-command-line-hacks-8bd3604e394f
alias k=kubectl
alias kdr='kubectl --dry-run=client -o yaml'
alias kap='kubectl apply'
alias kd='kubectl delete'
alias kbb='kubectl run busybox-test --image=busybox -it --rm --restart=Never --'
alias kdb='kubectl describe'
alias kl='kubectl logs'
alias ke='kubectl exec -it'
alias kgp='kubectl get pod -o wide'

##  Jenkins 설치

~/_Book_k8sInfra/ch5/5.3.1/nfs-exporter.sh jenkins
ls -n /nfs_shared
chown 1000:1000 /nfs_shared/jenkins/  # jenkins nfs owner ,group id 
ls -n /nfs_shared
kubectl apply -f ~/_Book_k8sInfra/ch5/5.3.1/jenkins-volume.yaml
#pv 확인 10Gi
kubectl get pv jenkins
#pvc 확인
kubectl get pvc jenkins
 ~/_Book_k8sInfra/ch5/5.3.1/jenkins-install.sh
 '''
 admin/admin
 1. Get your 'admin' user password by running:
  printf $(kubectl get secret --namespace default jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo
2. Get the Jenkins URL to visit by running these commands in the same shell:
  NOTE: It may take a few minutes for the LoadBalancer IP to be available.
        You can watch the status of by running 'kubectl get svc --namespace default -w jenkins'
  export SERVICE_IP=$(kubectl get svc --namespace default jenkins --template "{{ range (index .status.loadBalancer.ingress 0) }}{{ . }}{{ end }}")
  echo http://$SERVICE_IP:80/login

  jenkins   LoadBalancer   10.105.187.154   192.168.1.11   80:32332/TCP   5m5s
  http://192.168.1.11:80/login


3. Login with the password from step 1 and the username: admin

4. Use Jenkins Configuration as Code by specifying configScripts in your values.yaml file, see documentation: http:///configuration-as-code and examples: https://github.com/jenkinsci/configuration-as-code-plugin/tree/master/demos

For more information on running Jenkins on Kubernetes, visit:
https://cloud.google.com/solutions/jenkins-on-container-engine
For more information about Jenkins Configuration as Code, visit:

 '''
kubectl get deployment
kubectl get pod
kubectl exec -it jenkins-6b6f9b8675-t5trr -- cat /etc/passwd

### jenkins 삭제 초기ㅗ하
kubectl get deployment
kubectl get pods
helm uninstall jenkins
rm -rf /nfs_shared/jenkins/*
 ~/_Book_k8sInfra/ch5/5.3.1/jenkins-install.sh

 ##
 kubectl get services
 ### 
 kubectl get serviceaccount
 ## 권한 부여 
 kubectl create clusterrolebinding jenkins-cluster-admin \
  --clusterrole=cluster-admin --serviceaccount=default:jenkins
  ## 권한 부여 결과 output
  clusterrolebinding.rbac.authorization.k8s.io/jenkins-cluster-admin created
  ## yaml로 output 권한 보기
  kubectl get clusterrolebinding jenkins-cluster-admin -o yaml

  freestyle로 jenkins설정
  https//github.com/iac-source/echo-ip
https://github.com/changwng/echo-ip 을 CI/CD로 한다.
https://github.com/changwng/blue-green  : 블루그린 방식 사용 CI/CD
#jenkins build Exucte shell입력 스크립트
docker build -t 192.168.1.10:8443/echo-ip .
docker push 192.168.1.10:8443/echo-ip
kubectl create deployment fs-echo-ip --image=192.168.1.10:8443/echo-ip
kubectl expose deployment fs-echo-ip --type=LoadBalancer --name=fs-echo-ip-svc --port=8080 --target-port=80
#jenkins에서 빌드 하면 http://192.168.1.12:8080/로 접근하면된다.
kubectl delete service fs-echo-ip-svc
kubectl delete deployment fs-echo-ip


### 블루 그린 배포 전략으로 배포 처리 한후에
kubectl get deployments,service --selector=app=dashboard
## 전체 배포된것 삭제 처리
kubectl delete deployments,service,configmap --selector=app=dashboard
kubectl config view

# github 기준으로 지속적 배포 작업 진행 하도록 하는것
https://github.com/Woong-For-Mohani/GitOpts.git mymohani@gmail.com /cw89qn~ , rrn!!
https://192.168.1.10:6443

## k-k8s 머신에서 홈디렉토리
mkdir ~/gitopts
cd gitopts
git init

## github 자격증명 helper설정
git config --global user.name "mymohani"
git config --global user.email "mymohani@gmail.com"
git config --global credential.helper "store --file ~/.git-cred"

git remote add origin https://github.com/Woong-For-Mohani/GitOpts.git
cp ~/_Book_k8sInfra/ch5/5.5.1/* ~/gitopts  #사전 준비 파일 복사
sed -i 's,Git-URL,https://github.com/Woong-For-Mohani/GitOpts.git,g' Jenkinsfile
git add .
git config --list
git commit -m "init commit"
git branch -M main # -M(move)
git push -u origin main # -u (--set-upstream)

#jenkins에서 지속적 통합으로 세팅 : kuberanate continuous Deploy 플러그인 설치
#Jenkins Home> 관리> Manage Credentials로 가서 쿠버네티스용 지속적 배포 플러그인의 새로운 자격증명 정보 추가
# 쿠버 설정 파일에 대한 자격증명 가져오려면 현재 쿠버 설정 마스터 노드 m-k8s에 접속 권한이 필요함
# 쿠버에서 m-k8s 마스터 노드에 접속 가능한 SSH및 kubeconfig 접속을 위한 인증 정보 설정
# New Item에 dpy-pl-gitops 로 하여 Pipeline으로 설정
# Poll SCM 에서 schedule에 */10 * * * * 로 크론 표현식을 입력 10분마다 실행
# Jenkins 표현식은 H/* * * * * 로 1분마다 한번씩
# gitops-nginx로 배포되었는지 확인
kubectl get deployments
sed -i 's/replicas: 2/replicas: 5/' deployment.yaml
git add . ; git commit -m "change replicas count"; git push -u origin main

# slack noti 연결
팀 하위 도메인: mthinkws
통합 토큰 자격 증명 ID: swbdsnolMfWIYo4M88B0y8Pb 토큰을 값으로 사용하여 암호 텍스트 자격 증명을 생성합니다.

cp ~/_Book_k8sInfra/ch5/5.5.2/Jenkinsfile ~/gitop

m-k8s 에서
bpytop : 리소스 모니 터링
#프로메테우스로 모니터링 데이터 수집과 통합
- prometheus-server : 수집기, 시계열 데이터베이스, 웹 ㅕㅑ
- node-exporter : 외부로 공개 역할
- kube-state-metrics: 프로메테우스 서비가 수집할수 있는 메트릭 데이터 변환후 공개
- alertmanager : alert 규칙 설정, 메세지 대상에 전달
- 푸시 게이트 웨이(push gateway) : 배치와 스케줄 작업시 수행되는 일회성 작업들의 상태 저장 프로메테우스가 주기적으로 가져갈수 있도록
  공개

  # 프로메테우스 설치
 # 1. 공유 디렉토리 생성후 pv, pvc 생성및 할당 접근 ID : 1000
    ~/_Book_k8sInfra/ch6/6.2.1/prometheus-server-preconfig.sh
    #---------------------------------------------
    /nfs_shared/prometheus/server
    [Step 4/4] Task [Create PV,PVC for prometheus-server]
    persistentvolume/prometheus-server created
    persistentvolumeclaim/prometheus-server created
   #---------------------------------------------  
#2. 프로메테우스 설치
 ~/_Book_k8sInfra/ch6/6.2.1/prometheus-install.sh
 설치 확인
 kubectl get pods --selector=app=prometheus
 kubectl get pods --selector=app=prometheus -o wide

 ##--------------- out put 
        The Prometheus server can be accessed via port 80 on the following DNS name from within your cluster:
        prometheus-server.default.svc.cluster.local


        Get the Prometheus server URL by running these commands in the same shell:
        NOTE: It may take a few minutes for the LoadBalancer IP to be available.
                You can watch the status of by running 'kubectl get svc --namespace default -w prometheus-server'

        export SERVICE_IP=$(kubectl get svc --namespace default prometheus-server -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
        echo http://$SERVICE_IP:80

             http://192.168.1.14:80  : 현재 설치된 서버에서 확인

        #################################################################################
        ######   WARNING: Pod Security Policy has been moved to a global property.  #####
        ######            use .Values.podSecurityPolicy.enabled with pod-based      #####
        ######            annotations                                               #####
        ######            (e.g. .Values.nodeExporter.podSecurityPolicy.annotations) #####
        #################################################################################
        ip to coredns 질의문
        kubectl run net --image=sysnet4admin/net-tools --restart=Never --rm -it -- nslookup 192.168.1.14
 ##--------------- out put 

kubectl get configmap prometheus-server -o yaml | nl
## 프로메테우스 exporter 설정
kubectl apply -f ~/_Book_k8sInfra/ch6/6.2.3/nginx-status-annot.yaml
cat ~/_Book_k8sInfra/ch6/6.2.3/nginx-status-annot.yaml | nl
# 이미 만든 메트릭스 공개
kubectl apply -f ~/_Book_k8sInfra/ch6/6.2.3/nginx-status-metrics.yaml
# 메트릭스 삭제
kubectl delete -f ~/_Book_k8sInfra/ch6/6.2.3/nginx-status-metrics.yaml

# 헬름으로 그라파나 설치 하기
~/_Book_k8sInfra/ch6/6.4.1/grafana-preconfig.sh
~/_Book_k8sInfra/ch6/6.4.1/grafana-install.sh
# 공유 폴더 생성
/nfs_shared/grafana
### --------------------------------
1. Get your 'admin' user password by running:

   kubectl get secret --namespace default grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

2. The Grafana server can be accessed via port 80 on the following DNS name from within your cluster:

   grafana.default.svc.cluster.local

   Get the Grafana URL to visit by running these commands in the same shell:
NOTE: It may take a few minutes for the LoadBalancer IP to be available.
        You can watch the status of by running 'kubectl get svc --namespace default -w grafana'
     export SERVICE_IP=$(kubectl get svc --namespace default grafana -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
     http://$SERVICE_IP:80
### ------------------------------------
kubectl get deployment grafana
#--- 노드 네트워크 평균 송신/수신 트래픽
avg(rate(node_network_transmit_bytes_total[5m])) by (kubernetes_node)
{{ kubernetes_node}} - transmit
Y축: Data(Metric) -> bytes(Metric)
-- Query 추가
avg(rate(node_network_receive_bytes_total[5m])) by (kubernetes_node) * -1
{{ kubernetes_node}} - receive

노드 상태
up{job="kubernetes-nodes"}
{{instance}}

label_vaules(kube_pod_info,namespace)

# cubectl 자동완성 사용하기
~/_Book_k8sInfra/app/A.kubectl-more/bash-completion.sh
~/_Book_k8sInfra/app/A.kubectl-more/k8s_rc.sh

# docker container 런타임 저장
docker run -d nginx
docker export 컨테이너 > nginx.tar
tar -C nginx-container -xvf nginx.tar


CrashLoopBackOff
kubectl delete pod `kubectl get pods | awk '$3 == "CrashLoopBackOff" {print $1}'`
kubectl apply -f gateway-mariadb.yml
kubectl apply -f gateway-k8s






//------------- minukube start
https://minikube.sigs.k8s.io/docs/start/
https://minikube.sigs.k8s.io/docs/tutorials/multi_node/

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
----삭제처리
minikube status
minikube stop
minikube delete --all




minikube --cpus 6 start

cd /home/vagrant/workgoh/jhipster-microservices-example/kubernetes
./kubectl-apply.sh -k

The deployment process can take several minutes to complete. Run minikube dashboard to see the deployed containers. 
You can also run  to see the status of each pod.
kubectl get po -o wide --watch
minikube service blog 




minikube kubectl -- get po -A

Deploy applications
kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.4
kubectl expose deployment hello-minikube --type=NodePort --port=8080


kubectl get services hello-minikube
minikube service hello-minikube

kubectl port-forward service/hello-minikube 7080:8080


--- loadBalance Deployments
kubectl create deployment balanced --image=k8s.gcr.io/echoserver:1.4  
kubectl expose deployment balanced --type=LoadBalancer --port=8080
minikube tunnel
--// other windows
kubectl get services balanced


Manage your cluster
minikube pause
minikube stop

minikube config set memory 20000
minikube config set cpus 4
minikube config view
minikube addons list

Delete all of the minikube clusters:

minikube delete --all

----------minikube mulinode start
minikube start --nodes 2 -p multinode-demo
kubectl get nodes
minikube status -p multinode-demo
kubectl get pod,svc -n kube-system
------------------ kubernate 생성 테스트
git clone https://github.com/oktadev/jhipster-microservices-example

cd blog, store
./mvnw package -Pprod docker:build

cd ./kubernetes 
jhipster kubernetes


kubectl apply -f registry
kubectl apply -f blog
kubectl apply -f store

minikube dashboard

kubectl get po -o wide --watch
minikube service blog
kubectl delete deployment --all