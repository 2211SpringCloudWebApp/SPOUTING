<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>등록완료😎</title>
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		
	    <div class="main">
	        <br><br>
	        <h2>${msg }</h2>
	        <button onclick="location.href='/'">메인화면으로 가기</button>
	    </div>
	    
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>