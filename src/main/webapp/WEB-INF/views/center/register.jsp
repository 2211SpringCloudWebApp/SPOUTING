<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>지점 등록</title>
	</head>
	<body>
		<!-- header -->
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<form action="/center/register" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<th>센터명*</th>
					<td><input type="text" name="centerName"></td>
				</tr>
				<tr>
					<th>주소*</th>
					<td><input type="text" name="centerAddr"></td>
				</tr>
				<tr>
					<th>전화번호*</th>
					<td><input type="text" name="centerTel"></td>
				</tr>
				<tr>
					<th>사진등록</th>
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
<!-- 			센터명 : <input type="text" name="centerName"><br> -->
<!-- 			주소 : <input type="text" name="centerAddr"><br> -->
<!-- 			전화번호 : <input type="text" name="centerTel"><br> -->
<!-- 			사진등록 : <input type="file" name="uploadFile" onchange="loadImg(this);"><br> -->
			
			
			<input type="submit" value="등록하기">
			<input type="reset" value="취소">
		</form>
		
		
		<script>
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
		
		<!-- footer -->
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>