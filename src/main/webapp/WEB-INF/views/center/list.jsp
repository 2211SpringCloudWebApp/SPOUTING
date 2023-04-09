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
		<!-- header -->
		<jsp:include page="../common/header.jsp"></jsp:include>
		<!-- main -->
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
						<c:forEach items="${cList }" var="center">
						<tr>
							<td>${center.centerName}</td>
							<td>${center.centerAddr}</td>
							<td>${center.centerTel}</td>
							<td>
							<a href="/center/modify">지점수정</a>
							<input type="submit" value="지점 삭제">
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<button><a href="/center/registerView">지점 추가하기</a></button>
		</main>
		
		<!-- footer -->
		<jsp:include page="../common/footer.jsp"></jsp:include>
		
	</body>
</html>