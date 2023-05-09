<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호확인</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<!-- 		부트스트랩링크 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
		
<!-- 		css링크 -->
	    <link href="../../../resources/css/noticeCss/list.css" rel="stylesheet">
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<div id="main">
	    	<!-- <div class="mainHeaderI">
		    	<div class="titleWrap">
					<p>문의사항</p>
					<p>궁금한 사항을 문의해주세요!</p>
		    	</div>
	    	</div> -->
	    	<div class="mainCenter">
	    		<div id="imageTag">
	    			<img alt="" src="../../../resources/images/notice/padlock.png" style="width:200px; height:200px;">
	    		</div>
	    		<div id="contentTag">
					<form action="/inquiry/checkSecretNo" method="post">
						<p>비밀글입니다.</p>
						<p>해당 글은 비밀글입니다. <span>등록하신 비밀번호를 입력해주세요!</span></p>
						<input type="hidden" name="inquiriesNo" value="${inquiry.inquiriesNo}">
						<input type="password" name="secretNo" placeholder="4자리 숫자" id="SECRET">
						<button type='button' id='checkBtn'><img src='../../../resources/images/notice/secretEye.png' width='30px'></button>
						<button type="submit" class="btn btn-secondary btn-sm">확인</button>
					</form>
				</div>
			</div>
		</div>
		
		<jsp:include page="../common/footer.jsp"></jsp:include>
		
		<script type="text/javascript">
			console.log(${inquiry.inquiriesNo});
			
// 	        function checkPw() {
// 	            var secretNo = $("input[type='hidden']").val();
// 	            var checkSecretNo = $("input[type='text']").val();
// 	            console.log(secretNo);
// 	            if(secretNo === checkSecretNo) {
// 	                location.href = "/inquiry/detail"
// 	            } else {
// 	                alert("비밀번호 오류!")
// 	            }
// 	        }
	        
	        // 비밀번호 보였다 안보이게
			$('#checkBtn').on('click', function() {
				var input = $('#SECRET');
				if (input.attr('type') === 'password') {
					input.attr('type', 'text');
					$(this).html('<img src="../../../resources/images/notice/noSecretEye.png" width="30px">');
				} else {
					input.attr('type', 'password');
					$(this).html('<img src="../../../resources/images/notice/secretEye.png" width="30px">');
				}
			});
		</script>
	</body>
</html>