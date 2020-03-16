<h1>Day6 에세이</h1>

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

* 결과 화면 (일부 캡쳐)

<img src="https://github.com/danidanee/self-online/blob/master/day6/addr_sql.JPG?raw=true"/>

<br/>

<br/>

<h3>Jupyter Notebook 방식</h3>

<br/>

```python
# 선언
import pandas as pd
from datetime import datetime

# import
df = pd.read_csv('data/보건복지부.csv', encoding='utf-8', index_col=0)

# 서울인 곳만 
boolean = df['시도'] == '서울'
df = df.loc[boolean]

# 내 정보 입력
df['아이디'] = 'ssongda9412'
df['입력일자'] = datetime.today().strftime("%Y%m%d%H%M%S")
```

<br/>

* 결과 화면

|      | 검체채취 가능여부 | 시도 | 시군구 |                         의료기관명 |                                                    주소 | 대표 전화번호 |      아이디 |       입력일자 |
| ---: | ----------------: | ---: | -----: | ---------------------------------: | ------------------------------------------------------: | ------------: | ----------: | -------------: |
| 연번 |                   |      |        |                                    |                                                         |               |             |                |
|    1 |                 Y | 서울 | 강남구 |                       강남구보건소 |                   서울특별시 강남구 선릉로 668 (삼성동) |  02-3423-5555 | ssongda9412 | 20200316180324 |
|    2 |                 Y | 서울 | 강남구 |                       삼성서울병원 |        서울특별시 강남구 일원로 81 (일원동, 삼성의료원) |  02-3410-2114 | ssongda9412 | 20200316180324 |
|    3 |                 Y | 서울 | 강남구 | 연세대학교의과대학강남세브란스병원 | 서울특별시 강남구 언주로 211, 강남세브란스병원 (도곡동) |  02-2019-3114 | ssongda9412 | 20200316180324 |
|    4 |                 Y | 서울 | 강동구 |             강동경희대학교의대병원 |                   서울특별시 강동구 동남로 892 (상일동) |   02-440-7000 | ssongda9412 | 20200316180324 |
|    5 |                 Y | 서울 | 강동구 |                       강동구보건소 |                    서울특별시 강동구 성내로 45 (성내동) |  02-3425-8565 | ssongda9412 | 20200316180324 |
|  ... |               ... |  ... |    ... |                                ... |                                                     ... |           ... |         ... |            ... |
|   65 |                 Y | 서울 |   중구 |               인제대학교서울백병원 |                    서울특별시 중구 마른내로 9 (저동2가) |  02-2270-0114 | ssongda9412 | 20200316180324 |
|   66 |                 Y | 서울 |   중구 |                         중구보건소 |                  서울특별시 중구 다산로39길 16 (무학동) |  02-3396-5181 | ssongda9412 | 20200316180324 |
|   67 |                 N | 서울 |   중구 |          중구보건소 명동선별상담소 |                               서울특별시 중구 퇴계로115 |  02-3396-5181 | ssongda9412 | 20200316180324 |
|   68 |                 Y | 서울 | 중랑구 |                       중랑구보건소 |                 서울특별시 중랑구 봉화산로 179 (신내동) |  02-2094-0800 | ssongda9412 | 20200316180324 |
|   69 |                 Y | 서울 | 중랑구 |                         서울의료원 |                            서울특별시 중랑구 신내로 156 |  02-2276-8333 | ssongda9412 | 20200316180324 |

69 rows × 8 columns

<br/>

<br/>

<br/>

<br/>

* 하면서 어려웠던 점

```
처음에 C:\ProgramData\MySQL\MySQL Server 8.0 파일의 my.ini 파일을 수정했다가 에러가 떠서 인터넷에 있는 모든 방법을 써도 안고쳐져서 몇번이나 mysql을 삭제했다 다시 깔았습니다.

그래서 시간안에 못할거같아 jupyter notebook 방식으로 해도 된다고 해서 그 방식으로 과제를 제출했습니다.

하지만 아쉬움이 남아 다시 mysql을 깔고 C:\ProgramData\MySQL\MySQL Server 8.0\Uploads 여기에 파일을 넣어주었지만 되지 않았습니다.
근데 에러코드에 한글로된 이름이 깨지는 걸 보고 영어로 바꿨더니 되서 정말 허무했지만 1번 과제를 다시 해서 추가로 제출합니다!!

앞으로도 포기하지 않고 여러 방식으로 과제를 하겠습니다~
```



