<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모임 찾기</title>
    <link rel="stylesheet" href="/resources/css/meetingCss/meeting.css">
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<div id="meeting-main">
	    <h1 id="meeting-header">🎯 모집 중인 소셜링</h1>
	
	    <br>
	    <div id="meeting-startBtn" onclick="location.href='/meetingOpenPage'"><b>소셜링 주최하기👆</b></div>
    </div>
    
<!--     여기는 데이터 영역~!~! -->
		<div id="meeting-data" style="overflow: scroll; height: 600px;">
		
<!-- 		예시 영역 -->
		<div class="meeting-box">

            <div class="meeting-img">
                <img class="meeting-img" src="/resources/images/meeting/image1.jpg" alt="">
            </div>

            <div id="meeting-content">
                <div class="meeting-title">
                    <h1 class="meeting-title-h1">제목 들어갈 부분~!</h1>
                </div><br>
				
                <div class="meeting-day">
                    <span>날짜 들어갈 부분~!</span>
                </div>

                <div class="meeting-people">
                    <span>인원 들어갈 부분~!</span>
                </div>
            </div>

        </div>
<!--         예시 영역 끝 -->

<!-- 반복되는 부분 -->
        <c:forEach items="${meetingList }" var="meeting" varStatus="i">
	        <div class="meeting-box">
	
	            <div class="meeting-img">
	                <img class="meeting-img" src="/resources/images/meeting/image1.jpg" alt="">
	            </div>
	
	            <div id="meeting-content">
	                <div class="meeting-title">
	                    <h1 class="meeting-title-h1">${meeting.meetingName }</h1>
	                </div> <br>
	
	                <div class="meeting-day">
	                    <span>${meeting.meetingDay }</span>
	                </div>
	
	                <div class="meeting-people">
	                    <span>${meeting.meetingPeople }</span>
	                </div>
	            </div>
	
	        </div>
        </c:forEach>
<!--         반복되는 부분 끝 -->
        
        
        
	</div>
    

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>