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
    <title>SPOUTING-admin</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/adminCss/user.css">
</head>
<body>
    <jsp:include page="./adminHeader.jsp"></jsp:include>
    <div id="main-box">
        <div id="user-title">
            SPOUTING userPOINT LIST
        </div>
        <table id="user-list">
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>Total_POINT</th>
            </tr>
            
            <c:forEach items="${uList}" var="user" varStatus="i">
            <tr>
                <td>${user.userId}</td>
                <td>${user.userName}</td>
                <td>${user.userPoint}</td>  
            </tr>
            </c:forEach>
        </table>
        <table id="navi-box">
            <tr>
                <td>
                    <c:if test="${pi.currentPage ne 1}">
                        <a href="/lesson/list?page=1" id="navi-btn1"> ≪ </a>
                    </c:if>
                    <c:if test="${pi.currentPage ne 1}">
                        <a href="/lesson/list?page=${pi.currentPage-1}" id="navi-btn2"> ＜ </a>
                    </c:if>
                    
                    <c:forEach begin="${pi.startNavi}" end="${pi.endNavi}" var="p">
                        <c:url var="pageUrl" value="/lesson/list">
                            <c:param name="page" value="${p } "></c:param>
                        </c:url>
                        <a href="${pageUrl }" class="navi-btn3">${p }</a>&nbsp;
                    </c:forEach>

                    <c:if test="${pi.currentPage + 1 <= pi.maxPage}">
                        <a href="/lesson/list?page=${pi.currentPage+1}" id="navi-btn4"> ＞ </a>
                    </c:if> 
                    <c:if test="${pi.currentPage + 1 <= pi.maxPage}">
                        <a href="/lesson/list?page=${pi.maxPage}" id="navi-btn5"> ≫ </a>
                    </c:if>
                </td>
            </tr>
        </table>
    </div>

    <script>
        function removeUser(userId) {
            if(window.confirm("해당 회원을 탈퇴시키겠습니까?")) {
                alert("처리 완료")
                location.href = "/admin/delete?userId=" + userId;
            }
        }
    </script>
</body>
</html>