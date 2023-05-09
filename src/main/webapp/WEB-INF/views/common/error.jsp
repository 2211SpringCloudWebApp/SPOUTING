<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SPOUTING-error</title>
	<link rel="stylesheet" href="/resources/css/mainCss/error.css">
</head>
<body>
    <!-- header -->
	<!-- 관리자로 로그인한 경우 사용 헤더 -->
	<c:if test="${sessionScope.loginUser.userType eq '1'}">
		<jsp:include page="../admin/adminHeader.jsp"></jsp:include>
	</c:if>
	<!-- 회원으로 로그인한 경우 사용 헤더 -->
	<c:if test="${sessionScope.loginUser.userType ne '1'}">
		<jsp:include page="../common/header.jsp"></jsp:include>
	</c:if>
    
    <div id="error-container">
        <br><br>
        <h2>${msg }</h2>
        <h3>이용에 불편을 드려 죄송합니다.</h3>
        주소나 정보가 올바른지 다시 한번 확인해주시기 바랍니다. <br>
        지속적인 오류 발생 시, 고객센터로 문의하시면 향후 서비스 향상에 도움이 될 수 있습니다.<br>
        
        <!-- 관리자로 로그인한 경우 이동할 메인화면 -->
		<c:if test="${sessionScope.loginUser.userType eq '1'}">
        	<button id="error-btn" onclick="location.href='/admin/adminMain'">메인화면으로 가기</button>
        </c:if>
        <!-- 회원으로 로그인한 경우 이동할 메인화면 -->
		<c:if test="${sessionScope.loginUser.userType ne '1'}">
        	<button id="error-btn" onclick="location.href='/'">메인화면으로 가기</button>
        </c:if>
    </div>
    
    <!-- footer -->
    <jsp:include page="./footer.jsp"></jsp:include>
</body>
</html>