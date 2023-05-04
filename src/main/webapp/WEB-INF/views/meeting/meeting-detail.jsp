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
                <img class="meeting-img" src="/resources/images/profile/${leaderProfile.profileFileRename}" alt="" onclick="location.href='/sns?userNo=${meeting.readerNo }'">
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
		        <div class="meeting-content-info-box">
		        	${meeting.meetingDetail }
		        </div>  
		        	<c:if test="${loginUser.userNo eq meeting.readerNo }">
				    	<button class="meeting-delete-btn" onclick="deleteMeeting(${meeting.meetingNo });">소셜링 삭제하기</button>
				    </c:if>
	        </div>
	        
	<!-- 	        전체 멤버 리스트 시작 -->
		        
		        <div class="meeting-people-content">
					<b>멤버 소개</b> <br><br>
					
					<div class="meeting-people-list-scroll">
					
	<!-- 				주최자 프로필 -->
					<div class="member-info-list">
					
						<div class="img-box">
							<img class="sns-profile-img" src="/resources/images/profile/${leaderProfile.profileFileRename }" onclick="location.href='/sns?userNo=${leaderProfile.userNo }';">
						</div>
						
						<div class="profile-box">
							<input type="hidden" value="${leaderProfile.userNo }" id="userNo" name="userNo">
							<div class="profile-name-box">
								<h3 class="profile-name">${leaderProfile.userName }</h3>
							</div> 
							<div class="profile-intro-box">
								<span class="profile-intro">${leaderProfile.profileIntoduce }</span>
							</div>
						</div>
					</div> 
	<!-- 				주최자 프로필 끝 -->
	
	<!-- 				소셜링 참여 멤버 리스트 시작 -->
					<c:forEach items="${memberList }" var="memberList" varStatus="i">
						<div class="member-info-list">
					
							<div class="img-box">
								<img class="sns-profile-img" src="/resources/images/profile/${memberList.profileFileRename }" onclick="location.href='/sns?userNo=${memberList.userNo }';">
							</div>
							
							<div class="profile-box">
								<input type="hidden" value="${memberList.userNo }" id="userNo" name="userNo">
								<div class="profile-name-box">
									<h3 class="profile-name">${memberList.userName }</h3>
								</div> 
								<div class="profile-intro-box">
									<span class="profile-intro">${memberList.profileIntoduce }</span>
								</div>
							</div>
						</div> 	
					</c:forEach>
	<!-- 				소셜링 참여 멤버 리스트 끝 -->
	
				</div>
				
	        </div>
	        <!--         전체 멤버 리스트 끝 -->
	        
        </div>
        

		<c:if test="${lineupCount ne meeting.meetingPeople and loginUser.userNo ne meeting.readerNo}">
			<c:forEach items="${memberList }" var="memberList" varStatus="i">
				<c:choose>
					<c:when test="${loginUser.userNo ne memberList.userNo }">
						<div id="meeting-joinBtn" onclick="joinCheck(${meeting.meetingNo });">
							<input type = "hidden" value="${meeting.meetingNo }" name="meetingNo">
						<b>소셜링 참여하기👀</b>
					</c:when>
					<c:otherwise>
						<div class="meeting-joinBtn2">
		        			<b>이미 참여 중인 소셜링입니다 🤩</b>
		        		</div>
					</c:otherwise>
				</c:choose>
	        </c:forEach>
        </c:if>
        
<%--         					<c:if test="${loginUser.userNo ne memberList.userNo }"> --%>
<%-- 				        <div id="meeting-joinBtn" onclick="joinCheck(${meeting.meetingNo });"> --%>
<%-- 				        	<input type = "hidden" value="${meeting.meetingNo }" name="meetingNo"> --%>
<!-- 				        	<b>소셜링 참여하기👀</b> -->
<!-- 				        </div> -->
<%-- 			        </c:if> --%>
        
        
    	<c:if test="${lineupCount eq meeting.meetingPeople }"> 
			<div class="meeting-joinBtn2">
	        	<b>마감된 소셜링입니다 😥</b>
	        </div>
		</c:if>
		
		<c:if test="${loginUser.userNo eq meeting.readerNo }"> 
			<div class="meeting-joinBtn2">
	        	<b>이미 참여 중인 소셜링입니다 🤩</b>
	        </div>
		</c:if>
		
<%-- 		<c:forEach items="${memberList }" var="memberList" varStatus="i"> --%>
<%-- 			<c:if test="${loginUser.userNo eq memberList.userNo }">  --%>
<!-- 				<div class="meeting-joinBtn2"> -->
<!-- 		        	<b>이미 참여 중인 소셜링입니다 🤩</b> -->
<!-- 		        </div> -->
<%-- 			</c:if> --%>
<%-- 		</c:forEach> --%>

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
		
		function deleteMeeting(meetingNo) {
			if(confirm("소셜링을 삭제하시겠습니까?")) {
				location.href="/deleteMeeting?meetingNo="+meetingNo;
			}
		}
	
	</script>
</body>
</html>