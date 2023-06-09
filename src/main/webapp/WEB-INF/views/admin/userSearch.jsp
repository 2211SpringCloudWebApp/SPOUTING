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
            SPOUTING USER LIST
        </div>
        
        <table id="user-list">
            <c:if test="${uList eq null}">
                <div id="no-one">
                    <p>해당 회원이 없음</p>
                    <a href="/admin/user">[전체 회원 보기]</a>
                </div>
            </c:if>
                
            <c:if test="${uList ne null}">
            <tr>
                <th>USER_NO</th>
                <th>ID</th>
                <th>NAME</th>
                <th>EMAIL</th>
                <th>GENDER</th>
                <th>REGI_DATE</th>
                <th>DROP</th>
                <th>POINT</th>
            </tr>
            
            <c:forEach items="${uList}" var="user" varStatus="i">
            <tr>
                <td>${user.userNo}</td>
                <td>${user.userId}</td>
                <td>${user.userName}</td>
                <td>${user.userEmail}</td>
                <td>${user.userGender}</td>
                <td><fmt:formatDate value="${user.userDate}" pattern="yyyy.MM.dd  HH:mm" /></td>
                <c:if test="${user.userType != '1'}">
                    <td><input type="button" id="remo-btn" value="탈퇴" onclick="removeUser('${user.userId}')"></td>
                </c:if>
                <c:if test="${user.userType == '1'}">
                    <td style="color: rgb(255, 123, 0);">관리자</td>
                </c:if>   
                <c:if test="${user.userType != '1'}">
                    <td><input type="button" id="remo-btn" value="조회" onclick="location.href='/admin/point?userNo=${user.userNo}'"></td>
                </c:if>
                <c:if test="${user.userType == '1'}">
                    <td style="color: rgb(255, 136, 0);">관리자</td>
                </c:if> 
            </tr>
            </c:forEach>
            </c:if>
        </table>
        <table id="navi-box">
            <tr>
                <td>
                    <c:if test="${pi.currentPage ne 1}">
                        <a href="/admin/userSearch?page=1" id="navi-btn1"> ≪ </a>
                    </c:if>
                    <c:if test="${pi.currentPage ne 1}">
                        <a href="/admin/userSearch?page=${pi.currentPage-1}" id="navi-btn2"> ＜ </a>
                    </c:if>
                    
                    <c:forEach begin="${pi.startNavi}" end="${pi.endNavi}" var="p">
                        <c:url var="pageUrl" value="/admin/userSearch">
                            <c:param name="page" value="${p }"></c:param>
                            <c:param name="searchValue" value="${search.searchValue }"></c:param>
							<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
                        </c:url>
                        <a href="${pageUrl }" class="navi-btn3">${p }</a>&nbsp;
                    </c:forEach>

                    <c:if test="${pi.currentPage + 1 <= pi.maxPage}">
                        <a href="/admin/userSearch?page=${pi.currentPage+1}" id="navi-btn4"> ＞ </a>
                    </c:if> 
                    <c:if test="${pi.currentPage + 1 <= pi.maxPage}">
                        <a href="/admin/userSearch?page=${pi.maxPage}" id="navi-btn5"> ≫ </a>
                    </c:if>
                </td>
            </tr>  
            <tr>
                <td >
                    <form action="/admin/userSearch" method="get">
                        <select name="searchCondition" id="search-select">
                            <option value="userId">ID</option>
                            <option value="userName">NAME</option>
                        </select>
                        <input type="text" id="search-box" name="searchValue" value="${search.searchValue}">
                        <input type="submit" id="search-btn" value="검색">
                    </form>
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