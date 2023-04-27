<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호확인</title>
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
						<p>해당 글은 비밀글입니다. <span>입력하신 비밀번호를 입력해주세요!</span></p>
						<input type="hidden" name="inquiriesNo" value="${inquiry.inquiriesNo}">
						<input type="text" name="secretNo" placeholder="">
						<button type="submit">확인</button>
					</form>
				</div>
			</div>
		</div>
		
		<jsp:include page="../common/footer.jsp"></jsp:include>
		
		<script type="text/javascript">
			console.log(${inquiry.inquiriesNo});
			
	        function checkPw() {
	            var secretNo = $("input[type='hidden']").val();
	            var checkSecretNo = $("input[type='text']").val();
	            console.log(secretNo);
	            if(secretNo === checkSecretNo) {
	                location.href = "/inquiry/detail"
	            } else {
	                alert("비밀번호 오류!")
	            }
	        }
		</script>
	</body>
</html>