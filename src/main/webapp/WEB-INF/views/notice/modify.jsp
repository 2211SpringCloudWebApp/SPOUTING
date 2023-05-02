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
			<div class="mainHeader">
		    	<div class="titleWrap">
					<p>공지사항 수정✍</p>
					<p>스파우팅의 새로운 소식을 작성해주세요!</p>
		    	</div>
	    	</div>
			<div class="mainCenter">
				<form action="/notice/modify" method="post" enctype="multipart/form-data">
					<!-- 썸머노트 보내줄값 -->
					<input type="hidden" name="id" value="${id}" id="id">
					<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
					<input type="hidden" name="noticeFilename" value="${notice.noticeFilename }">
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
							<div class="filename">${notice.noticeFilename }</div>
						</c:if>
						<c:if test="${empty notice.noticeFilerename }">
							<div class="filename">첨부된 파일이 없습니다.</div>
						</c:if>
					</div>
					<div id="buttonArea">
						<button id="saveBtn" class="btn btn-primary">저장</button>
					</div>
				</form>
			</div>
		</div>
		
		<jsp:include page="../common/footer.jsp"></jsp:include>
	  <script>
		// textarea로 인식되는 오류고침		
		// 썸머노트
		// callbacks오류
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