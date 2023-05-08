<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>소셜링 상세 페이지</title>
<link rel="stylesheet" href="/resources/css/meetingCss/meeting.css">
<style>
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

.meeting-subject {
	width: 700px;
	height: 140px;
	background-color: white;
	border-radius: 30px;
	display: flex; -
	-justify-content: center; -
	-align-items: center;
	margin: auto;
	position: relative;
	z-index: 2;
	border: 1px solid black;
}

#meeting-detail-box {
	position: relative;
	z-index: 1;
	width: 1000px;
	height: 400px;
	background-color: rgb(207, 207, 207);
	margin: auto;
	top: -70px;
	border-radius: 30px;
}

.meeting-detail {
	width: 800px;
	height: 250px; -
	-background-color: aqua;
	margin: auto;
}

#meeting-joinBtn {
	font-size: 22px;
	width: 700px;
	height: 60px;
	background-color: rgb(231, 231, 231);
	border-radius: 20px;
	cursor: pointer;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0 auto;
	border: 1px solid black;
}

#meeting-joinBtn:hover {
	background-color: rgb(55, 115, 179);
	color: white;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>

	<!--     <h1 id="meeting-header">🎯소셜링 상세 페이지</h1> -->
	<br>

	<!--     여기는 데이터 영역~!~! -->
	<div id="meeting-data">

		<div class="meeting-subject">

			<div class="meeting-img">
				<img class="meeting-img" src="/resources/images/meeting/image1.jpg"
					alt="">
			</div>

			<div id="meeting-content">
				<div class="meeting-title">
					<h1 class="meeting-title-h1">제목 들어갈 부분~!</h1>
					<br>
				</div>

				<div class="meeting-day">
					<span>날짜 들어갈 부분~!</span>
				</div>

				<div class="meeting-people">
					<span>인원 들어갈 부분~!</span>
				</div>
			</div>

		</div>

		<div id="meeting-detail-box">
			<br>
			<br>
			<br>
			<br>
			<br>
			<div class="meeting-detail">
				안녕하세요 <br> 여기는 미팅 상세 내용을 넣을 부분입니다 <br> 테스트 좀 해볼게요 <br>
				가나다라 마바사<br> abcdefg
			</div>
		</div>

		<div id="meeting-joinBtn" onclick="joinCheck();">
			<b>소셜링 참여하기👀</b>
		</div>

	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>

	<script>
		function joinCheck() {
			if (confirm("소셜링에 참여하시겠습니까?")) {
				location.href = "";
			}
		}

		function loginCheck(loginId, action) {
			event.preventDefault();
			if (loginId == "") {
				alert("로그인을 해주세요.");
				location.href = "/user/login";
			} else {
				action();
			}
		}
	</script>
</body>
</html>