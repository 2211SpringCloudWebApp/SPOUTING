<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>지점 상세페이지</title>
		<link rel="stylesheet" href="../../../resources/css/centerCss/detail.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	</head>
	<body>
		<!-- header -->
		<jsp:include page="../common/header.jsp"></jsp:include>

		<main>
			<h1>SPOUTING</h1>
			<div class="title">
				<h3>${center.centerName }</h3>
				<div class="division-line"></div>
				<h3>${center.centerAddr}</h3>
			</div>
	<%-- 			<img ${center.centerFile } id="img-view" width="350"> --%>
	<!-- 		<div id="img-box"> -->
	<!-- 			<img class="centerimg" src="../../../resources/images/center/climbing.jpg" alt="centerimg1"> -->
	<!-- 			<img class="centerimg" src="../../../resources/images/center/climbing_img.jpg" alt="centerimg1"> -->
	<!-- 			<img class="centerimg" src="../../../resources/images/center/swimming.jpg" alt="centerimg1"> -->
	<!-- 			<img class="centerimg" src="../../../resources/images/center/swimming_img.jpg" alt="centerimg1"> -->
	<!-- 			<img class="centerimg" src="../../../resources/images/center/tennis.jpg" alt="centerimg1"> -->
	<!-- 			<img class="centerimg" src="../../../resources/images/center/tennis_img.jpg" alt="centerimg1"> -->
	<!-- 		</div>		 -->
			<div class="photo">
	<%-- 			<img alt="center이미지" src="/center/loadImage?centerFilename1=${center.centerFilename1 }"> --%>
				<img alt="center이미지" src="${pageContext.request.contextPath}/resources/centeruploadFiles/?centerFilename1=${center.centerFilename1 }">
			</div>
	
			<h3 class="hTag">스파우팅 ${center.centerName}</h3>
			<h3 class="hTag">${center.centerTel}</h3>
		</main>
			
		

		<!-- footer -->
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>