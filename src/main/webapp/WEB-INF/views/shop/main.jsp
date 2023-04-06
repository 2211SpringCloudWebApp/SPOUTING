<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>피트니스 마켓</title>
	<link rel="stylesheet" href="../../resources/css/shopCss/main.css">
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<h3>카테고리</h3>
	<ul>
		<li><a href="">의류</a></li>
		<li><a href="">굿즈</a>
			<ul class="low">
				<li><a href="">핸드폰 케이스</a></li>
				<li><a href="">이어폰 케이스</a></li>
			</ul>
		</li>
		<li><a href="">악세사리</a></li>
		<li><a href="">문구</a></li>
	</ul>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>