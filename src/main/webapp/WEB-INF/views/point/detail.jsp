<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPOUTING-point</title>
    <link rel="stylesheet" href="/resources/css/pointCss/detail.css">
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <div id="main">
        <div id="list-title">
            <span>${sessionScope.loginUser.userName} SPOUTER'S 포인트 내역</span><br>
            현재 잔액 ${userPoint}
            <button id="charge-btn" onclick="location.href='/point/charge'">포인트 충전하기</button>
        </div>
        <div id="list-wrapper">
            <c:forEach items="${pList}" var="point" varStatus="i">
                <table id="point-list">
                    <tr>
                        <td>이모지</td>
                        <td>
                            <c:if test="${pList.pointChange > 0}">
                                적립
                            </c:if>
                            <c:if test="${pList.pointChange <= 0}">
                                사용
                            </c:if>
                        </td>
                        <td>${pList.pointChange}</td>
                        <td>${pList.pointDetail}</td>
                    </tr>
                </table> 
            </c:forEach>
            <div id="ad-box"></div>  
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"></jsp:include>


</body>
</html>