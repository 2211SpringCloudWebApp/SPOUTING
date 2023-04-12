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
			<c:forEach var="row" items="${pList }">
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
			<tr>
				<td colspan="5" align="center" style="height : 50px;">
					<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
							<c:url var="pageUrl" value="/shop/productList">
								<c:param name="page" value="${p }"></c:param>
							</c:url>
							<a href="${pageUrl }">${p }</a>&nbsp;&nbsp;&nbsp;
					</c:forEach>
				</td>
			</tr>
		</tfoot>
	</table>
	
	<div>
		
	</div>
	
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>