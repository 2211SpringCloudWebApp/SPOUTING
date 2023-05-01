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
    <jsp:include page="../../common/header.jsp"></jsp:include>
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
        <li><a href="">예약내역</a></li>
        <li class="selected"><a href="/order/list">주문내역</a></li>
        <li><a href="">상품후기</a></li>
        <li><a href="">나의 커뮤니티</a></li>
        <li><a href="">나의 문의</a></li>
        <li><a href="/point/detail">포인트 관리</a></li>
        <li><a href="/mypage/myinfo">개인정보 수정</a></li>
    </ul>

    <div id="main">
        <div id="list-title">
            <p>${sessionScope.loginUser.userName}님의 주문 내역</p>
        </div>
        <div id="list-wrapper">
       		<table id="point-list">
	                <tr class="table-line">
	                	<th style="width: 25%;">주문번호</th>
	                	<th style="width: 25%;">주문자명</th>
	                	<th style="width: 25%;">결제금액</th>
	                	<th style="width: 25%;">주문일자</th>
	                </tr>
	                <c:forEach items="${oList}" var="order" varStatus="i">
	                <tr class="table-line" onclick="location.href='/order/detail?orderNo=${order.orderNo }'"style="cursor: pointer;">
	                    <td style="width: 25%;">${order.orderNo}</td>
	                    <td style="width: 25%;">${order.orderName}</td>
	                    <td style="width: 25%;">${order.orderCost}</td>
	                    <td style="width: 25%;">
	                        <fmt:formatDate value="${order.orderDate}" pattern="yyyy.MM.dd" />
	                    </td>
	                    <td style="width: 25%;">${order.orderState}</td>
	                </tr>
                </c:forEach>
            </table>
        </div>

        <!-- 페이징 -->
        <table id="navi-box">
            <tr>
                <td>
                    <c:if test="${pi.currentPage ne 1}">
                        <a href="/order/list?page=1" id="navi-btn1"> ≪ </a>
                    </c:if>
                    <c:if test="${pi.currentPage ne 1}">
                        <a href="/order/list?page=${pi.currentPage-1}" id="navi-btn2"> ＜ </a>
                    </c:if>
                    
                    <c:forEach begin="${pi.startNavi}" end="${pi.endNavi}" var="p">
                        <c:url var="pageUrl" value="/order/list">
                            <c:param name="page" value="${p } "></c:param>
                        </c:url>
                        <a href="${pageUrl }" class="navi-btn3">${p }</a>&nbsp;
                    </c:forEach>

                    <c:if test="${pi.currentPage + 1 <= pi.maxPage}">
                        <a href="/order/list?page=${pi.currentPage+1}" id="navi-btn4"> ＞ </a>
                    </c:if> 
                    <c:if test="${pi.currentPage + 1 <= pi.maxPage}">
                        <a href="/order/list?page=${pi.maxPage}" id="navi-btn5"> ≫ </a>
                    </c:if>
                </td>
            </tr>
        </table>
    </div>

    <jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>