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
	<br><br>
	
	<div id="meeting-main">
	    <h1 id="meeting-header">🎯 SOCIALRING</h1> <br>
	    <div id="meeting-header2">
	    	똑같은 일상을 다채롭게 <br>
	    	만들어 줄 원데이 취향 모임 <br>
	    </div>
	
	    <br>
	    <div id="meeting-startBtn" onclick="location.href='/meetingOpenPage'"><b>소셜링 주최하기👆</b></div>
    </div>
    
    <br><br>
    
<!--     여기는 데이터 영역~!~! -->
		<div id="meeting-data" style="overflow: auto; height: 600px;">
		
<!-- 		예시 영역 -->
<!-- 		<div class="meeting-box" onclick="location.href='/meetingDetailPageHard'"> -->

<!--             <div class="meeting-img-box"> -->
<!--                 <img class="meeting-img" src="/resources/images/meeting/image1.jpg" alt=""> -->
<!--             </div> -->

<!--             <div id="meeting-content-box"> -->
<!--                 <div class="meeting-title"> -->
<!--                     <h1 class="meeting-title-h1">제목 들어갈 부분~!</h1> -->
<!--                 </div><br> -->
				
<!--                 <div class="meeting-day"> -->
<!--                     <span>날짜 들어갈 부분~!</span> -->
<!--                 </div> -->

<!--                 <div class="meeting-people"> -->
<!--                     <span>인원 들어갈 부분~!</span> -->
<!--                 </div> -->
<!--             </div> -->

<!--         </div> -->
<!--         예시 영역 끝 -->

<!-- 반복되는 부분 -->
        <c:forEach items="${meetingList }" var="meeting" varStatus="i">
	        <div class="meeting-box" onclick="location.href='/meetingDetailPage?meetingNo=${meeting.meetingNo}&readerNo=${meeting.readerNo }'">
	
	            <div class="meeting-img-box">
		            <c:if test="${meeting.meetingFileRename ne null }"> 
		                <img class="meeting-img" src="/resources/images/meeting/${meeting.meetingFileRename }" alt="">
		            </c:if>
		            <c:if test="${meeting.meetingFileRename eq null }"> 
		                <img class="meeting-img-ex" src="/resources/images/meeting/exercise.png" alt="">
		            </c:if>
	            </div>
	
	            <div id="meeting-content-box">
	                <div class="meeting-title">
	                	<input type="hidden" value="${meeting.meetingNo }" name="meetingNo">
	                	<input type="hidden" value="${meeting.readerNo }" name="readerNo">
	                    <h2 class="meeting-title-h1">${meeting.meetingName }</h2>
	                </div> <br>
	
	                <div class="meeting-day">
	                    <span>일시 : ${meeting.meetingDay }</span>
	                </div>
	
	                <div class="meeting-people">
	                    <span>인원 : ${meeting.meetingPeople }명</span>
	                </div>
	            </div>
	
	        </div>
        </c:forEach>
<!--         반복되는 부분 끝 -->

        
	</div>
    
	<br><br>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>