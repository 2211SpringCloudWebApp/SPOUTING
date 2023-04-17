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
		
<!-- 		css링크 -->
		<link href="../../../resources/css/noticeCss/write.css" rel="stylesheet">
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
			
		<div class="main">
				<h1>공지사항 작성</h1>
			<form action="/notice/write" method="post" enctype="multipart/form-data">
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
// 	  	console.log(${sessionScope.loginUser.userNo})
		console.log(${userNo})
		// 1. 썸머노트설정
// 		var setting = {
// 	            height : 300,
// 	            minHeight : null,
// 	            maxHeight : null,
// 	            focus : true,
// 	            lang : 'ko-KR',
// 	            //콜백 함수
// // 	            callbacks : { 
// // 	            	onImageUpload : function(files, editor, welEditable) {
// // 	            // 파일 업로드(다중업로드를 위해 반복문 사용)
// // 	            for (var i = files.length - 1; i >= 0; i--) {
// // 	            uploadSummernoteImageFile(files[i], this);
// // 	            		}
// // 	            	}
// // 	            }
// 	         };
// 		// 썸머노트 보여주기
// 		$(document).ready(function(){
// 	        $('#summernote').summernote(setting);
// 		});
	  	
		
// 		function uploadSummernoteImageFile(file, el){
// 			data = new FormData();
// 			data.append("file", file);
// 			$.ajax({
// 				url : "/notice/write",
// 				data : data,
// 				type : "post",
// 				success : function(data){
// 					console.log(data);
// 					$(el).summernote('editor.insertImage', data.url);
// 				},
// 				error : function(){
					
// 				}
// 			})
// 		}
		
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
		
			// 저장안됨
// 			$(document).ready(function() {
// 			    $('#summernote').summernote({
// 			        height: 300, // 에디터 높이
// 			        minHeight: null, // 최소 높이
// 			        maxHeight: null, // 최대 높이
// 			        focus: true, // 페이지가 열릴 때 포커스 여부
// 			        lang: 'ko-KR', // 한글 설정
// 			        placeholder: '내용을 입력해주세요.', //placeholder 설정
// 			        toolbar: [
// 			            // 에디터에 표시할 기능들
// 			            ['style', ['style']],
// 			            ['font', ['bold', 'underline', 'clear']],
// 			            ['color', ['color']],
// 			            ['para', ['ul', 'ol', 'paragraph']],
// 			            ['table', ['table']],
// 			            ['insert', ['link', 'picture', 'video']],
// 			            ['view', ['fullscreen', 'codeview', 'help']]
// 			        ],
// // 			        callbacks: {
// // 			            onImageUpload: function(files, editor, welEditable) {
// // 			                // 이미지 업로드 관련 처리
// // 			            }
// // 			        }
// 			    });
// 			});
	
	    </script>		
	</body>
</html>