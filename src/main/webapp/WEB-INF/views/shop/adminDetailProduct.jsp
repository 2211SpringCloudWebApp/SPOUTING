<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 상세</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div id="maincontainer">
		<h1>🔍 ️상품 상세</h1>
		<p>상품 정보를 조회하세요.</p>
		<table>
			<tr>
				<td>상품번호</td>
				<td>${product.productNo }</td>
			</tr>
			<tr>
				<td>카테고리 분류</td>
				<td><td>${product.categoryNo }</td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><td>${product.productName }</td>
			</tr>	
			<tr>
				<td>상품가격</td>
				<td><td>${product.productPrice }</td>
			</tr>	
			<tr>
				<td>상품설명</td>
				<td><td>${product.productDescription }</td>
			</tr>	
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="file" name="uploadFile1" onchange="loadImg1(this);">
						<div id="img-viewer1">
							<img id="img-view1" width="200">
						</div>
					<input type="file" name="uploadFile2" onchange="loadImg2(this);">
						<div id="img-viewer2">
							<img id="img-view2" width="200">
						</div>
				</td>
			</tr>	
		</table>
	</div>
	<div id="buttonbox">
	  <button onclick="location.href='/shop/adminProductList';">상품 목록</button>
	  <button onclick="location.href='/product/modifyView?productNo=${product.productNo}';">정보 수정</button>
	  <button a href="javascript:void(0);" onclick="removeCheck(${product.productNo});">상품 삭제</button>
	</div>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script>
		function removeCheck(productNo) {
			if(confirm("정말 삭제하시겠습니까?")) {
				location.href="/product/remove?productNo=" + productNo;					
			}
		}
	</script>
</body>
</html>