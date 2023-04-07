<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>지점 등록</title>
	</head>
	<body>
		
		<form action="/center/register" method="post" enctype="multipart/form-data">
			센터명 : <input type="text" name="centerName"><br>
			주소 : <input type="text" name="centerAddr"><br>
			전화번호 : <input type="text" name="centerTel"><br>
			사진등록 : <input type="file" name="uploadFile"><br>
			
			<input type="submit" value="등록하기">
			<input type="reset" value="취소">
		</form>
	</body>
</html>