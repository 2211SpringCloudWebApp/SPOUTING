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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

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
			padding: 15px;
			height: 700px;
			width: 800px;
			background-color: #F3F3F3FF;
 			margin: 0 auto;
 			border: solid 1px black;
		}

		#sns-profile {
			width: 700px;
			height: 100px;
			--background-color:rgb(187, 187, 255);
		}

		#img-box {
			height: inherit;
			width: 90;
			--background-color: beige;
			float: left;
			display: flex;
			--justify-content: center;
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
			width: 500px;
			height: 430px;
			--background-color: aqua;
			--margin-top: 15px;
			margin: 0 auto;
		}


		#sns-profile-img {
			border-radius: 50%;
			border: solid 1px black;
			width: 70px;
			height: 70px;
			display: flex;
			justify-content: center;
			align-items: center;
				}
				
				
		#sns-content-img {
			width: 500px;
		}
		
		#sns-reply {
			height: 140px;
			width: 770px;
			--background-color: aqua;
		}
		
		#sns-reply-list {
			width: 770px;
			height: 80px;
			overflow: auto;
			--background-color: pink;
		}
		
		#sns-reply-write {
			width: 770px;
			height: 40px;
			--background-color: red;
		}
		
		input[type=text] {
			width: 700px;
			height: 30px;
			border-radius: 15px;
			padding-left: 10px;
			
		}
		
		input[type=submit] {
			width: 50px;
			height: 30px;
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
	            window.location.replace("http://127.0.0.1:8999/user/login");
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
					<h2 class="profile-name">${oneSns.userName }</h2>
				</div> 
			</div>
		</div>
		
		<input type="hidden" value="${snsDetail.snsPhotoNo }">
		
		<div id="sns-content">
		<img id="sns-content-img" src="/resources/images/sns/${snsDetail.snsFileRename }" alt="">
		<br>
		${snsDetail.snsContent }
		</div>
		<div id="sns-reply"> <b>댓글</b>
			<div id="sns-reply-list">
				
			</div>
			
			<div id="sns-reply-write">
				<input type="text" id="reply-content">
				<input type="submit" value="등록" id="reply-submit">
			</div>
		</div>

    </div>
    
    <br>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script>
		$("#reply-submit").on("click", function() {
	//			alert("test");
			const snsPhotoNo = "${snsDetail.snsPhotoNo }";
			const userNo = "${sessionScope.loginUser.userNo }";
			const snsComment = $("#reply-content").val();
			$.ajax({
				url:"/comment/register",
				data: {
					"refBoardNo" : boardNo, 
					"replyWriter" : boardWriter, 
					"replyContents" : rContents, 
					},
				type: "post",
				success : function(result) {
					if(result == '1') {
						alert("댓글 등록 성공");
						$("#rWriter").val("");
						$("#rContents").val("");
	//						location.href="";
					} else {
						alert("[에러 발생] 로그 확인 필요");
						console.log(result);
					}
				},
				error : function() {
					alert("ajax 처리 실패");
				}
			})
		})
	
	
	
	</script>
	
</body>
</html>