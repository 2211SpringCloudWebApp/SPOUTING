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
			height: 900px;
			width: 800px;
			background-color: #F3F3F3FF;
 			margin: auto;
 			border: solid 1px black;
 			margin-top: 20px;
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
		
		.profile-name-box {
			--display: flex;
		}
		
		.profile-name {
			font-size: 35px;
			font-weight: bold;
		}
		
		.letter-icon {
			margin: 3px 0 0 10px;
			align-items: center;
			cursor: pointer;
			transition-duration: 0.3s;
		}
		
		.letter-icon:active {
			margin-left: 1px;
			margin-top: 1px;
		}
		
		.follow-user-box {
			float: right;
			font-size: 20px;
			text-align: right;
		}
		
		.follow-user {
			padding: 5px;
			margin: 10px;
			border: 1px solid black;
			cursor: pointer;
			background-color: white;
		}
		
/* 		.follow-user:hover { */
/* 			box-shadow: 0 10px 35px rgba(0, 0, 0, 0.05), 0 6px 6px rgba(0, 0, 0, 0.1); */
/*     		transition: box-shadow 0.1s linear; */
/* 		} */
		
		


		#sns-content {
			--width: inherit;
			height: 600px;
			margin-top: 20px;
		    display: flex;
		    justify-content: flex-start;
		    flex-wrap : wrap;
		    overflow: auto;
		}
		
		.one-photo {
			width: 220px; 
 			height: 220px; 
			cursor: pointer; 
 			margin: 10px; 
		}
		
		.one-photo:hover {
			box-shadow: 1px 1px 20px #ddd;
		}
		

/*  		#sns-content img {  */
/* 			width: 220px;  */
/*  			height: 220px;  */
/* 			cursor: pointer;  */
/*  			margin: 10px;  */
/* 	}  */
	
/* 	#sns-content img:hover { */
	
/* 		box-shadow: 1px 1px 20px #ddd; */
/* 	} */


		#sns-profile-img {
			border-radius: 50%;
			border: solid 1px black;
			width: 130px;
			height: 130px;
			display: flex;
		    justify-content: flex-start;
		    flex-wrap: wrap;
		    align-content: flex-start;
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

		#sns-write-btn {
			width: 80px;
			height: 35px;
			border: solid 1px black;
			background-color: white;
			border-radius: 5px;
			box-shadow: 1px 1px 1px gray;
			transition-duration: 0.3s;
		}
		
		#sns-write-btn:active {
			margin-left: 5px;
			margin-top: 5px;
			box-shadow: none;
		}
		
		hr {
			width:100%;
			margin-top: 15px;
			margin-bottom: 15px;
			
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
	
<!-- 	에이잭스로 사진 불러오기 구현한 부분 -->
<%-- 	<c:if test="${sessionScope.loginUser.userNo ne null }"> --%>
<!-- 		<script> -->
<!-- // 			$(document).ready(function () { -->
<!-- // 				photoMoreAjax(1,userNo); -->
<!-- //         	}); -->
<!-- 		</script> -->
<%-- 	</c:if> --%>
	
	
	<div id="sns-main">
			
		<c:if test="${loginUser != null and loginUser.userNo eq oneSns.userNo }">
			<input type="button" id="sns-write-btn" onclick="location.href='/sns/uploadPage'" value="&nbsp;&nbsp;글쓰기✏️" style="float: right; cursor: pointer;">
		</c:if>
	
	<c:if test="${loginUser != null and loginUser.userNo eq oneSns.userNo }">
		<div class="btn-box">
			<button type="button" class="img-modify-btn">사진 수정</button>
			<button type="button" class="modify-btn">한줄소개 수정</button>
		</div>
	</c:if>
	
	<br>
	
	
		<!-- 프로필 영역 -->
        <div id="sns-profile">
			<div id="img-box">
				<img id="sns-profile-img" src="/resources/images/profile/${oneSns.profileFileRename }" alt="">
			</div>
			<div id="profile-box">
				<input type="hidden" value="${oneSns.userNo }" id="userNo" name="userNo">
				<span class="profile-name-box">
					<span class="profile-name">${oneSns.userName }</span>
					
					<c:if test="${loginUser.userNo eq oneSns.userNo }">
						<img class="letter-icon" src="/resources/images/message/mail.png" alt="" width="30px" height="30px" onclick="window.open('/message?userNo=${loginUser.userNo}','메세지함','width=570,height=620,location=no,status=no,scrollbars=yes');">
					</c:if>
					
					<c:if test="${loginUser.userNo ne oneSns.userNo }">
						<c:set var="alreadyfollowed" value="false"/>
						<c:forEach items="${followingCheckList}" var="followingCheckList">
							<c:if test="${oneSns.userNo eq followingCheckList.userNo}">
								<c:set var="alreadyfollowed" value="true"/>
							</c:if>
						</c:forEach>
					
						<c:choose>
							<c:when test="${alreadyfollowed eq 'false'}">
								<img class="letter-icon" src="/resources/images/sns/follow.png" alt="" width="30px" height="30px" onclick="followCheck();">
							</c:when>
							<c:otherwise>
								<img class="letter-icon2" src="/resources/images/sns/followers.png" alt="" width="30px" height="30px">
							</c:otherwise>
						</c:choose>		
					</c:if>
					
					
					
					<span class="follow-user-box">
						<span class="follow-user" onclick="location.href='/sns/followingPage?userNo=${oneSns.userNo }'"><b>팔로잉&nbsp</b>${followingCount }</span>
						<span class="follow-user" onclick="location.href='/sns/followerPage?userNo=${oneSns.userNo }'"><b>팔로워&nbsp</b>${followerCount }</span>
					</span>
				</span> 
				<br>
				<span class="profile-intro-box">
					<span class="profile-intro">${oneSns.profileIntoduce }</span>
				</span>
			</div>
		</div>
		
		<hr>
		
		<!-- sns 사진 영역 -->
<%-- 		<c:if test="${loginUser != null and loginUser.userNo eq oneSns.userNo }"> --%>
<!-- 			<input type="button" onclick="location.href='/sns/uploadPage'" value="sns사진 등록"> -->
<%-- 		</c:if> --%>
		
<!-- 		<div id="photo-box"> -->
			<div id="sns-content">
<%-- 				<input type="hidden" id="more-var" totalCount="${totalCount}" currentSum="0" currentCount="0" value="1"> --%>

				<c:forEach items="${oneSnsPhoto }" var="oneSnsPhoto" varStatus="i">
					<img class="one-photo" src="/resources/images/sns/${oneSnsPhoto.snsFileRename }" alt="" onclick="location.href='/sns/detail?snsPhotoNo=${oneSnsPhoto.snsPhotoNo}'">
				
				</c:forEach>
			</div>
		</div>

<!--     </div> -->
    
    <br>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script>
	var profileStatus = false;
	var intro = $('.profile-intro').text();
	var userNo = $("#userNo").val();
	const snsContent = $("#sns-content");
	const moreVar = $("#more-var");
	


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
		
		
	//한줄소개 수정 버튼
		$(".modify-btn").click(function() {
			imgModifyClose();
			if(!profileStatus) {
				var str = "<textarea type='text' class='profile-intro-input' spellcheck='false' style='resize: none; width: 300px; height: 30px; padding: 5px;'></textarea>";
				var btn = "<button type='button' onclick='ajaxProfileModify();' value='저장' class='modify-submit-btn'>저장</button><button type='button' onclick='modifyClose();' value='저장' class='modify-submit-btn' id='modify-close-btn'>취소</button>";
				$(".btn-box").append(btn);
				$(".profile-intro-box").append(str);
				$(".profile-intro-input").val($(".profile-intro").html());
				$(".profile-intro").remove();
				profileStatus = true;
			}
		});
		
		
	//에이잭스 한줄소개 코드
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
		
		
		//프로필사진 수정버튼
		$(".img-modify-btn").click(function() {
			$(".profile-intro-input").remove();
			$('.modify-submit-btn').remove();
			$('.modify-close-btn').remove();
			if(!profileStatus) {
// 				var str = "<textarea type='text' class='profile-intro-input' spellcheck='false'></textarea>";
				var btn = "<input type='file' onclick='' value='저장' class='file-upload-btn'> <button type='button' onclick='fn_submit();' value='저장' class='img-upload-btn' id='img-upload-btn'>등록</button> <button type='button' onclick='imgModifyClose();' value='저장' class='img-close-btn' id='img-close-btn'>취소</button>";
				$(".btn-box").append(btn);
// 				$(".profile-intro-box").append(str);
// 				$(".profile-intro-input").val($(".profile-intro").html());
// 				$(".profile-intro").remove();
				profileStatus = true;
			}
		});
		
		
		//프로필사진 수정 버튼 구현하는 부분ㅋㅎㅋㅎ
		function imgModifyBtn() {
			
		}
		
		
// 		프사 업로드
		function fn_submit(){
        
	        var form = new FormData();
	        form.append( "uploadFile", $(".file-upload-btn")[0].files[0] );
	        
	         $.ajax({
	             url : "/sns/profileImgUpload"
	           , type : "POST"
	           , processData : false
	           , contentType : false
	           , data : form
	           , success:function(response) {
	               alert("프로필 사진이 변경되었습니다.");
	               document.location.reload();
	               console.log(response);
	           }
	           ,error: function (jqXHR) 
	           { 
	               alert(jqXHR.responseText); 
	           }
	       });
		}

		
		//업로드한 사진 불러오기
		function photoMoreAjax(start, userNo) {
			$.ajax({
				url:"/sns",
				data: {
					"userNo" : userNo,
					"start" : start
				},
				type: "post",
				success : function(result) {
					let html = "";
					for(let i = 0; i< result.length; i++) {
// 						html += "<div>";
						html += "<a href='/sns/detail?snsPhotoNo="+result[i].snsPhotoNo+"'>"
						html +=		"<img src='/resources/images/sns/"+result[i].snsFileRename+"'>";
						html += "</a>";
// 						html +=		"<p class='caption'>"+result[i].snsContent+"</p>";
// 						html += "</div>";
					}
					moreVar.val(Number(start)+1);
					moreVar.attr("currentSum", Number(moreVar.attr("currentSum"))+result.length); //지금까지 쿼리한 갯수
					moreVar.attr("currentCount",0);
					snsContent.append(html);
				},
				error : function() {
					alert("ajax 처리 실패");
				}
			});
			
		}
		
		
// 		$(window).scroll(function() {
// 			let scrollTop = $(window).scrollTop();
// 			let innerHeight = $(window).innerHeight();
// 			let scrollHeight = $("body").prop("scrollHeight");
			
// 			if(scrollTop + innerHeight >= scrollHeight) {
// 				console.log("bottom end!");
// 				if(moreVar.attr("totalCount") != moreVar.attr("currentSum")) {
// 					photoMoreAjax(moreVar.val());
// 				}
// 			}
// 		});


		//유저 팔로우
		function followCheck() {
			if(confirm("팔로우 하시겠습니까?")) {
				location.href="/sns/follow?userNo="+userNo;
			}
			
		}
		
	
		
	</script>
	
</body>
</html>