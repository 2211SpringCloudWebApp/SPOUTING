<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>sns 페이지</title>

    <style>
    	@font-face {
		    font-family: 'Pretendard-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
		    font-weight: 400;
		    font-style: normal;
		    }
	
		body {
		    background-color: white;
		    font-family: 'Pretendard-Regular';
		}
		
		#sns-main {
			padding: 25px;
			height: 700px;
			width: 800px;
			background-color: #F3F3F3FF;
 			margin: 0 auto;
 			border: solid 1px black;
		}

		#sns-profile {
			width: 700px;
			height: 160px;
			--background-color:rgb(187, 187, 255);
		}

		#img-box {
			height: inherit;
			width: 200px;
			--background-color: beige;
			float: left;
			display: flex;
			justify-content: center;
			align-items: center;
		}

		#profile-box {
			height: inherit;
			width: 500px;
			--background-color: coral;
			float: left;
			display: flex;
			flex-direction: column;
			justify-content: center;
		}


		#sns-content {
			--width: inherit;
			height: 430px;
			background-color: aqua;
		}


		#sns-profile-img {
			border-radius: 50%;
			border: solid 1px black;
			width: 130px;
			height: 130px;
			display: flex;
			justify-content: center;
			align-items: center;
				}
				
    </style>

</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<br>
	
	<c:if test="${sessionScope.loginUser.userNo eq null }">
		<script>
			$(document).ready(function () {
	            alert("로그인이 필요합니다.")
	            window.location.replace("http://localhost:8999/user/login");
        	});
		</script>
	</c:if>
	
	<div id="sns-main">
			
	
		<!-- 프로필 영역 -->
        <div id="sns-profile">
			<div id="img-box">
				<img id="sns-profile-img" src="/resources/images/profile/${oneSns.profileFileRename }" alt="">
			</div>
			<div id="profile-box">
				<input type="hidden" value="${oneSns.userNo }" id="userNo" name="userNo">
				<div class="profile-name-box">
					<h1 class="profile-name">${oneSns.userName }</h1>
				</div> 
				<br>
				<div class="profile-intro-box">
					<span class="profile-intro">${oneSns.profileIntoduce }</span>
				</div>
			</div>
		</div>
		
		<div id="sns-content">
		여기는 사진 들어갈 영역입니다~!~! 제발제발 젭 알 !
		</div>

    </div>
    
    <br>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script>
		
	</script>
	
</body>
</html>