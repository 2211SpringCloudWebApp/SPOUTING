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
			height: 730px;
			width: 800px;
			background-color: #F3F3F3FF;
 			margin: 0 auto;
 			border: solid 1px black;
		}

		#sns-profile {
			width: 700px;
			height: 100px;
			margin: 0 auto;
			display: flex;
			align-items: center;
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
				
				
		#sns-content-img-box {
			width: 400px;
			height: 300px;
			overflow:hidden;
		}	
		
			
		#sns-content-img {
			width:100%;
		    height:100%;
		    object-fit:cover;
		}
		
		#sns-reply {
			height: 140px;
			width: 770px;
			--background-color: aqua;
		}
		
		#sns-reply-list {
			width: 770px;
			height:110px;
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
		
		table {
			--border: solid 1px;
		}
		
		th, td {
			--border-bottom: 1px solid;
			padding: 10px;
		}
		
		.sns-comment-img {
			border-radius: 50%;
			border: solid 1px black;
			width: 30px;
			height: 30px;
			display: flex;
			justify-content: center;
			align-items: center;
			cursor: pointer;
			
		}
		
		#sns-delete-btn {
			float: right;
			width: 80px;
			height: 30px;
			margin: 10px;
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
				<c:if test="${loginUser.userNo eq oneSns.userNo }">
					<button id="sns-delete-btn" onclick="removeCheck(${snsDetail.snsPhotoNo});">글 삭제</button>
				</c:if>
		</div>
		
		<input type="hidden" value="${snsDetail.snsPhotoNo }">
		
		<div id="sns-content">
			<div id="sns-content-img-box">
				<img id="sns-content-img" src="/resources/images/sns/${snsDetail.snsFileRename }" alt="">
			</div>
			<br>
			<pre>${snsDetail.snsContent }</pre>
			
		</div>
		
		
		<div id="sns-reply"> 
			<div id="sns-reply-header">
				<b>댓글</b>
			</div>
			
			<div id="sns-reply-list">
				<!-- 댓글 목록 -->
				<table align="center" width="700" id="replyTable">
<!-- 					<thead> -->
<!-- 						<tr> -->
<!-- 							댓글 갯수 -->
<!-- 							<td colspan="4"><b id="replyCount"></b></td> -->
<!-- 						</tr> -->
<!-- 					</thead> -->
					<tbody>
<!-- 						<tr> -->
<!-- 							<td width= 70px;>프사</td> -->
<!-- 							<td width= 100px;>닉네임</td> -->
<!-- 							<td width= 470px;>안녕하세요 댓글 영역 테스트입니다.</td> -->
<!-- 							<td>삭제</td> -->
<!-- 						</tr> -->
						
						<c:forEach items="${commentList }" var="commentList" varStatus="i">
						<tr>
							<td width= 60px;><img class="sns-comment-img" src="/resources/images/profile/${commentList.profileFileRename }" alt=""  onclick="location.href='/sns?userNo=${commentList.userNo }';"></td>
							<td width= 80px;><b>${commentList.userName }</b></td>
							<td width= 510px;>${commentList.snsComment }</td>
							<td>
								<c:if test="${loginUser.userNo eq commentList.userNo }">
									<input type="hidden" value="${commentList.snsCommentNo }" name="snsCommentNo" id="snsCommentNo">
									<input type="button" value="삭제" onclick="removeComment(this);">
								</c:if>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
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
		
		getCommentList2();
	
		//댓글 리스트 불러오기
		function getCommentList2() {
			const snsPhotoNo = "${snsDetail.snsPhotoNo }";
			
			
			$.ajax({
				url : "/comment/list2",
				data : {
					"snsPhotoNo" : snsPhotoNo
				},
				type: "Get",
				success : function(data) {
					$("#sns-reply-header").append("(" + data.length + ")");
				},
				error : function(data) {
					alert("AJAX 처리 실패, 관리자 문의 요망");
				}
			});
		}
		
		
		//댓글 삭제
		function removeComment(obj) {
			const snsCommentNo = $(obj).prev().val();
			
			$.ajax({
				url : "/comment/delete",
				data : {
					"snsCommentNo" : snsCommentNo
				},
				type: "Get",
				success : function(data) {
					if(data == 1) {
						alert("댓글이 삭제되었습니다.");
						document.location.reload();
					}
				},
				error : function(data) {
					alert("AJAX 처리 실패, 관리자 문의 요망");
				}
			});
		}
		
		
	
		//댓글 등록
			$("#reply-submit").on("click", function() {
		//			alert("test");
				const snsPhotoNo = "${snsDetail.snsPhotoNo }";
				const userNo = "${sessionScope.loginUser.userNo }";
				const snsComment = $("#reply-content").val();
				$.ajax({
					url:"/comment/register",
					data: {
						"snsPhotoNo" : snsPhotoNo, 
						"userNo" : userNo, 
						"snsComment" : snsComment, 
						},
					type: "post",
					success : function(result) {
						if(result == '1') {
							alert("댓글이 등록되었습니다.");
							$("#reply-content").val("");
							document.location.reload();
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
			
			
			
		
		//sns 글 삭제
		function removeCheck(snsPhotoNo) {
				if(confirm("정말 삭제하시겠습니까?")) {
					location.href="/sns/snsDelete?snsPhotoNo="+snsPhotoNo;
				}
			}
	
	
	</script>
	
</body>
</html>