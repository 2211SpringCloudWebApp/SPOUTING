<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
		
<!-- 		css링크 -->
		<link href="../../../resources/css/noticeCss/write.css" rel="stylesheet">
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
			
		<div class="main">
			<h1>공지사항 수정</h1>
			<form action="/notice/modify" method="post" enctype="multipart/form-data">
				<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
				<div id="titleArea">
					<input name="noticeTitle" value="${notice.noticeTitle }">
				</div>
				<div id="contentArea">
					<textarea rows="" cols="" id="summernote" name="noticeContent" >
						${notice.noticeContent}
					</textarea>
				</div>
				<div id="test">
					<input type="file" name="reloadFile">
					<c:if test="${! empty notice.noticeFilerename }">
						<div class="filename">${notice.noticeFilerename }</div>
					</c:if>
					<c:if test="${empty notice.noticeFilerename }">
						<div class="filename">첨부된 파일이 없습니다.</div>
					</c:if>
				</div>
				<div id="buttonArea">
					<button id="saveBtn">저장</button>
				</div>
			</form>
		</div>
		
		<jsp:include page="../common/footer.jsp"></jsp:include>
	  <script>
		// textarea로 인식되는 오류고침		
// 		$('#summernote').summernote('code', '');
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
		 
		 // 수정할때 값 불러오기
// 		 var setting = {
// 	          height : 242,
// 	          minHeight : null,
// 	          maxHeight : null,
// 	          focus : true,
// 	          lang : 'ko-KR',
// 	          toolbar : toolbar,
// 	          fontSizes : fontSizes,
// 	          fontNames : fontNames,
// 	          callbacks : { //여기 부분이 이미지를 첨부하는 부분
// 	              onImageUpload : function(files, editor,	welEditable) 
// 	              {
// 	                  for (var i = files.length - 1; i >= 0; i--) 
// 	                  {
// 	                      uploadSummernoteImageFile(files[i],
// 	                      this);
// 	                  }
// 	              },
// 	              onMediaDelete : function(target) 
// 	                {
// 	                    console.log(target[0]);
// 	                    deleteFile(target[0].src);
// 	                }
// 	              } 
// 		 };

		 

	    </script>		
	</body>
</html>