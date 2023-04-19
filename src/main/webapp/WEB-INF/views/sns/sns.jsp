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
			padding: 40px;
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
				
		.modify-btn {
			--float: right;
			cursor: pointer;
		}
		
		.img-modify-btn {
			cursor: pointer;
		}
			
		.modify-submit-btn {
			cursor: pointer;
		}
		
		.modify-close-btn {
			cursor: pointer;
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
	
	<c:if test="${loginUser != null and loginUser.userNo eq oneSns.userNo }">
		<div class="btn-box">
			<button type="button" class="img-modify-btn">사진 수정</button>
			<button type="button" class="modify-btn">한줄소개 수정</button>
		</div>
	</c:if>
	
	
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
				<input type="hidden" value="${oneSns.userNo }" id="userNo">
				<div class="profile-name-box">
					<h1 class="profile-name">${oneSns.userName }</h1>
				</div> 
				<br>
				<div class="profile-intro-box">
					<span class="profile-intro">${oneSns.profileIntoduce }</span>
				</div>
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
	var profileStatus = false;
	var intro = $('.profile-intro').text();

	//한줄 소개 수정버튼 닫기
		function modifyClose() {
			$(".profile-intro-input").remove();
			$('.modify-submit-btn').remove();
			$('.modify-close-btn').remove();
			var str = "<span class='profile-intro'>" + intro + "</span>";
			$(".profile-intro-box").append(str);
			profileStatus = false;
		}
		
	
	//이미지 수정버튼 닫기
		function imgModifyClose() {
// 			$(".profile-intro-input").remove();
			$('.img-upload-btn').remove();
			$('.img-close-btn').remove();
			$('.file-upload-btn').remove();
// 			var str = "<span class='profile-intro'>" + intro + "</span>";
// 			$(".profile-intro-box").append(str);
			profileStatus = false;
		}
		
		
	
		$(".modify-btn").click(function() {
			imgModifyClose();
			if(!profileStatus) {
				var str = "<textarea type='text' class='profile-intro-input' spellcheck='false'></textarea>";
				var btn = "<button type='button' onclick='ajaxProfileModify();' value='저장' class='modify-submit-btn'>저장</button><button type='button' onclick='modifyClose();' value='저장' class='modify-submit-btn' id='modify-close-btn'>취소</button>";
				$(".btn-box").append(btn);
				$(".profile-intro-box").append(str);
				$(".profile-intro-input").val($(".profile-intro").html());
				$(".profile-intro").remove();
				profileStatus = true;
			}
		});
		
		
		function ajaxProfileModify() {
			profileStatus = false;
		    $.ajax({
		        url: "/ajaxProfileModify",
		        type: "post",
		        dataType: "json",
		        data: {
		            "userNo": $('#userNo').val(),
		            "profileIntro": $('.profile-intro-input').val()
		        },
		        success: function (data) {
		            $('.modify-submit-btn').remove();
		            $('.profile-intro-input').remove();
// 		            str = "<h1 class='profile-name-h1'>" + data.userName + "</h1>";
		            str = "<span class='profile-intro'>" + data.profileIntoduce + "</span>";
// 		            $('.profile-name').append(str);
		            $('.profile-intro-box').append(str);
// 		            str3 = "<img src='../img/abstract-user-flat-3.svg' style='width: 30px; height: 30px; border-radius: 50%' />";
// 		            $('#dropdownMenuButton1').text("  " + data.userName + "  ");
// 		            $('#dropdownMenuButton1').prepend(str3);
		        },
		        error: function (request, status, error) {
		            alert("code : " + request.status + "\n" + " message : " + request.responseText + "\n" + "error: " + error);
		        }
		    });
		}
		
		
		
		$(".img-modify-btn").click(function() {
			modifyClose();
			if(!profileStatus) {
// 				var str = "<textarea type='text' class='profile-intro-input' spellcheck='false'></textarea>";
				var btn = "<input type='file' onclick='imgModifyBtn();' value='저장' class='file-upload-btn'> <button type='button' onclick='' value='저장' class='img-upload-btn' id='img-upload-btn'>등록</button> <button type='button' onclick='imgModifyClose();' value='저장' class='img-close-btn' id='img-close-btn'>취소</button>";
				$(".btn-box").append(btn);
// 				$(".profile-intro-box").append(str);
// 				$(".profile-intro-input").val($(".profile-intro").html());
// 				$(".profile-intro").remove();
				profileStatus = true;
			}
		});
		
		
		
		function imgModifyBtn() {
			
		}
		
		

		
		
	</script>
	
</body>
</html>