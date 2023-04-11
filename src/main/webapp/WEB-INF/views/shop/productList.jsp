<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Product List</title>
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
	<h1 style="color:#1C3879">SPOUTING'S CLOTHES & BAGS</h1>
	<p>스파우팅 한정 제작 패션 아이템</p>
	
	<table>
		<tr>
			<th>상품번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>이미지</th>
		</tr>
		<c:forEach var="row" items="${pList }">
			<tr>
				<td>${row.productNo }</td>
				<td>${row.productName }</td>
				<td>${row.productPrice }</td>
				<td>
					<a href="${path}/shop/product/detail/${row.productNo}">
						<img src="${path }/images/${row.productFilename}">
					</a>
				</td>
			</tr>
		</c:forEach>
		
	</table>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>