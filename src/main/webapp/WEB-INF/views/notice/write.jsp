<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 작성✍</title>
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
		<jsp:include page="../admin/adminHeader.jsp"></jsp:include>
		
		
		<div class="main">
	    	<div class="mainHeader">
		    	<div class="titleWrap">
					<p>공지사항 작성✍</p>
					<p>스파우팅의 새로운 소식을 작성해주세요!</p>
		    	</div>
	    	</div>
	    	<div class="mainCenter">
				<form action="/notice/write" method="post" enctype="multipart/form-data">
					<!-- 썸머노트 보내줄값 -->
					<input type="hidden" name="id" value="${id}" id="id">
					<div id="titleArea">
						<span>제목</span>
						<input placeholder="제목을 입력해주세요." name="noticeTitle" required="required">
					</div>
					<div id="contentArea">
						<span>내용</span>
						<textarea rows="" cols="" id="summernote" name="noticeContent" required="required"></textarea>
					</div>
					<!-- <div id="test">
						<span>파일첨부</span>
						<input type="file" name="uploadFile">
					</div> -->
					<div id="buttonArea">
						<button id="saveBtn" class="btn btn-primary">저장</button>
					</div>
				</form>
			</div>
		</div>
		
		
		<jsp:include page="../common/footer.jsp"></jsp:include>
	  <script>
// 	  	console.log(${sessionScope.loginUser.userNo})
		console.log(${userNo})
		// 썸머노트
		$(document).ready(function() {
			$('#summernote').summernote({
			    placeholder: '내용을 입력해주세요.',
			    tabsize: 2,
			    height: 500,
			    maxHeight: 500,
			    lang : 'ko-KR',
			    // 이미지 업로드 콜백함수
		        callbacks: {
		        	onImageUpload : function(files, editor, welEditable) {
						for (let i = files.length - 1; i >= 0; i--) {
                           	uploadSummernoteImageFile(files[i],
                            	this);
                        }
		        	}
		        }
			  
			});
		});

		function uploadSummernoteImageFile(file, el) {
            let data = new FormData();
            let id = document.getElementById("id").value;
            data.append("file", file);
            data.append("id", id);
            $.ajax({
                data : data,
                type : "POST",
                url : "/notice/ImgFileUpload",
                contentType : false,
                enctype : 'multipart/form-data',
                processData : false,
                success : function(data) {
                    $img = $('<img>').attr({ src: data.src });
                    $(el).summernote('insertNode', $img[0]);
                }
            });
        }
		
		
	
	    </script>		
	</body>
</html>