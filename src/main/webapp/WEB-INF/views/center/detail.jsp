<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>지점 상세페이지</title>
		<link rel="stylesheet" href="../../../resources/css/centerCss/detail.css">
		<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
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

		<main>
			<div class="title">
				<h1>SPOUTING</h1>
				<h3>${center.centerName }</h3>
				<div class="division-line"></div>
				<h3>${center.centerAddr}</h3>
				<h3>${center.centerSnaddr}</h3>
			</div>
			<div id="photo">
				<div id="slide">
					<ul>
						<c:if test="${empty center.centerFilename1 || empty center.centerFilename2 }">
							<li><img alt="center대표이미지1" src="${pageContext.request.contextPath}/resources/images/homeImg/mainimg2.jpg"></li>
							<li><img alt="center대표이미지2" src="${pageContext.request.contextPath}/resources/images/homeImg/mainimg3.jpg"></li>
						</c:if>
						<c:if test="${!empty center.centerFilename1 && !empty center.centerFilename2 }">
							<li><img alt="center이미지" src="${pageContext.request.contextPath}/resources/images/centeruploadFiles/${center.centerFilename1 }"></li>
							<li><img alt="center이미지" src="${pageContext.request.contextPath}/resources/images/centeruploadFiles/${center.centerFilename2 }"></li>
						</c:if>
					</ul>
				</div>
			</div>
			<div class="bottom">
				<h3 class="hTag">스파우팅 ${center.centerName}</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<h3 class="hTag">☎ ${center.centerTel}</h3>
			</div>
			
			<c:if test="${sessionScope.loginUser.userType eq '1'}">
				<button class="button" onclick="location.href='/center/listView'">목록</button>
				<button class="button" onclick="location.href='/center/modifyView?centerNo=${center.centerNo}'">수정하기</button>
			</c:if>
			<c:if test="${sessionScope.loginUser.userType ne '1'}">
				<button class="button" onclick="location.href='/center/search'">돌아가기</button>
			</c:if>
		</main>
		
			
		

		<!-- footer -->
		<jsp:include page="../common/footer.jsp"></jsp:include>
		
		
		
		<script>
			$('#slide>ul>li').hide();
			$('#slide>ul>li:first-child').show();
	
			setInterval(function(){
			    $('#slide>ul>li:first-child').fadeOut()
			    .next().fadeIn().end(1000)
			    .appendTo('#slide>ul');
			},3000);
		</script>
		
		
	</body>
</html>