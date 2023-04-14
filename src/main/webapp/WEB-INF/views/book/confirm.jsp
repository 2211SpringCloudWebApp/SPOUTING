<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>예 약 확 인</title>
		<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- ajax CDN -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <!-- jquery CDN -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- fullcalendar CDN -->
        <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
        <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
        <!-- fullcalendar 언어 CDN -->
        <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
        <title>시설예약하기</title>
        <style>
        @font-face {
             font-family: 'Pretendard-Regular';
             src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
             font-weight: 400;
             font-style: normal;
         }
         @font-face {
		    font-family: 'Chosunilbo_myungjo';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Chosunilbo_myungjo.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		main{
    --background-color: #1C3879;
		}

        </style>
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<main>
          
           <form action ="/book/bookUp" method="post">         
           <input type="hidden" value="${book.bookNo }" name="bookNo">  
<!--            //a지점//시설이름//인원수//이용날짜//이용시간//총금액//포인트불러오기 -->
<!-- 			//--//사용포인트입력//결제금액//api -->
			<br>지점명: ${book.centerName }
			<br>시설명: ${book.facilityName }
			<br>예약자명: ${book.userName }
			<br>예약자이메일: ${book.userEmail }
			<br>이용인원수: ${book.numPeople }
			<br>이용일: ${book.useDate }
			<br>이용시간: ${book.startTime }~${book.endTime }
			<br>총이용금액: ${book.bookPrice }
			
			<br>-----------------
			<br>사용포인트 입력:<input type="text" name="pointChange">
			
			<br>결제금액: ${book.bookPrice } - 포인트사용액
			
			<br><button>결제갈겨</button>
<!--            -사용포인트 이 안에 써줘야함->인서트 포인트상세테이블 -->
<!--            -업데이트(페이시간, 남은포인트(원래남은포인트-입력한포인트)."수정내역이 있다면 뒤로가기눌러주셈"   -->
<!--            -api쓰기    -->
           </form>
           
       	</main>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>