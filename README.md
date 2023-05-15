

![logo](https://user-images.githubusercontent.com/119032693/235040164-0a2cb473-4c43-4e20-874d-eb6b0ef739a5.png)
# SPOUTING<br>시설예약, 쇼핑, SNS까지 올인원 피트니스 서비스
</br>


## ⚽ 프로젝트 목적

✔ 2030 세대를 공략한 1인 가구 중심의 운동 예약 서비스</br>
✔ 한번의 가입으로 모든 지점 이용이 가능하며 낮은 진입장벽으로 부담없이 접근 가능</br>
✔ 자체 상품 판매, SNS 기능을 제공하여 지속적인 흥미 유발</br>
</br>
## 🏀 개발 기간

2023.03.27 - 2023.05.09
</br>

## 🎱 개발 환경
### 사용언어
<img src="https://img.shields.io/badge/java-2C2255?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white"> <img src="https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jQuery&logoColor=white"> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white"> <img src="https://img.shields.io/badge/CSS-1572B6?style=for-the-badge&logo=CSS&logoColor=white"> <img src="https://img.shields.io/badge/JSTL-E34F26?style=for-the-badge&logo=JSTL&logoColor=white">

### 기술스택
<img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> <img src="https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=Oracle&logoColor=white"> <img src="https://img.shields.io/badge/Apache Maven-C71A36?style=for-the-badge&logo=Apache Maven&logoColor=white"> <img src="https://img.shields.io/badge/mybatis-2C2255?style=for-the-badge&logo=mybatis&logoColor=white">

### 개발환경
<img src="https://img.shields.io/badge/Eclipse IDE-2C2255?style=for-the-badge&logo=Eclipse IDE&logoColor=white"> <img src="https://img.shields.io/badge/Apache Tomcat-F8DC75?style=for-the-badge&logo=Apache Tomcat&logoColor=white"> <img src="https://img.shields.io/badge/VISUAL STUDIO CODE-1572B6?style=for-the-badge&logo=VISUAL STUDICODE&logoColor=white"> <img src="https://img.shields.io/badge/GITHUB-2C2255?style=for-the-badge&logo=GITHUB&logoColor=white">
</br>

## 🏐 팀 소개 및 팀원 소개
### 육공주 > 6명의 공주들이 합심하는 팀
![image](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032693/f759929c-c037-45cd-81d8-45189f117dfa)
![image](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032693/0d84a39f-6c2e-4cfb-8fba-abd999b7b5b5)
</br>

## 🏈 주요 기능
### 회원관리
기능명 | 상세
-------|-----
회원가입 | 아이디, 비밀번호, 이름, 이메일, 성별 총 5가지의 개인정보를 입력하면 가입이 가능하며, 이메일 인증을 통해 유효성을 확인해야한다. 아이디와 이메일은 추후에 변경할 수 없고 아이디, 이메일은 회원간 중복될 수 없다.
로그인 | 회원가입 시 입력한 정보와 아이디, 비밀번호가 일치하면 로그인이 가능하다. 로그인 창에서 아이디 찾기, 비밀번호 찾기, 회원가입 페이지로 갈 수 있다. 이름과 이메일을 입력하면 아이디를 찾을 수 있고, 아이디와 이메일을 입력하면 비밀번호 찾기가 가능하다.
마이페이지 | 나의 예약내역, 주문정보, 작성글, 포인트내역, 개인정보 수정이 가능하다. 개인정보 수정 페이지로 가기 위해서는 비밀번호 확인을 거쳐야하며 이름과 비밀번호를 바꿀 수 있다.
### 포인트
기능명 | 상세
-------|-----
포인트 충전 | 포인트는 1,3,5,10만원 단위로 충전 가능하며, 1P 당 1원의 가치를 지닌다. 
포인트 내역 | 로그인 한 회원은 본인의 포인트 내역을 볼 수 있다. 
### 하루기록
기능명 | 상세
-------|-----
하루기록 작성 | 하루기록은 해당 회원만 열람할 수 있으며 작성 시 10P를 적립받는다. 제목, 내용의 수정과 글 삭제가 가능하다.
### 게시판
기능명 | 상세
-------|-----
공지사항 | 비회원과 회원 모두 공지사항을 볼 수 있다.
문의게시판 | 비회원은 문의게시판의 리스트에만 접근이 가능하고, 회원만 문의게시판 이용이 가능하다. 일반글과 비밀글로 작성이 가능하며, 카테고리별로 문의글 작성이 가능하다. 글작성자와 관리자만 댓글작성이 가능하다.
### 관리자
기능명 | 상세
-------|-----
회원관리 | 회원 정보를 조회할 수 있으며, 회원을 탈퇴시킬 수 있다. 아이디와 이름으로 회원 검색이 가능하다.
포인트 | 각 회원의 포인트 내역을 볼 수 있으며 포인트를 조정할 수 있다.
공지사항 | 관리자만 공지사항을 작성할 수 있다.
문의게시판 | 답변을 달지 않은 문의사항리스트를 통해 오래된 문의사항부터 차례로 답변해줄 수 있다. 관리자가 댓글로 답변을 달아주면 답변완료처리되며 제목에 답변완료라는 표시가 생긴다.

## 🎯 SPOUTING 살펴보기

### 1. 메인화면
![127 0 0 1_8999_](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/fa480a0d-9d60-4077-988c-d00bdf748b5c)

### 2. 회원가입
<img width="1440" alt="스크린샷 2023-05-10 오전 9 47 15" src="https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/f562dfeb-0f5e-4bb0-9c8f-9107cf4ed229">

### 3. 로그인
<img width="1440" alt="스크린샷 2023-05-10 오전 9 48 55" src="https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/cb338d78-a7b2-42b6-b583-4ffa144452c2">

3-1 아이디찾기
<img width="1440" alt="스크린샷 2023-05-10 오전 9 52 44" src="https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/c644f7ba-7493-483e-89a6-d0038771aa5f">
<img width="1440" alt="스크린샷 2023-05-10 오전 9 54 03" src="https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/261b0027-fc7f-406f-9a48-1c617e8c4b8c">

3-2 비밀번호찾기
<img width="1440" alt="스크린샷 2023-05-10 오전 9 54 37" src="https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/51097ec1-62a7-40ed-a3a0-d37b1f6227a2">
<img width="1439" alt="스크린샷 2023-05-10 오전 9 56 51" src="https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/1aeb3585-d29c-4113-8d4a-67a2d8e6f35a">

### 4. 마이페이지

4-1 개인정보 수정
<img width="1440" alt="스크린샷 2023-05-10 오전 9 57 33" src="https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/b22787bf-f55b-4543-b625-aa9aed0cd6cc">

4-2 포인트 내역
<img width="1440" alt="스크린샷 2023-05-10 오전 9 59 32" src="https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/909f7862-1128-4997-809c-18b25ffae21f">

4-3 나의 문의
<img width="1440" alt="스크린샷 2023-05-10 오전 10 00 46" src="https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/4005d30d-d723-418e-a84e-3d4d9afcff56">

4-4 나의 커뮤니티
<img width="1439" alt="스크린샷 2023-05-10 오전 10 02 05" src="https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/95b74f79-76b5-43cf-b825-cbbd639c62fb">

4-5 주문내역
<img width="1437" alt="스크린샷 2023-05-10 오전 10 03 58" src="https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/0f146253-4618-4ff0-954a-88a0a33fb257">
 
4-6 예약내역
![127 0 0 1_8999_book_myBooking_userNo=21 (1)](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/328f2b46-4daa-4794-84c3-c6188a1cf98e)


### 5. 시설 예약
![127 0 0 1_8999_book_bookView](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/392dade1-d2dc-4f31-b97f-89ffcf976afc)
![127 0 0 1_8999_book_confirm](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/f7ad9cf7-5b43-4dab-b890-c721478605ba)
![127 0 0 1_8999_book_confirm (1)](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/8503b401-d2d7-4a33-8cf1-f8dfcd375eed)


### 6. 지점 정보
6-1 스파우팅소개
<img width="1440" alt="스크린샷 2023-05-10 오전 10 59 08" src="https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/17655c33-d613-42d8-9041-ddd43d21e230">
<img width="1440" alt="스크린샷 2023-05-10 오전 11 00 08" src="https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/0de9cfb0-eb23-4d0c-aa6a-f9a732e2344f">
<img width="1440" alt="스크린샷 2023-05-10 오전 11 00 34" src="https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/5e7e04e3-7611-48bb-9baf-08b7e9bb6663">

6-2 지점찾기
<img width="1440" alt="스크린샷 2023-05-10 오전 10 17 09" src="https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/8262dbcf-486f-4bff-b6c2-30be42de9b7b">
<img width="1440" alt="스크린샷 2023-05-10 오전 10 19 11" src="https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/d7335fc0-afe9-40c4-b80c-29a2dcc3df5c">

### 7. 마켓
![sonof iptime org_9511_shop_main](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/d055cba1-5381-40f0-8c93-22d97da7d7c0)

7-1 제품리스트
![sonof iptime org_9511_shop_productList](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/0de48b91-67ba-400e-a348-bc178e7a5dc2)

7-2 장바구니
![sonof iptime org_9511_shop_cartView](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/8989d2cb-369b-4b4e-a295-920388f7d340)

7-3 주문서
![127 0 0 1_8999_cart_orderView (1)](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/0e93137b-09ec-4acc-97ee-92c19ea6b32d)

7-4 결제
![127 0 0 1_8999_cart_orderView (2)](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/6b691fb2-6246-44c2-8943-97355d6d5925)


### 8. 커뮤니티
8-1 소셜링
![sonof iptime org_9511_meeting](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/51b05dee-d65b-4c08-9ed4-f62d0081b151)
![sonof iptime org_9511_meetingDetailPage_meetingNo=201 readerNo=4](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/30709b71-cbe6-4956-9f4c-1e431f160ddf)
![sonof iptime org_9511_meetingOpenPage](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/d46ba7e2-a2a5-471f-bed4-2aeb956ae617)

8-2 SNS
![sonof iptime org_9511_sns_userNo=3](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/bb526d1d-f0f6-433a-ba1e-71b0db15d343)
![sonof iptime org_9511_sns_detail_snsPhotoNo=143](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/71e518d1-b81d-46c7-821b-3fe4727d4389)
![sonof iptime org_9511_sns_uploadPage](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/27275704-243f-4176-b4c8-5a3b9041fe4d)

### 9. 게시판
9-1 공지사항
![sonof iptime org_9511_notice_list (1)](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/f48f65ae-fad2-4789-ac5c-5aec0473d47b)
![sonof iptime org_9511_notice_detail_noticeNo=305](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/4433528b-a99f-4f5e-9f45-a23027bfaac6)

9-2 문의사항
![sonof iptime org_9511_inquiry_list](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/ddc689f0-7a2e-4b7a-b8b9-faf52b4b3377)
![sonof iptime org_9511_inquiry_detail_inquiriesNo=185](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/6d3fdfde-0941-4706-88fc-b94dba254cc2)
![sonof iptime org_9511_inquiry_checkSecretNo_inquiriesNo=191](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/93033b91-cc45-4c67-916a-3aff13f7e25b)


### 10. 하루기록
![image](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032693/f5fa34b6-25e6-45a4-a6f1-384577254c5a)
![image](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032693/f6429092-a02d-4fda-9a4c-faaf75c48265)
![image](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032693/593a49da-b768-4fbf-a192-b712d0d9aa77)

### 11. 포인트
![image](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032693/fd2fffff-c76e-44dd-b1ea-1eb2d8345a70)
![image](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032693/422ed7f9-a215-4d03-b076-e52f0823ae78)
![image](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032693/42863835-1c95-4f0e-982a-4b9bf0f8b21f)
