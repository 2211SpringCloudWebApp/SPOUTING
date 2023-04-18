<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Category</title>
	<link rel="stylesheet" href="../../../resources/css/shopCss/categoryList.css">
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div id="nav">
		<jsp:include page="./menu.jsp"></jsp:include>
	</div>
	
	
	<div id="maincontainer">
		<h1>APPAREL  |  LIFE  |  LEISURE</h1>
		<p>스타우터의 회원이 되는 지름길,스파우팅 마켓</p>
		<br><br>
		<!-- 게시글 조건부 검색 -->
		<div id="search">
			<form action="/product/search" method="get">
				<select name="searchCondition">
						<option value="all">전체</option>
						<option value="no">상품번호</option>
						<option value="title">상품명</option>
						<option value="description">상품설명</option>
					</select>
					<input type="text" name="searchValue" placeholder="검색어를 입력하세요.">
					<input type="submit" value="검색">
			</form>
		</div>
		<br><br>
		<ul>
			<c:forEach items="${cateList}" var="product">
			<div id="outterbox">
				<div>
					<img src="/resources/images/product/items/${product.productFilename}">
					<div id="inner">
						<a href="/product/detail?productNo=${product.productNo}">${product.productName}</a>
						<br>
						<a href="/product/detail?productNo=${product.productNo}">${product.productPrice}</a>
					</div>
				</div>
			</div>
			</c:forEach>
		</ul>

	</div>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>