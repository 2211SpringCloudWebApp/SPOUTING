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
		
		.modify-btn {
			--float: right;
			cursor: pointer;
		}
		
		#sns-main {
			padding: 40px;
			height: 700px;
			width: 800px;
			background-color: #f0f0f0;
 			margin: 0 auto;
		}

		#sns-profile {
			width: 700px;
			height: 160px;
			background-color:rgb(187, 187, 255);
		}

		#img-box {
			height: inherit;
			width: 200px;
			background-color: beige;
			float: left;
			display: flex;
			justify-content: center;
			align-items: center;
		}

		#profile-box {
			height: inherit;
			width: 500px;
			background-color: coral;
			float: left;
			display: flex;
			flex-direction: column;
			justify-content: center;
		}


		#sns-content {
			--width: inherit;
			height: 430px;
			background-color: aqua;
			--overflow: scroll;
			margin-top: 20px;
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
	<div id="sns-main">
	<button type="button" class="modify-btn">프로필 수정</button>
		<!-- 프로필 영역 -->
        <div id="sns-profile">
			<div id="img-box">
				<img id="sns-profile-img" src="/resources/images/meeting/image1.jpg" alt="">
<!-- 				이미지 업로드 영역 -->
<!-- 				<input type='file' name='uploadFile'><br/> -->

<!-- 				<button id='uploadBtn'>Upload</button> -->
<!-- 				<button id='removeBtn'>Remove</button> -->
<!-- 				업로드 영역 끝 -->
			</div>
			<div id="profile-box">
				<h1>${oneSns.userName }</h1> <br>
				<span>${oneSns.profileIntoduce }</span>
			</div>
		</div>

		<br>
		<!-- sns 사진 영역 -->
		<div id="sns-content">
			<div id="photo-box">
				sns 사진 영역
				<input type="button" onclick="location.href='/sns/uploadPage'" value="sns사진 등록">
			</div>
		</div>

    </div>
    
    <br>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script>
		
	</script>
	
</body>
</html>