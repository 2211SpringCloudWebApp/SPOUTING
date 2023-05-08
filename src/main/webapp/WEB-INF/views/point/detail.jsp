<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 날짜변환용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPOUTING-point</title>
    <link rel="stylesheet" href="/resources/css/pointCss/detail.css">
    <link rel="stylesheet" href="/resources/css/mypageCss/nav.css">
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <div id="head-info">
        <table>
            <tr>
                <td id="user-msg">
                    ${sessionScope.loginUser.userName}님 
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
        <li><a href="/meeting/myMeetingList">나의 커뮤니티</a></li>
        <li><a href="/inquiry/myInquiry">나의 문의</a></li>
        <li class="selected"><a href="/point/detail">포인트 관리</a></li>
        <li><a href="/mypage/myinfo">개인정보 수정</a></li>
    </ul>

    <div id="main">
        <div id="list-title">
            <p>${sessionScope.loginUser.userName}님의 포인트 내역</p>
            <span>현재 잔액 <em>>> ${userPoint}P</em></span>
            <button id="charge-btn" onclick="location.href='/point/charge'">포인트 충전하기</button>
        </div>
        <div id="list-wrapper">
                <table id="point-list">
                    <c:forEach items="${pList}" var="point" varStatus="i">
                    <tr class="table-line">
                        <td style="width: 25%;">
                            <fmt:formatDate value="${point.pointDate}" pattern="yyyy.MM.dd." />
                        </td>
                        <td style="width: 20%;">
                            <c:if test="${point.pointChange > 0}">
                                <img src="/resources/images/point/plus.png" alt="error">
                            </c:if>
                            <c:if test="${point.pointChange < 0}">
                                <img src="/resources/images/point/minus.png" alt="error">
                            </c:if>
                        </td>
                        <td style="width: 25%;">${point.pointChange}</td>
                        <td style="width: 30%;">${point.pointDetail}</td>
                    </tr>
                    </c:forEach>
                </table>
            <a href="/point/charge"><div id="ad-box"></div></a> 
        </div>

        <!-- 페이징 -->
        <table id="navi-box">
            <tr>
                <td>
                    <c:if test="${pi.currentPage ne 1}">
                        <a href="/point/detail?page=1" id="navi-btn1"> ≪ </a>
                    </c:if>
                    <c:if test="${pi.currentPage ne 1}">
                        <a href="/point/detail?page=${pi.currentPage-1}" id="navi-btn2"> ＜ </a>
                    </c:if>
                    
                    <c:forEach begin="${pi.startNavi}" end="${pi.endNavi}" var="p">
                        <c:url var="pageUrl" value="/point/detail">
                            <c:param name="page" value="${p } "></c:param>
                        </c:url>
                        <a href="${pageUrl }" class="navi-btn3">${p }</a>&nbsp;
                    </c:forEach>

                    <c:if test="${pi.currentPage + 1 <= pi.maxPage}">
                        <a href="/point/detail?page=${pi.currentPage+1}" id="navi-btn4"> ＞ </a>
                    </c:if> 
                    <c:if test="${pi.currentPage + 1 <= pi.maxPage}">
                        <a href="/point/detail?page=${pi.maxPage}" id="navi-btn5"> ≫ </a>
                    </c:if>
                </td>
            </tr>
        </table>
    </div>

    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>