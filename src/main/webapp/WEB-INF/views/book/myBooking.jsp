<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>결 제 내 역 조 회</title>
		 <style>
		 @font-face {
		    font-family: 'Chosunilbo_myungjo';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Chosunilbo_myungjo.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
        .bookingEachDiv{
            width: 100%;
            height: 280px;
            --border: 1px solid black;
            display: flex;
            justify-content: center;
            align-items: center;

        }
        .branchPhotoDiv{ 
            width: 250px;
            height: 250px;
            border: 1px solid blue;
            margin-right: 20px;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .branchPhotoDiv >img{
            width: 90%;
            height: 90%;
        }
        .bookingInfoDiv{
            width: 250px;
            height: 250px;
            border: 1px solid green;
            margin-left: 20px;
            padding: 10px;
            box-sizing: border-box; /*이거 줘야 패딩값에 따라 width,height 안움직임*/
        }
        .dateDiv{
         	font-family: 'Chosunilbo_myungjo';
            font-size: 3em;
            font-weight: 800;
            color: #1C3879;
            border-bottom: 1px solid #607EAA;
            padding-bottom: 5px;
            margin-bottom: 20px;
        }
        p{
        padding-top: 20px;
        line-height: 150%;
        padding-bottom: 10px;
        }
        .cancelDiv{
        	border-top: 1px solid #607EAA;
        	padding-top: 10px;
        	
        	
        }
        .cancelLink{
        	font-size: smaller;
        	color: #607EAA;
        	        	
        	margin-left: 180px;
        	 
        }
        #passedBooking{
        	text-align: center;
        }
        button{
        	
		    margin-top: 32px;
		    margin-bottom: 80px;
		    margin-right: 30px;
		    position: relative;
		    border: 0;
		    border-radius: 5px;
		    padding: 15px 25px;
		    display: inline-block;
		    text-align: center;
		    color: white;
		    background-color: #1C3879;
    }

    </style>
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		<main>
		<!-- c:forEach이거 쓰면되겟다
		회원 예약내역 가져오기(사용일/시, 사용인원, 센터명-시설명 -->
		<!--${bList }-->
			<c:forEach items="${bList }" var="book">
				<div class="bookingEachDiv">
		            <div class="branchPhotoDiv">
		               <img src="${book.centerFilepath1}" alt="branchPhoto">
	<!-- 	                <img src="./images/logo.png"> -->
		            </div>
		            <div class="bookingInfoDiv">
		                <span class="dateDiv"><fmt:formatDate pattern="MM/dd" value="${book.useDate}"/></span>
		                <p>${book.centerName} <br>
		                ${book.facilityName}<br>
		                <fmt:formatDate pattern="hh시" value="${book.startTime}"/>~
		                <fmt:formatDate pattern="hh시" value="${book.endTime}"/><br>
		                ${book.numPeople}인 이용 예정<br></p><br>
		                
		                <span class="cancelDiv"><a class="cancelLink" href="/book/cancelBooking?bookNo=${book.bookNo}">예약취소</a></span>
		            </div> 
		        </div>
	        </c:forEach>
	        <div id="passedBooking"> 
	        	<button>지난이용내역보기</button> 
	        	<c:forEach items="${pList }" var="pbook">
				<div class="bookingEachDiv">
		            <div class="branchPhotoDiv">
		               <img src="${pbook.centerFilepath1}" alt="branchPhoto">
	<!-- 	                <img src="./images/logo.png"> -->
		            </div>
		            <div class="bookingInfoDiv">
		                <span class="dateDiv"><fmt:formatDate pattern="MM/dd" value="${pbook.useDate}"/></span>
		                <p>${pbook.centerName} <br>
		                ${pbook.facilityName}<br>
		                <fmt:formatDate pattern="hh시" value="${pbook.startTime}"/>~
		                <fmt:formatDate pattern="hh시" value="${pbook.endTime}"/><br>
		                ${pbook.numPeople}인 이용 예정<br></p><br>
		                
		                <span class="cancelDiv">이용완료</span>
		            </div> 
		        </div>
	        </c:forEach>
	        
	        
	        </div>
		</main>
		
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>