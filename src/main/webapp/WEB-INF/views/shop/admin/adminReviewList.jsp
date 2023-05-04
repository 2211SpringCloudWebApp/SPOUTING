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
    <title>리뷰 관리</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/adminCss/user.css">
</head>
<body>
    <jsp:include page="../../admin/adminHeader.jsp"></jsp:include>
    <div id="main-box">
        <div id="user-title">
            SPOUTING REVIEW LIST
        </div>
        <table id="user-list">
            <tr>
                <th>리뷰번호</th>
                <th>아이디</th>
                <th>제목</th>
                <th>등록일자</th>
                <th>별점</th>
            </tr>
            
            <c:forEach items="${rList}" var="review" varStatus="i">
            <tr>
                <td>${review.reviewNo}</td>
                <td>${review.userId}</td>
                <td>${review.reviewTitle}</td>
                <td><fmt:formatDate value="${review.reviewDate}" pattern="yyyy.MM.dd" /></td>
                <td>${review.reviewGrade}</td>
                <c:if test="${user.userType != '1'}">
                    <td><input type="button" id="remo-btn" value="조회" onclick="location.href='/review/adminDetail?reviewNo=${review.reviewNo}'"></td>
                </c:if>
                <c:if test="${user.userType == '1'}">
                    <td style="color: rgb(255, 136, 0);">관리자</td>
                </c:if>      
                <c:if test="${user.userType != '1'}">
                    <td><input type="button" id="remo-btn" value="삭제" onclick="removeReview('${review.reviewNo}')"></td>
                </c:if>
                <c:if test="${user.userType == '1'}">
                    <td style="color: rgb(255, 136, 0);">관리자</td>
                </c:if>
                
            </tr>
            </c:forEach>
        </table>
        <table id="navi-box">
            <tr>
                <td>                  
                    <c:forEach begin="${pi.startNavi}" end="${pi.endNavi}" var="p">
                        <c:url var="pageUrl" value="/review/adminList">
                            <c:param name="page" value="${p } "></c:param>
                            <c:param name="searchValue" value="${search.searchValue }"></c:param>
							<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
                        </c:url>
                        <a href="${pageUrl }" class="navi-btn3">${p }</a>&nbsp;
                    </c:forEach>
                </td>
            </tr>
            <tr>
                <td >
                    <form action="/review/adminSearch" method="get">
                        <select name="searchCondition" id="search-select">
                        	<option value="all" <c:if test="${search.searchCondition == 'all' }">selected</c:if>>ALL</option>
                            <option value="userId">ID</option>
                            <option value="reviewTitle">TITLE</option>
                        </select>
                        <input type="text" id="search-box" name="searchValue" placeholder="검색어를 입력하세요.">
                        <input type="submit" id="search-btn" value="검색">
                    </form>
                </td>                       
            </tr>
        </table>
    </div>

    <script>
        function removeReview(reviewNo) {
            if(window.confirm("해당 리뷰를 삭제하시겠습니까?")) {
                location.href = "/review/adminDeleteReview?reviewNo=" + reviewNo;
            }
        }
    </script>
</body>
</html>