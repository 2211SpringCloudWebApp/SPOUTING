<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>REVIEW LIST</title>
	<link rel="stylesheet" href="../../../../resources/css/shopCss/shop.css">
	<style>
		#maincontainer {
    		width: 100%;
		    height : 2000px;
		    padding-top : 150px;
		    margin : 0;
		    paddig : 0;
		}
	</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<div id="maincontainer">
	<h1 style="color:#1C3879">SPOUTER'S REVIEW</h1>
	<p>스파우터가 남긴 후기들을 확인해 보세요 !</p>
	<br><br><br><br>
	<div id="buttonbox">
	  <button class="btn" onclick="location.href='/review/registserView';">리뷰 등록</button>
	</div>
	<table>
		<thead>
			<tr>
				<th scope="row">번호</th>
				<th scope="row">제목</th>
				<th scope="row">작성자</th>
				<th scope="row">등록일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${rList }">
				<tr>
					<td>${row.reviewNo }</td>
					<td>
						<a href="/review/detail?reviewNo=${row.reviewNo}">${row.reviewTitle }</a>
					</td>
					<td>${row.userId }</td>
					<td><fmt:formatDate value="${row.reviewDate}" pattern="yyyy.MM.dd" /></td>
<%-- 					<td><input type="button" id="remo-btn" value="조회" onclick="location.href='/review/detail?reviewNo=${row.reviewNo}'"></td> --%>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
		<!-- 게시글 페이징 처리 -->
			<tr>
				<td colspan="5" align="center" style="height : 50px; border-bottom:0px;">
					<c:if test="${pi.currentPage > 0}">
	       				<a href="/review/search?page=1" class="first-last-page">처음</a>
	       			</c:if> 
					<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
							<c:url var="pageUrl" value="/review/search">
								<c:param name="page" value="${p }"></c:param>
								<c:param name="searchValue" value="${search.searchValue }"></c:param>
								<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
							</c:url>
							<a href="${pageUrl }">${p }</a>&nbsp;&nbsp;&nbsp;
					</c:forEach>
	       			<c:if test="${pi.currentPage < pi.maxPage}">
	       				<a href="/review/search?page=${pi.maxPage}" class="first-last-page">마지막</a>
	       			</c:if>
				</td>
			</tr>
		<!-- 게시글 조건부 검색 -->
			<tr>
				<td colspan="4" align="center" style="height : 50px;">
					<form action="/review/search" method="get">
						<select name="searchCondition">
							<option value="all" <c:if test="${search.searchCondition == 'all' }">selected</c:if>>전체</option>
							<option value="no" <c:if test="${search.searchCondition == 'no' }">selected</c:if>>상품번호</option>
							<option value="title" <c:if test="${search.searchCondition == 'title' }">selected</c:if>>제목</option>
						</select>
						<input type="text" name="searchValue" placeholder="검색어를 입력하세요.">
						<input type="submit" value="검색">
					</form>
				</td>
			</tr>	
		</tfoot>
	</table>	
	</div>
	<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>