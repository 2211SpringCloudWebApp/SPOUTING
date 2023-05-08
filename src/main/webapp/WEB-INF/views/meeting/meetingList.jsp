<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문내역</title>
    <link rel="stylesheet" href="/resources/css/pointCss/detail.css">
    <link rel="stylesheet" href="/resources/css/mypageCss/nav.css">
    <style>
	    #point-list {
        width: 800px;
        display: block;
        margin: 0 auto;
        line-height: 3;
        text-align: center;
    	}
        .table-line {
            width:800px;
            border-bottom: 1px solid #ccc;
            display: table;
            padding-right: 10px;
            padding-left: 10px;
        }
        #navi-box {
		    width: 800px;
		    height: 120px;
		    margin: 0 auto;
		    margin-bottom: 50px;
		    text-align: center;
		    padding-top: 30px;
		}
		#list-wrapper {
		    width: 900px;
		    margin: 0 auto;
		    display: block;
		}
		#list-title {
		    width: 600px;
		    height: 50px;
		    margin: 50px auto;
		    text-align: center;
		    padding: 10px;
		}

		
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>

	<c:if test="${sessionScope.loginUser.userNo eq null }">
		<script>
			$(document).ready(function () {
	            alert("로그인이 필요합니다.")
	            window.location.replace("http://localhost:8999/user/login");
        	});
		</script>
	</c:if>

    <div id="head-info">
        <table>
            <tr>
                <td id="user-msg">
                    ${sessionScope.loginUser.userName}님 <br>
                    오늘도 Spouting!
                </td>
                <td>
                    <button id="daily-btn" onclick="location.href='/diary/list'">🦾오늘 기록</button>
                </td>
            </tr>
        </table>
    </div>
    <ul id="left-nav">
        <li><a href="/book/myBooking?userNo=${sessionScope.loginUser.userNo}">예약내역</a></li>
        <li><a href="/order/list">주문내역</a></li>
        <li class="selected"><a href="/meeting/myMeetingList">나의 커뮤니티</a></li>
        <li><a href="/inquiry/myInquiry">나의 문의</a></li>
        <li><a href="/point/detail">포인트 관리</a></li>
        <li><a href="/mypage/myinfo">개인정보 수정</a></li>
    </ul>

    <div id="main">
        <div id="list-title">
            <p>${sessionScope.loginUser.userName}님의 소셜링 내역</p>
        </div>
        <div id="list-wrapper">
       		<table id="point-list">
	                <tr class="table-line">
	                	<th style="width: 10%;">소셜링 번호</th>
	                	<th style="width: 40%;">제목</th>
	                	<th style="width: 20%;">주최자</th>
	                	<th style="width: 30%;">날짜</th>
	                </tr>
	                <c:forEach items="${myMeetingList}" var="myMeetingList" varStatus="i">
	                <tr class="table-line" onclick="location.href='/meetingDetailPage?meetingNo=${myMeetingList.meetingNo}&readerNo=${myMeetingList.leaderNo }'" style="cursor: pointer;">
	                    <td style="width: 10%;">${myMeetingList.meetingNo}</td>
	                    <td style="width: 40%;">${myMeetingList.meetingName}</td>
	                    <td style="width: 20%;">${myMeetingList.leaderName}</td>
	                    <td style="width: 30%;">
	                        <fmt:formatDate value="${myMeetingList.meetingDay}" pattern="yyyy.MM.dd" />
	                    </td>
	                </tr>
                </c:forEach>
            </table>
        </div>

<!--             페이징처리 -->
            <table id="navi-box">
            <tbody id="table-tbody">
	            <tr>
	                <td>
						<c:if test="${pi.currentPage > 1}">
				       		<a href="/meeting/myMeetingList?page=1" id="navi-btn3"><<</a>
				       	</c:if>
				     	<c:forEach begin="${pi.startNavi}" end="${pi.endNavi}" var="page">
				       		<c:url var="pageUrl" value="/meeting/myMeetingList">
				       			<c:param name="page" value="${page}" />
				       		</c:url>
				       		<a href="${pageUrl}" id="navi-btn3"<c:if test="${pi.currentPage == page}"></c:if>>${page}</a>
				       	</c:forEach>
				       		<c:if test="${pi.currentPage < pi.maxPage}">
				       			<a href="/meeting/myMeetingList?page=${pi.maxPage}" id="navi-btn3">>></a>
				       		</c:if>
	                </td>
	            </tr>
            </tbody>
        </table>
        
    </div>

    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>