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
			<c:forEach var="review" items="${rList }">
				<tr>
					<td>${review.reviewNo }</td>
					<td>${row.reviewTitle }
						<a href="/review/detail?reviewNo=${review.reviewNo}">${review.reviewTitle }</a>
					</td>
					<td>${review.userId }</td>
					<td><fmt:formatDate value="${review.reviewDate}" pattern="yyyy.MM.dd" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<table id="navi-box">
		<!-- 게시글 페이징 처리 -->
		<tr>
			<td>
				<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
						<c:url var="pageUrl" value="/review/reviewList">
							<c:param name="page" value="${p }"></c:param>
							<c:param name="searchValue" value="${search.searchValue }"></c:param>
							<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
						</c:url>
						<a href="${pageUrl }" class="navi-btn3">${p }</a>&nbsp;
				</c:forEach>
			</td>
		</tr>
		<!-- 게시글 조건부 검색 -->
		<tr>
			<td>
				<form action="/review/search" method="get">
					<select name="searchCondition" id="search-select">
						<option value="all">전체</option>
						<option value="no">번호</option>
						<option value="title">제목</option>
					</select>
					<input id="search-box" type="text" name="searchValue" placeholder="검색어를 입력하세요.">
					<input id="search-btn" type="submit" value="검색">
				</form>
			</td>
		</tr>	
	</table>
	
	
	</div>
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	
</body>
</html>