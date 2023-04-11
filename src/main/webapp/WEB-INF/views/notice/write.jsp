<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 작성</title>
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
			<form action="/notice/write" method="post">
				<div id="titleArea">
					<input placeholder="제목을 입력해주세요." name="noticeTitle">
				</div>
				<div id="contentArea">
					<textarea rows="" cols="" id="summernote" name="noticeContent"></textarea>
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
		 $(document).ready(function() {
			  $('#summernote').summernote({
			         placeholder: '공지사항을 작성하세요.',
			         tabsize: 2,
			         height: 500,
			         maxHeight: 500,
			         lang : 'ko-KR'
			         // 이미지 업로드
		     		 callbacks: {
		    			 onImageUpload : function(files){
		    				sendFile(files[0],this);
		    			 }
		    		 }
			  });
		});
			
		
// 		  지우지말기
// 		 $(document).ready(function(){
			 
// 			 	//썸머노트에 값넣기
// 			   $('#summernote').summernote('code', '<p>가나다</p><p>마바사</p><p>아자차카타파하</p>');
			 
// 			    //위와 같이 값을 먼저 넣어준 후 초기화를 시킨다. 그럼 아래와 같이 입력이 된다.
// 			    //초기화
// 				$('#summernote').summernote({
// 					height : 400, // set editor height
// 					minHeight : null, // set minimum height of editor
// 					maxHeight : null, // set maximum height of editor
// 					focus : true,
// 					lang : 'ko-KR' // 기본 메뉴언어 US->KR로 변경
// 				});
			 
				
		
// 		    //저장버튼 클릭
// 		    $(document).on('click', '#saveBtn', function () {
// 		        saveContent();
		      
// 		    });
// 		 });
		
// 		    //데이터 저장
// 		    function saveContent() {
		    	
// 		        //값 가져오기
// 		        var summernoteContent = $('#summernote').summernote('code');        //썸머노트(설명)
// 		        console.log("summernoteContent : " + summernoteContent);
				
// 		    }
		
	
	    </script>		
	</body>
</html>