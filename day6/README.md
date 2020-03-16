<h1>에세이</h1>

<br/>

<h3>mysql 방식</h3>

<br/>

* 도로명 테이블 생성

```mysql
create table addr
(
	도로명코드 varchar(120) not null,
    도로명 varchar(20) not null,
    도로명로마자 varchar(160) null,
    읍면동일련번호 varchar(160) null,
    시도명 varchar(50) null,
    시도로마자 varchar(100) null,
    시군구명 varchar(50) null,
    시군구로마자 varchar(100) null,
    읍면동명 varchar(50) null,
    읍면동로마자 varchar(100) null,
    읍면동구분 varchar(1) null,
    읍면동코드 varchar(3) null,
    사용여부 varchar(1) null,
    변경사유 varchar(1) null, 
    변경이력정보 varchar(14) null, 
    고시일자 varchar(8) null, 
    말소일자 varchar(8) null
);
```

<br/>

* 데이터 값 import

```mysql
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/road.txt' 
REPLACE
INTO TABLE addr 
FIELDS TERMINATED BY '|' 
OPTIONALLY ENCLOSED BY '' 
LINES TERMINATED BY '\n'
(
	@도로명코드,
    @도로명 ,
    @도로명로마자 ,
    @읍면동일련번호 ,
    @시도명 ,
    @시도로마자 ,
    @시군구명 ,
    @시군구로마자 ,
    @읍면동명 ,
    @읍면동로마자 ,
    @읍면동구분 ,
    @읍면동코드 ,
    @사용여부 ,
    @변경사유 ,
    @변경이력정보 ,
    @고시일자 ,
    @말소일자 
)
SET
도로명코드 = @도로명코드,
도로명 = @도로명,
도로명로마자  = @도로명로마자 ,
읍면동일련번호  = @읍면동일련번호 ,
시도명  = @시도명 ,
시도로마자  = @시도로마자 ,
시군구명  = @시군구명 ,
시군구로마자  = @시군구로마자 ,
읍면동명  = @읍면동명 ,
읍면동로마자  = @읍면동로마자 ,
읍면동구분  = @읍면동구분 ,
읍면동코드  = @읍면동코드 ,
사용여부  = @사용여부 ,
변경사유  = @변경사유 ,
변경이력정보  = @변경이력정보 ,
고시일자  = @고시일자 ,
말소일자  = @말소일자 ;
```

<br/>

* 필요한 데이터 외 삭제

```mysql
# columns 삭제
alter table addr
	drop 도로명로마자,
	drop 시도로마자,
    drop 시군구명,
	drop 시군구로마자,
    drop 읍면동명,
    drop 읍면동로마자,
    drop 읍면동구분,
    drop 읍면동코드,
    drop 사용여부,
    drop 변경사유,
    drop 변경이력정보,
    drop 고시일자,
    drop 말소일자;
```

```mysql
# 행 삭제
delete from addr where 시도명 != "서울특별시";
```

<br/>

* 본인 정보 추가

```mysql
ADD COLUMN `아이디` VARCHAR(45) NOT NULL DEFAULT 'ssongda9412' AFTER `시도명`,
ADD COLUMN `입력시간` DATETIME NOT NULL DEFAULT now() AFTER `아이디`;
```

<br/>

* 결과 화면