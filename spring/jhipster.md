jhipster upgrade
https://www.jhipster.tech/upgrading-an-application/
``` shell
git checkout jhipster_upgrade
git checkout --patch master .yo-rc.json
git checkout --patch master .jhipster
git commit -a
git push --set-upstream origin jhipster_upgrade
git checkout master
```
# 2022-02-26 Jhipster Study
```
git clone https://github.com/jhipster/jhipster-lite
git clone https://github.com/jhipster/generator-jhipster-native
git clone https://github.com/mraible/spring-native-examples
```
----------------------------------------------------


https://velog.io/@max9106/JHipster-JHipster-liquibase-wak17x0f0i  // Junseo Kim
git clone https://github.com/KJunseo/JHipster_custom_user_management
https://velog.io/@max9106/Spring-Security-csrf
https://github.com/KJunseo/JHipster-image-handling
https://github.com/KJunseo/jhipster_board_test1
```
/*
2019.06.17 ~ 2019.08.22 강의실 예약 시스템(한동대학교) 개발
2019.10.19 교내에서 TOPCIT 시험 응시
2019.10.22 ~ 2019.11.28 클라우드 기반의 비즈니스 정보관리 어플리케이션 개발
2019.11.28 한동대학교 SW페스티벌 대상(강의실 예약 시스템)
2019.11.28 한동대학교 공학프로젝트 기획 인기상&우수상(클라우드 기반의 비즈니스 정보관리 어플리케이션)
2019.11.28 교내 TOPCIT 고득점자 시상 장려상 수상
2019.11.12 ~ 2019.12.07 GPS 기반 일정관리 어플리케이션 개발
2020.01.14 ~
2020.02.15 ~ 2020.02.16 스프링 러너 Mastering Spring Web 101 Workshop 참여
*/
```
https://www.appvillage.or.kr/
건강가이드/cw89dkagh12#$!!
전국 약국 정보 서비스
https://www.data.go.kr/data/15000576/openapi.do

1. JHipster javascript 성능 테스트
 1.1 Gatling-api load test :https://daddyprogrammer.org/post/9115/gatling-api-load-test-setup-environment/
     - scala로 작성되며 , Intellij에 세팅해서 사용가능함

2. Modeling https://start.jhipster.tech/jdl-studio/
   download jhipster-jdl.jh
   jhipster jdl jhipster-jdl.jh

2. Books 
  https://github.com/packtpublishing/full-stack-development-with-jhipster
  git clone https://github.com/changwng/Full-Stack-Development-with-JHipster


4. JetBrain 설치 위치
cd /home/vagrant/.local/share/JetBrains/Toolbox/apps/IDEA-U/ch-0/203.7148.57/bin/idea.sh



http://localhost:9000/#/
http://localhost:9999/ uaa
http://localhost:8761/
http://localhost:8080 //gateway
http://localhost:8081/ QuotesApp 
mvn install
mvnw
jdbc:h2:file:./target/h2db/db/quotes;DB_CLOSE_DELAY=-1
url: jdbc:h2:mem:db;DB_CLOSE_DELAY=-1;INIT=CREATE SCHEMA IF NOT EXISTS USERS



PWA Support
jhipster registry
git clone https://github.com/jhipster/jhipster-registry
git clone https://github.com/jhipster/generator-jhipster
git clone https://github.com/jhipster/jhipster-sample-app-gateway

git clone https://github.com/jhipster/jhipster-sample-app-react
git clone https://github.com/jhipster/jhipster-sample-app
git clone https://github.com/jhipster/jhipster-sample-app-microservice
git clone https://github.com/jhipster/jhipster-sample-app-oauth2
git clone https://github.com/jhipster/jhipster-sample-app-vuejs
git clone https://github.com/jhipster/jhipster-sample-app-react
git clone https://github.com/jhipster/jhipster-sample-app-gateway
git clone https://github.com/jhipster/jhipster-sample-app-elasticsearch
git clone https://github.com/jhipster/jhipster-sample-app-websocket
git clone https://github.com/jhipster/jhipster-sample-app-hazelcast
git clone https://github.com/jhipster/jhipster-sample-app-dto
git clone https://github.com/jhipster/jhipster-sample-app-cassandra
git clone https://github.com/jhipster/jhipster-automated-samples
git clone https://github.com/jhipster/jhipster-sample-app-kotlin
git clone https://github.com/jhipster/jhipster-sample-app-noi18n

npm install -g generator-jhipster

jhipster quotes에 에러 발생시
<groupId>io.springfox</groupId>
            <artifactId>springfox-swagger2</artifactId>
            <exclusions>
                <exclusion>
                    <groupId>org.mapstruct</groupId>
                    <artifactId>mapstruct</artifactId>
                </exclusion>
            </exclusions>

https://www.jhipster.tech/documentation-archive/v7.0.0-beta.1/common-ports/
스타트업에 traefik + docker-swarm을 추천하는 이유
https://gist.github.com/rabelais88/a458c1f45eea7d28240c64621853bb64
Traefik은 마이크로 서비스를 쉽게 배포할 수 있도록 해주는 최신 HTTP reverse proxy 및 로드밸런서입니다.

[Svelte] 스벨트란 무엇인가? Reactive App 개발을 위한 새로운 접근법
 https://im-developer.tistory.com/203
Svelte와 React의 차이
Framework가 아닌 Compiler
 Svelte로 만든 결과물들은 대개 앱 running이 매우 빠르다
 
cd jhipster-registry
mvnw -Pdev,webpack
For development run ./mvnw -Pdev,webpack to 
just start in development or run ./mvnw and run npm install && npm start for hot reload of client side code.
For production profile run ./mvnw -Pprod

changwng@gmail.com/cw8904
https://start.jhipster.tech/jdl-studio/


```code
jhipster registry
git clone https://github.com/jhipster/jhipster-registry
git clone https://github.com/jhipster/generator-jhipster
git clone https://github.com/changwng/jhipster-online

https://github.com/changwng/jhipster.github.io
https://github.com/jdubois/gs-spring-boot-docker
https://start.jhipster.tech/ changwng@gmail.com/cw8904

https://github.com/jdubois?tab=overview&from=2020-12-01&to=2020-12-31

git clone https://github.com/jhipster/jhipster-sample-app-gateway
git clone https://github.com/jhipster/jhipster-sample-app-react
git clone https://github.com/jhipster/jhipster-sample-app
git clone https://github.com/jhipster/jhipster-sample-app-microservice
git clone https://github.com/jhipster/jhipster-sample-app-oauth2
git clone https://github.com/jhipster/jhipster-sample-app-vuejs
git clone https://github.com/jhipster/jhipster-sample-app-react
git clone https://github.com/jhipster/jhipster-sample-app-gateway
git clone https://github.com/jhipster/jhipster-sample-app-elasticsearch
git clone https://github.com/jhipster/jhipster-sample-app-websocket
git clone https://github.com/jhipster/jhipster-sample-app-hazelcast
git clone https://github.com/jhipster/jhipster-sample-app-dto
git clone https://github.com/jhipster/jhipster-sample-app-cassandra
git clone https://github.com/jhipster/jhipster-automated-samples
git clone https://github.com/jhipster/jhipster-sample-app-kotlin
git clone https://github.com/jhipster/jhipster-sample-app-noi18n  
git clone https://github.com/jhipster/jdl-samples


git clone https://github.com/jhipster/jhipster-sample-app-vuejs
git clone https://github.com/jhipster/jhipster-sample-app-react
```