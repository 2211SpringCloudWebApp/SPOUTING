<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 상세</title>
	<link rel="stylesheet" href="../../../../resources/css/shopCss/table.css">
	<style>
  		#maincontainer {
			height : 1200px;
		}
		td {
			height : 50px;
			padding : 10px;
		}
  	</style>
</head>
<body>
	<jsp:include page="../../admin/adminHeader.jsp"></jsp:include>
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
				<td>${product.categoryNo }</td>
			</tr>
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
				<c:if test="${not empty product.productFilename1}">
				<td>첨부파일1</td>
				<td>
					<img id="img-view1" width="200"src="/resources/images/product/items/${product.productFilename1 }" >
				</td>
				</c:if>
			</tr>
			<tr>
				<c:if test="${not empty product.productFilename2}">
				<td>첨부파일2</td>
				<td>
					<img id="img-view2" width="200"src="/resources/images/product/description/${product.productFilename2 }" >
				</td>
				</c:if>
			</tr>	
		</table>
		<div id="buttonbox">
		  <button class="btn" onclick="location.href='/product/adminProductList';">상품 목록</button>
		  <button class="btn" onclick="location.href='/product/modifyView?productNo=${product.productNo}';">정보 수정</button>
		  <button class="btn" onclick="removeCheck(${product.productNo});">상품 삭제</button>
		</div>
	</div>
	
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	
	<script>
		function removeCheck(productNo) {
			if(confirm("정말 삭제하시겠습니까?")) {
				location.href="/product/remove?productNo=" + productNo;					
			}
		}

		function loadImg1(obj) {
			if(obj.files.length != 0 && obj.files[0] != 0) {
				let reader = new FileReader();
				reader.readAsDataURL(obj.files[0]);
				reader.onload = function(e) {
					document.querySelector("#img-view1").setAttribute("src", e.target.result);
				}
			}else {
				document.querySelector("#img-view1").setAttribute("src", "");
			}
		}
		
		function loadImg2(obj) {
			if(obj.files.length != 0 && obj.files[0] != 0) {
				let reader = new FileReader();
				reader.readAsDataURL(obj.files[0]);
				reader.onload = function(e) {
					document.querySelector("#img-view2").setAttribute("src", e.target.result);
				}
			}else {
				document.querySelector("#img-view2").setAttribute("src", "");
			}
		}
	</script>
</body>
</html>