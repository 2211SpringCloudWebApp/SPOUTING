<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 상세</title>
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
		    width: 100%;
		    height : 2000px;
		    padding-top : 150px;
		}
		h1, h2, h3, p {
			text-align : center;
		}
		img{
			height : 450px;
		}
	</style>
</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
	
	<div id="maincontainer">
		<h1>상품 상세 페이지</h1>
		<p>자세한 상품 정보를 확인해 보세요 !</p>
		<input type="hidden" id="prouct" name="prouct" value=${product.productNo }>
		<table>
			<tr>
				<td>
					<img src="/resources/images/product/items/${product.productFilename}">
				</td>
				<td>
					<table border="1">
						<tr>
							<td>상품명</td>
							<td>${product.productName }</td>
						</tr>
						<tr>
							<td>상품가격</td>
							<td>${product.productPrice }</td>
						</tr>
						<tr>
							<td>상품설명</td>
							<td>${product.productDescription }</td>
						</tr>
						<tr>
							<td>
								<form method="post" action="/shop/cart/insert">
									<input type="hidden" name="productNo" value=${product.productNo }>
								</form>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
				
		
	</div>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>