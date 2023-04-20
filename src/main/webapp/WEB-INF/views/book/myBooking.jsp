<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>결 제 내 역 조 회</title>
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		<main>
		<!-- c:forEach이거 쓰면되겟다
		회원 예약내역 가져오기(북넘버,유저넘버, 사용일/시, 사용인원, 센터명-시설명 -->
		${bList }
		
		</main>
		
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>