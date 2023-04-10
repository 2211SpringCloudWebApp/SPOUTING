<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>지점 등록</title>
	</head>
	<body>
		
		<form action="/center/modify" method="post" enctype="multipart/form-data">
			센터명 : <input type="text" name="centerName" value="${center.centerName }"><br>
			주소 : <input type="text" name="centerAddr" value="${center.centerAddr }"><br>
			전화번호 : <input type="text" name="centerTel" value="${center.centerTel }"><br>
			센터사진 : <input type="file" name="uploadFile" value="${center.uploadFile }"><br>
			
			<input type="submit" value="수정완료">
			<input type="reset" value="취소">
		</form>
	</body>
</html>