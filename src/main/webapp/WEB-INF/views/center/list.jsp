<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>지점 목록</title>
		<style>
			table {
				border : 1px solid black;
			}
			th {
				background-color : lightgray;
			}
			th, td {
				padding : 5px;
				border : 1px solid black;
			}
		</style>
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
							<td><a href="/center/detail?centerNo=${center.centerNo} ">${center.centerName}</a></td>
							<td>${center.centerAddr}</td>
							<td>${center.centerTel}</td>
							<td>
							<a href="/center/modifyView?centerNo=${center.centerNo}">지점수정</a>
<%-- 							<a href="/center/remove?centerNo=${center.centerNo}">지점삭제</a> --%>
							<a href="javascript:void(0);" onclick="removeCheck(${center.centerNo});">지점삭제</a>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<button onclick="location.href='/center/registerView'">지점 추가하기</button>

			<script>
				function removeCheck(centerNo) {
					if(confirm("정말 삭제하시겠습니까?")) {
						location.href="/center/remove?centerNo=" + centerNo;					
					}
				}
			</script>
		</main>
		
		
		
		
		
		<!-- footer -->
		<jsp:include page="../common/footer.jsp"></jsp:include>
		
	</body>
</html>