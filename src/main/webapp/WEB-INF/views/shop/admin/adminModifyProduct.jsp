<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 수정</title>
</head>
<body>
	<jsp:include page="../../admin/adminHeader.jsp"></jsp:include>
	<div id="maincontainer">
		<h1>🗑 ️상품 수정</h1>
		<p>등록된 상품을 수정합니다.</p>
		<form action="/product/modify" method="post" enctype="multipart/form-data">
			<input type="hidden" name="productNo" value="${product.productNo }">
			<input type="hidden" name="productFilepath1" value="${product.productFilepath1 }">
			<input type="hidden" name="productFilepath2" value="${product.productFilepath2 }">
			<table>
				<tr>
					<td>카테고리 분류</td>
					<td>
						<select name="categoryNo" id="categoryNo">
					        <option value="1">1</option>
					        <option value="2">2</option>
					        <option value="3">3</option>
					        <option value="4">4</option>
					        <option value="5">5</option>
					        <option value="5">6</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>상품명</td>
					<td><input type="text" name="productName"></td>
				</tr>	
				<tr>
					<td>상품가격</td>
					<td><input type="text" name="productPrice" placeholder="숫자만 입력하세요."></td>
				</tr>	
				<tr>
					<td>상품설명</td>
					<td><input type="text" name="productDescription" placeholder="간단한 상품설명을 입력하세요."></td>
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
			<input type="submit" value="수정하기">
			<input type="reset" value="취소">
		</form>
	</div>
	
	<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>