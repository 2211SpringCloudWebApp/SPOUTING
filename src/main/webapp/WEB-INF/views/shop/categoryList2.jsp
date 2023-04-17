<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Category</title>
	<link rel="stylesheet" href="">
	<style>
		@font-face {
		    font-family: 'Pretendard-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
		    font-weight: 400;
		    font-style: normal;
		}
		
		* {
		    font-family: 'Pretendard-Regular'; 
		    box-sizing: border-box;
		}
		#nav {
		  float: left;
		  width: 200px;
		  height : 50vh;
		}
		#maincontainer {
		    width: calc(100% - 200px);
		    margin-left : 200px;
		    height : 2000px;
		    padding-top : 150px;
		}
		
		h1, p {
			text-align : center;
		}
		img{
			height : 100px;
		}
	</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div id="nav">
		<jsp:include page="./menu.jsp"></jsp:include>
	</div>
	
	
	<div id="maincontainer">
		<ul>
			<c:forEach items="${cateList}" var="product">
			<li>
				<div>
					<img src="/resources/images/product/items/${product.productFilename}">
				</div>
				<div>
					<a href="/product/detail?productNo=${product.productNo}">${product.productName}</a>
				</div>
				<div>
					<a href="/product/detail?productNo=${product.productNo}">${product.productPrice}</a>
				</div>
			</li>
			</c:forEach>
		</ul>

	</div>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>