<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 수정</title>
<!-- 		썸머노트API -->
		<!-- include libraries(jQuery, bootstrap) -->
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		
		<!-- include summernote css/js -->
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
		
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
			
		<div id="container">
				<h1>공지사항 작성</h1>
			<form action="/notice/write" method="post" enctype="multipart/form-data">
				<div id="titleArea">
					<input name="noticeTitle" value="${notice.noticeTitle }">
				</div>
				<div id="contentArea">
					<textarea rows="" cols="" id="summernote" name="noticeContent" value="${notice.noticeContent }"></textarea>
				</div>
				<div id="test">
					<input type="file" name="uploadFile">
				</div>
				<div id="buttonArea">
					<button id="saveBtn">저장</button>
				</div>
			</form>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	  <script>
	  	console.log(${sessionScope.loginUser.userNo})
		
		// callbacks오류
		var callbacks = null;
		 $(document).ready(function() {
			  $('#summernote').summernote({
			         placeholder: '공지사항을 작성하세요.',
			         tabsize: 2,
			         height: 500,
			         maxHeight: 500,
			         lang : 'ko-KR',
			         // 이미지 업로드
// 		        	   callbacks: {
// 		        	     onImageLinkInsert: function(url) {
// 		        	       // url is the image url from the dialog
// 		        	       $img = $('<img>').attr({ src: url })
// 		        	       $summernote.summernote('insertNode', $img[0]);
// 		        	     }
// 		        	   }
			  
			  });
		});

	    </script>		
	</body>
</html>