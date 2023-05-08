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
<!--     <link rel="stylesheet" href="/resources/css/pointCss/detail.css"> -->
    <link rel="stylesheet" href="/resources/css/mypageCss/nav.css">
    <style>
	    
	    @font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

* {
    font-family: 'Pretendard-Regular'; 
}

#main {
    width: calc(100% - 200px);
    height: 1000px;
    border-top: 1px solid rgb(242, 242, 242);
    padding-bottom: 50px;
    padding-left: 20px;
    margin: 0 auto;
}
#list-title {
    width: 600px;
    height: 50px;
    margin: 50px auto;
    text-align: center;
    padding: 10px;
}
    #list-title p {
        font-size: 21px;
        padding: 5px;
        padding-left: 30px;
        padding-right: 30px;
        border-bottom: 2px solid #0645daab;    
    }
    #list-title span {
        margin: 30px;
        font-size: 18px;
        color: #555555;
    }
    #charge-btn {
        width: 250px;
        height: 40px;
        border: none;
        background-color: #0645daab;
        border-radius: 5px;
        color: #fafafa;
        margin: 30px;
        font-size: 16px;
    }
        #charge-btn:hover {
            color: #32529ec2;
            background-color: #d8d8d885;
            font-weight: 800;
            cursor: pointer;
        }
#list-wrapper {
    width: 900px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
}
    #point-list {
        width: 800px;
        display: block;
        margin: 0 auto;
        line-height: 3;
        text-align: center;
    }
        .table-line {
            width: 800px;
            border-bottom: 1px solid #ccc;
            display: table;
            padding-right: 10px;
            padding-left: 10px;
        }
        
        .table-line2 {
            width: 800px;
            border-bottom: 1px solid #ccc;
            display: table;
            padding-right: 10px;
            padding-left: 10px;
        }
        
        .table-line2:hover {
        	 background-color: #607EAA;
        }
        
        
        
        
        .table-line img {
            width: 30px;
            height: 30px;
            margin-top: 20px;
            
        }
        #point-list:first-child {
            border-top: 1px solid #ccc;
        }
    #ad-box {
    width: 200px;
    height: 600px;
       background-image: url(/resources/images/point/ad.png);
       background-repeat: no-repeat;
       background-size: 100%;
       cursor: pointer;
    }


/*페이징///////////////////////////////////////*/
#navi-box2 {
    width: 800px;
    height: 120px;
    margin: 0 auto;
    margin-bottom: 50px;
    text-align: center;
    padding-top: 30px;
    --padding-right: 200px;
}
    #navi-box2 a{
        text-decoration: none;
        color: #1b5dff;
    }
        #navi-box2 a:link{
            color: #1b5dff;
        }
        #navi-box2 a:visited{
            color: #1b5dff;
        }
    #navi-btn1{
        padding: 8px;
        border-radius: 10px;
        font-weight: 900;
    }
    #navi-btn2{
        padding: 8px;
        margin-right: 20px;
        border-radius: 10px;
        font-weight: 900;
    }
    .navi-btn3{
        font-size: 13px;
        padding: 7px;
        padding-left: 10px;
        padding-right: 10px;
        border-radius: 10px;
    }
        .navi-btn3:hover{
            cursor: pointer;
            font-size: 14px;
            font-weight: 800;
            background-color: #ebebeb;
        }
    #navi-btn4{
        padding: 8px;
        margin-left: 20px;
        border-radius: 10px;
        font-weight: 900;
    }  
    #navi-btn5{
        padding: 8px;
        border-radius: 10px;
        font-weight: 900;
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
        <li><a href="/review/reviewListUser">상품후기</a></li>
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
	                <tr class="table-line2" onclick="location.href='/meetingDetailPage?meetingNo=${myMeetingList.meetingNo}&readerNo=${myMeetingList.leaderNo }'" style="cursor: pointer;">
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
            <table id="navi-box2">
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
        </table>
        
    </div>

    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>