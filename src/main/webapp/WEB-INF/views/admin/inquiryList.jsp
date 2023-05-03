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
            SPOUTING INQUIRY LIST
        </div>
        <table id="user-list">
            <tr>
                <th>POST_NO</th>
                <th>CATEGORY</th>
                <th>TITLE</th>
                <th>WRITER</th>
                <th>WRITE_DATE</th>
            </tr>
            
<%--             <c:set var="num" value="${pi.totalCount - ((pi.currentPage-1) * 10)}"/> --%>
            <c:forEach items="${iList}" var="inquiry" varStatus="i">
            <tr>
                <td>${inquiry.inquiriesNo}</td>
				<!-- 카테고리부분 -->
				<c:if test="${inquiry.inquiriesCategory eq 'N'}">
					<td>일반문의</td>
				</c:if>
				<c:if test="${inquiry.inquiriesCategory eq 'M'}">
					<td>MD관련문의</td>
				</c:if>
				<c:if test="${inquiry.inquiriesCategory eq 'P'}">
					<td>결제취소문의</td>
				</c:if>
                <td><a href="detail?inquiriesNo=${inquiry.inquiriesNo }">${inquiry.inquiriesTitle}</a></td>
                <td>${inquiry.userName}</td>
                <td><fmt:formatDate value="${inquiry.qCreateDate }" pattern="yyyy-MM-dd" /></td>
            </tr>
            </c:forEach>
<%--              <c:set var="num" value="${num-1 }"/> --%>
        </table>
        <table id="navi-box">
            <tr>
                <td>
					<c:if test="${pi.currentPage > 1}">
			       		<a href="/inquiry/admin?page=1" class="navi-btn3"><<</a>
			       	</c:if>
			     	<c:forEach begin="${pi.startNavi}" end="${pi.endNavi}" var="page">
			       		<c:url var="pageUrl" value="/inquiry/admin">
			       			<c:param name="page" value="${page}" />
			       		</c:url>
			       		<a href="${pageUrl}" class="navi-btn3"<c:if test="${pi.currentPage == page}"></c:if>>${page}</a>
			       	</c:forEach>
			       		<c:if test="${pi.currentPage < pi.maxPage}">
			       			<a href="/inquiry/admin?page=${pi.maxPage}" class="navi-btn3">>></a>
			       		</c:if>
                                  
<%--                     <c:forEach begin="${pi.startNavi}" end="${pi.endNavi}" var="p"> --%>
<%--                         <c:url var="pageUrl" value="/inquiry/admin"> --%>
<%--                             <c:param name="page" value="${p } "></c:param> --%>
<%--                             <c:param name="searchValue" value="${search.searchValue }"></c:param> --%>
<%-- 							<c:param name="searchCondition" value="${search.searchCondition }"></c:param> --%>
<%--                         </c:url> --%>
<%--                         <a href="${pageUrl }" class="navi-btn3">${p }</a>&nbsp; --%>
<%--                     </c:forEach> --%>
                </td>
            </tr>
        </table>
    </div>

    <script>
//         function removeUser(userId) {
//             if(window.confirm("해당 회원을 탈퇴시키겠습니까?")) {
//                 alert("처리 완료")
//                 location.href = "/admin/delete?userId=" + userId;
//             }
//         }
    </script>
</body>
</html>