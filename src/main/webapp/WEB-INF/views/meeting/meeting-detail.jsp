<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>소셜링 상세 페이지</title>
    <link rel="stylesheet" href="/resources/css/meetingCss/meeting-detail.css">
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>

<!--     <h1 id="meeting-header">🎯소셜링 상세 페이지</h1> -->
	<br><br><br>
	
    <!--     여기는 데이터 영역~!~! -->
	<div id="meeting-data">

		<div class="meeting-subject">

            <div class="meeting-img-box">
                <img class="meeting-img" src="/resources/images/profile/${readerProfileImg}" alt="" onclick="location.href='/sns?userNo=${meeting.readerNo }'">
            </div>

            <div id="meeting-content-box">
                <div class="meeting-title">
                	<input type="hidden" value="${meeting.readerNo }" name="userNo">
                	<input type="hidden" value="${meeting.meetingNo }" name="meetingNo">
                    <h1 class="meeting-title-h1">${meeting.meetingName }</h1> <br>
                </div>

                <div class="meeting-day">
                    <span>⏰${meeting.meetingDay }</span>
                </div>

                <div class="meeting-people">
                    <span>👤${lineupCount} / ${meeting.meetingPeople }</span>
                </div>
            </div>

        </div>

        <div id="meeting-detail-box">
            <br><br><br><br><br>

            <div class="meeting-detail">
	            <div class="meeting-content-img-box">
		            <img class="meeting-content-img" src="/resources/images/meeting/${meeting.meetingFileRename }"> 
		        </div>    
		            <br><br>
				    ${meeting.meetingDetail }
				    
				    <br><br>
				    	참여중인 멤버
	        </div>
        </div>

		<c:if test="${lineupCount ne meeting.meetingPeople }"> 
	        <div id="meeting-joinBtn" onclick="joinCheck(${meeting.meetingNo });">
	        	<input type = "hidden" value="${meeting.meetingNo }" name="meetingNo">
	        	<b>소셜링 참여하기👀</b>
	        </div>
        </c:if>
        
        
    	<c:if test="${lineupCount eq meeting.meetingPeople }"> 
			<div id="meeting-joinBtn2">
	        	<b>마감된 소셜링입니다 😥</b>
	        </div>
		</c:if>

	</div>
	
	<br>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script>
		function joinCheck(meetingNo) {
			if(confirm("소셜링에 참여하시겠습니까?")) {
				location.href="/joinMeeting?meetingNo="+meetingNo;
				alert("소셜링에 참여 되셨습니다.");
			}
		}
	
	</script>
</body>
</html>