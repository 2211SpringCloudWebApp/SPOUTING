<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>지점 상세페이지</title>
		<link rel="stylesheet" href="../../../resources/css/centerCss/detail.css">
		<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	</head>
	<body>
		<!-- header -->
		<jsp:include page="../common/header.jsp"></jsp:include>

		<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
		<main>
			<h1>SPOUTING</h1>
			<div class="title">
				<h3>${center.centerName }</h3>
				<div class="division-line"></div>
				<h3>${center.centerAddr}</h3>
			</div>
			<div class="photo">
				<img alt="center이미지" src="${pageContext.request.contextPath}/resources/images/centeruploadFiles/${center.centerFilename1 }">
<%-- 				<img alt="center이미지" src="${pageContext.request.contextPath}/resources/images/centeruploadFiles/${center.centerFilename2 }"> --%>
			</div>
	
			<h3 class="hTag">스파우팅 ${center.centerName}</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<h3 class="hTag">☎ ${center.centerTel}</h3>
		</main>
		
			
		

		<!-- footer -->
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>