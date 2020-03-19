<h2>Colab 기반 얼굴 인식 입문</h2>

<br/>

<h3>심화 과제</h3>

기본과제는 설명 생략합니다 ( basic.ipynb 파일 참고 )

<br/>

* 기본 설정 및 선언

```python
from google.colab import drive
drive.mount('/gdrive')

!pip install face_recognition

import cv2, os
import face_recognition as fr
from IPython.display import Image, display
from matplotlib import pyplot as plt
```

<br/>

* 여러 명 얼굴 인식

```python
image_path = "/gdrive/My Drive/colab/red.jpg"

image = fr.load_image_file(image_path)
face_locations = fr.face_locations(image)

for (top, right, bottom, left) in face_locations:
  cv2.rectangle(image, (left, top), (right, bottom), (0,255,0), 3)

# 이미지 버퍼 출력
plt.rcParams["figure.figsize"] = (16,16)
plt.imshow(image)
plt.show()
```

<img src="https://github.com/danidanee/img/blob/master/day9/colab1.png?raw=true"/>

<br/><br/><br/><br/>

* 파일에서 얼굴 추출해 list에 저장

```python
plt.rcParams["figure.figsize"] = (1,1)

# 이미지 파일을 로드하여 known_person_list 리스트 생성
known_person_list = []
known_person_list.append(fr.load_image_file("/gdrive/My Drive/colab/person1.jpg"))
known_person_list.append(fr.load_image_file("/gdrive/My Drive/colab/person2.jpg"))
known_person_list.append(fr.load_image_file("/gdrive/My Drive/colab/person3.jpg"))
known_person_list.append(fr.load_image_file("/gdrive/My Drive/colab/person4.jpg"))
known_person_list.append(fr.load_image_file("/gdrive/My Drive/colab/person5.jpg"))

# 얼굴을 인식을 하여 감지된 부분을 잘라낸 다음 known_face_list에 저장
known_face_list = []
for person in known_person_list:

  # 얼굴 좌표를 알아내서 잘라낸다
  top, right, bottom, left = fr.face_locations(person)[0]
  face_image = person[top:bottom, left:right]

  # known_face_list에 잘라낸 face_image를 저장
  known_face_list.append(face_image)

# known_face_list에 저장된 얼굴들 출력
for face in known_face_list:
  plt.imshow(face)
  plt.show()
```

<img src="https://github.com/danidanee/img/blob/master/day9/colab2.JPG?raw=true"/>

<br/><br/><br/><br/>

* 

```python
# 기존리스트에 없는 새로운 파일을 열어서
unknown_person = fr.load_image_file("/gdrive/My Drive/colab/unknown.jpg")

# 얼굴좌표를 알아내서 잘라낸다
top, right, bottom, left = fr.face_locations(unknown_person)[0]
unknown_face = unknown_person[top:bottom, left:right]

# unknown_face 이라는 타이틀을 붙여서 표시
plt.title("unknown_face")
plt.imshow(unknown_face)
plt.show()
```

<img src=""/>

<br/><br/><br/><br/>

* 비교 대상 얼굴 추출 및 인코딩

```python
# 기존리스트에 없는 새로운 파일을 열어서
unknown_person = fr.load_image_file("/gdrive/My Drive/colab/unknown.jpg")

# 얼굴좌표를 알아내서 잘라낸다
top, right, bottom, left = fr.face_locations(unknown_person)[0]
unknown_face = unknown_person[top:bottom, left:right]

# unknown_face 이라는 타이틀을 붙여서 표시
plt.title("unknown_face")
plt.imshow(unknown_face)
plt.show()
```

<img src="https://github.com/danidanee/img/blob/master/day9/colab3.png?raw=true"/>

<img src="https://github.com/danidanee/img/blob/master/day9/colab4.png?raw=true"/>

<br/><br/><br/><br/>

* 이미지 비교

```python
# 등록된 얼굴리스트를 비교
for face in known_face_list:

  # 등록된 얼굴을 128-dimensional face 인코딩
  enc_known_face = fr.face_encodings(face)

  # 등록된 얼굴과 새로운 얼굴을 distance를 얻기
  distance = fr.face_distance(enc_known_face, enc_unknown_face[0])

  # distance 수치를 포함한 얼굴 출력
  plt.title("distance: " + str(distance))
  plt.imshow(face)
  plt.show()
```

<img src="https://github.com/danidanee/img/blob/master/day9/colab5.JPG?raw=true"/>

<br/><br/><br/><br/>

<h3>후기</h3>

<br/>

* 빅데이터와 markdown의 업그레이드 버전 같았습니다
* 활용성도 좋고 편리해서 재밌었습니다.
* 얼굴인식이 어려울거라고 생각했는데 pdf를 따라하니 쉽게 되서 신기했습니다.

