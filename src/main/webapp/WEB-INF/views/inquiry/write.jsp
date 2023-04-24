<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>문의사항 작성✍</title>
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
	    	<div class="mainHeaderI">
		    	<div class="titleWrap">
					<p>문의사항 작성✍</p>
					<p>궁금한 사항을 문의해주세요!</p>
		    	</div>
	    	</div>
	    	<div class="mainCenter">
				<form action="/inquiry/write" method="post" enctype="multipart/form-data">
					<div id="selectArea">
						<span>카테고리</span>
						<select name="inquiriesCategory">
							<option value="N">일반문의</option>
							<option value="M">MD관련문의</option>
							<option value="P">결제취소문의</option>
						</select>
					</div>
					<div id="titleArea">
						<span>제목</span>
						<input placeholder="제목을 입력해주세요." name="inquiriesTitle">
					</div>
					<div id="contentArea">
						<span>내용</span>
						<textarea rows="" cols="" id="summernote" name="inquiriesContent"></textarea>
					</div>
					<div id="test">
						<span>파일첨부</span>
						<input type="file" name="uploadFile">
					</div>
					<div id="secretArea">
						<input type="radio" name="inquiriesSecret" value="N" checked="checked" />일반글<input type="radio" name="inquiriesSecret" value="Y" />비밀글
						<div id="secretNo" style="display:none;">
							<span>비밀번호</span>
<!-- 							<input name="secretNo" placeholder="4자리 숫자"> -->
						</div>
					</div>
					<div id="buttonArea">
						<button id="saveBtn">저장</button>
					</div>
				</form>
			</div>
		</div>
		
		
		<jsp:include page="../common/footer.jsp"></jsp:include>
	  <script>
		console.log(${userNo})
		// 썸머노트
		// callbacks오류
		var callbacks = null;
		 $(document).ready(function() {
			  $('#summernote').summernote({
			         placeholder: '내용을 입력해주세요.',
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
			
		// 비밀글 체크 시 비밀번호 입력할 수 있게 해주는 함수
		

			$(document).ready(function(){
			$("#secretNo").hide();  // 초기값 설정
			
			$("input[name='inquiriesSecret']").change(function(){
				// 일반글 선택 시
				if($("input[name='inquiriesSecret']:checked").val() === 'N'){
					$("#secretNo").hide();
				}
				// 비밀글 선택 시
				else if($("input[name='inquiriesSecret']:checked").val() === 'Y'){
					var postNo = $(this).
					// input태그가 이미 생성되어 있는지 체크
					if ($("#secretNo").find("input[name='secretNo']").length === 0) {
						// input태그가 생성되어 있지 않은 경우에만 생성
						$("#secretNo").children().append("<input name='secretNo' placeholder='4자리 숫자'>");
					}
					$("#secretNo").show();
				}
			});
			});


	
	    </script>		
	</body>
</html>