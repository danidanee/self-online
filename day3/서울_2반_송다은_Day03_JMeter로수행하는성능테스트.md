<h2>JMeter로 수행하는 성능 테스트</h2>

> 특수한 상황에서 정상적으로 시스템의 작동을 보증하는지 확인하기 위한 테스트

<br/>

1. 측정 시나리오 설정

<br/>

* 로그인 기능을 대상으로 한 기본 값 설정

<img alt="http request" src="https://github.com/danidanee/img/blob/master/day3/HTTP%20Request.png?raw=true"/>

<br/>

<br/>

<br/>

<br/>

2. 100 개의 쓰레드 여기서 1 쓰레드 =1 사용자 로 StartupTime:20sec, Hold Load:60sec,
   Shutdown:10sec 로 맞춘 뒤 하단 이미지 참조 아래 항목을 측정
   * TPS, 응잡시간

<br/>

* 쓰레드 항목 값 설정

<img alt="thread group" src="https://github.com/danidanee/img/blob/master/day3/thread_group.JPG?raw=true"/>

<br/>

<br/>

* 1차 테스트

<img alt="thread group" src="https://github.com/danidanee/img/blob/master/day3/Transactions%20per%20Second1.png?raw=true"/>

<img alt="thread group" src="https://github.com/danidanee/img/blob/master/day3/Response%20Times%20Over%20Time1.png?raw=true"/>

<br/>

* 2차 테스트

<img alt="thread group" src="https://github.com/danidanee/img/blob/master/day3/Transactions%20per%20Second2.png?raw=true"/>

<img alt="thread group" src="https://github.com/danidanee/img/blob/master/day3/Response%20Times%20Over%20Time2.png?raw=true"/>

<br/>

<br/>

<br/>

<br/>

3. (테스트에 실패하지 않은 경우) 우리 시스템의 한계 성능은 얼마까지 나올까요? (최대사용자, TPS)

<br/>

* Tread Count = 300
  * 300일때까지만 응답속도가 설정한 90초 정도에 끝난다

<img alt="thread group" src="https://github.com/danidanee/img/blob/master/day3/r300.png?raw=true"/>

<img alt="thread group" src="https://github.com/danidanee/img/blob/master/day3/r300.png?raw=true"/>

<br/>

* Tread Count =1000
  * response time 이 기존과 다르게 끝날때까지 많이 과부화 된다.

<img alt="thread group" src="https://github.com/danidanee/img/blob/master/day3/tps1000.png?raw=true"/>

<img alt="thread group" src="https://github.com/danidanee/img/blob/master/day3/r1000.png?raw=true"/>

<br/>

* Tread Count = 2000

<img alt="thread group" src="https://github.com/danidanee/img/blob/master/day3/tsp2000.png?raw=true"/>

<img alt="thread group" src="https://github.com/danidanee/img/blob/master/day3/r2000.png?raw=true"/>

<br/>

* Tread Count = 5000
  * failure 가 뜨는 값을 찾기 위해 5000까지 했지만 시간은 많이 초과되도 성공적으로 실행된다

<img alt="thread group" src="https://github.com/danidanee/img/blob/master/day3/tsp5000.png?raw=true"/>

<img alt="thread group" src="https://github.com/danidanee/img/blob/master/day3/r5000.png?raw=true"/>

<br/>

* Tread Count = 7500
  * 이때부터 성공하는 값도 있지만 failure 가 뜨는 값이 뜨면서 시스템의 전반적인 성능이 떨어진다.

<img alt="thread group" src="https://github.com/danidanee/img/blob/master/day3/tsp7500.png?raw=true"/>

<img alt="thread group" src="https://github.com/danidanee/img/blob/master/day3/r7500.png?raw=true"/>

<br/>



