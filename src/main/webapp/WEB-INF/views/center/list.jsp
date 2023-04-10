<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>지점 목록</title>
	</head>
	<body>
		
		<main>
			<h1>지점 목록</h1>
			<h2>SPOUTING</h2>
			<div>
				<table>
					<colgroup>
						<col style="width: 20%;">
						<col style="width: 40%;"> 
						<col style="width: 30%;">
						<col style="width: 10%;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">센터명</th>
							<th scope="col">센터주소</th>
							<th scope="col">센터전화번호</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${center.centerName}</td>
							<td>${center.centerAddr}</td>
							<td>${center.centerTel}</td>
							<td><input type="submit" value="삭제"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</main>
		
	</body>
</html>