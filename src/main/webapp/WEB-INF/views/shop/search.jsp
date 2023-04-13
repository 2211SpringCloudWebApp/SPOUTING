<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SPOUTING PRODUCT</title>
	<link rel="stylesheet" href="../../../resources/css/shopCss/shop.css">
	<style>
		#nav {
		  float: left;
		  width: 200px;
		  height : 50vh;
		}
	</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div id="nav">
		<jsp:include page="./menu.jsp"></jsp:include>
	</div>
	<div id="maincontainer">
	<h1 style="color:#1C3879">SPOUTING'S ALL PRODUCT</h1>
	<p>스파우팅 마켓의 모든 제품을 한 눈에 !</p>
	<br><br><br><br>
	<table>
		<thead>
			<tr>
				<th scope="row">상품번호</th>
				<th scope="row">이미지</th>
				<th scope="row">상품명</th>
				<th scope="row">가격</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${sList }">
				<tr>
					<td>${row.productNo }</td>
					<td>
						<a href="/shop/product/detail/${row.productNo}">
							<img src="/resources/images/product/items/${row.productFilename}">
						</a>
					</td>
					<td>${row.productName }</td>
					<td>${row.productPrice }</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
		<!-- 게시글 페이징 처리 -->
			<tr>
				<td colspan="5" align="center" style="height : 50px; border-bottom:0px;">
					<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
							<c:url var="pageUrl" value="/shop/productList">
								<c:param name="page" value="${p }"></c:param>
								<c:param name="searchValue" value="${search.searchValue }"></c:param>
								<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
							</c:url>
							<a href="${pageUrl }">${p }</a>&nbsp;&nbsp;&nbsp;
					</c:forEach>
				</td>
			</tr>
		<!-- 게시글 조건부 검색 -->
			<tr>
				<td colspan="4" align="center" style="height : 50px;">
					<form action="/product/search" method="get">
						<select name="searchCondition">
								<option value="all" <c:if test="${search.searchCondition == 'all' }">selected</c:if>>전체</option>
								<option value="no" <c:if test="${search.searchCondition == 'no' }">selected</c:if>>상품번호</option>
								<option value="title" <c:if test="${search.searchCondition == 'title' }">selected</c:if>>상품명</option>
								<option value="description" <c:if test="${search.searchCondition == 'description' }">selected</c:if>>상품설명</option>
							</select>
							<input type="text" name="searchValue" placeholder="검색어를 입력하세요.">
							<input type="submit" value="검색">
					</form>
				</td>
			</tr>	
		</tfoot>
	</table>	
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>