<h2>에세이</h2>

> docker : 리눅스의 응용 프로그램들을 소프트웨어 컨테이너 안에 배치시키는 일을 자동화

<br/>

<h3>1. Front 도커 이미지 제작</h3> 

```python
# skeleton 코드 가져오기
git clone https://lab.ssafy.com/ssafyadmin/webmobile2 skeleton.git
    
# 파일 위치 이동
cd webmobile2-skeleton
cd front-sk

# docker 이미지 생성
# 그런데 이게 안되서 vscode로 실행 후 docker 설치및 Dockerfile 파일 추가
dokcer build . -t front:0.1
```

<br/>

<h4>Dockerfile</h4>

```python
FROM node:lts-alpine

# install simple http server for serving static content
RUN npm install -g http-server

# make the 'app' folder the current working directory
WORKDIR /app

# copy both 'package.json' and 'package-lock.json' (if available)
COPY package*.json ./

# install project dependencies leaving out dev dependencies
RUN npm install --production

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .

# build app for production with minification
RUN npm run build

EXPOSE 8080
CMD [ "http-server", "dist" ]
```

<br/>

<h4>이미지 추가 완료</h4>

```
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
front               0.1                 2acb57e5217d        2 hours ago         277MB
```

<br/>

<br/>

<h3>2. Back 도커 이미지 제작</h3> 

```python
# 파일 위치 이동
cd back-sk

# 실행 확인
./ mvnw package
java -jar target/webcuration-0.0.1-SNAPSHOT.jar

# docker 이미지 생성
dokcer build . -t back:0.1
```

<br/>

<h4>Dockerfile</h4>

```python
# Start with a base image containing Java runtime
FROM java:8

# Add a volume to /server
VOLUME /server

# Make port 8080 available to the world outside this container
EXPOSE 8080

# The application's jar file
ARG JAR_FILE=target/webcuration-0.0.1-SNAPSHOT.jar

# Add the application's jar to the container
ADD ${JAR_FILE} to-do-springboot.jar

# Run the jar file
ENTRYPOINT ["java","-jar","/to-do-springboot.jar"]
```

<br/>

<h4>이미지 추가 완료</h4>

```
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
back                0.1                 a8f6b29cb9f7        40 minutes ago      672MB
```

<br/>

<br/>

<h3>3. DB 도커 이미지 제작</h3> 

```python
# 개발용 DB 로 사용할 MySQL 컨테이너 실행 및 정상 실행 여부 조회
docker run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=ssafyssafyroomroom -e MYSQL_DATABASE=ssafy -d mysql --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci


# MySQL 서버 컨네이너 안에 포함되어 있는 mysql 클라이언트 명령어를 실행시켜 DB 접속 테스트
docker exec -it mysql mysql -uroot -p ssafy

# 비밀번호
ssafyssafyroomroom

# 확인
show databases;

# 종료
exit

# 태그 이름 변경 및 삭제
docker tag mysql:latest mysql:0.1
docker rmi mysql
```

<br/>

<h4>이미지 추가 완료</h4>

```
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
mysql               0.1                 9b51d9275906        7 days ago          547MB
```

<br/>

<h4>전체 실행 결과</h4>

```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
back                0.1                 a8f6b29cb9f7        58 minutes ago      672MB
front               0.1                 2acb57e5217d        2 hours ago         277MB
mysql               0.1                 9b51d9275906        7 days ago          547MB
```

<br/>

<br/>

<h2>에세이</h2>

<br/>

* 도커를 처음 접하고 docker toolbox 설치부터 환경 설정까지 많은 어려움이 있었습니다.
* 또한, 이미지 생성까지도 많은 오류가 있어서 오랜 시간이 걸렸습니다.
* 그래서 다음에는 안 까먹을거 앞으로 잘할 수 있을 거 같습니다.


