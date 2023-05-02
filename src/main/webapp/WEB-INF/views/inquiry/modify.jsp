<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>문의사항 수정✍</title>
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

		<!-- 비밀번호 눈 아이콘 -->
		<!-- <link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"> -->
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		
		<div class="main">
	    	<div class="mainHeaderI">
		    	<div class="titleWrap">
					<p>문의사항 수정✍</p>
					<p>궁금한 사항을 문의해주세요!</p>
		    	</div>
	    	</div>
	    	<div class="mainCenter">
				<form action="/inquiry/modify" method="post" enctype="multipart/form-data">
					<!-- 썸머노트 보내줄값 -->
					<input type="hidden" name="id" value="${id}" id="id">
					<input type="hidden" name="inquiriesNo" value="${inquiry.inquiriesNo }">
					<input type="hidden" name="inquiriesFilename" value="${inquiry.inquiriesFilename }">
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
						<input name="inquiriesTitle" value=${inquiry.inquiriesTitle }>
					</div>
					<div id="contentArea">
						<span>내용</span>
						<textarea rows="" cols="" id="summernote" name="inquiriesContent">
							${inquiry.inquiriesContent }
						</textarea>
					</div>
<!-- 					첨부파일여부에따라다르게 -->
					<!-- <div id="test">
						<input type="file" name="reloadFile">
						<c:if test="${! empty inquiry.inquiriesFilerename }">
							<div class="filename">${inquiry.inquiriesFilename }</div>
						</c:if>
						<c:if test="${empty inquiry.inquiriesFilerename }">
							<div class="filename">첨부된 파일이 없습니다.</div>
						</c:if>
					</div> -->
					<div id="secretArea">
						<input type="radio" name="inquiriesSecret" value="N" checked="checked" />일반글 <input type="radio" name="inquiriesSecret" value="Y" />비밀글
						<div id="secretNo" style="display:none;">
							<span>비밀번호 </span>
<!-- 							<input name="secretNo" placeholder="4자리 숫자"> -->
						</div>
					</div>
					<div id="buttonArea">
						<button id="saveBtn" class="btn btn-primary">저장</button>
					</div>
				</form>
			</div>
		</div>
		
		
		<jsp:include page="../common/footer.jsp"></jsp:include>
	  <script>
		console.log(${userNo})
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
                url : "/inquiry/ImgFileUpload",
                contentType : false,
                enctype : 'multipart/form-data',
                processData : false,
                success : function(data) {
                    $img = $('<img>').attr({ src: data.src });
                    $(el).summernote('insertNode', $img[0]);
                }
            });
        }
			
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
						// input태그가 이미 생성되어 있는지 체크
						if ($("#secretNo").find("input[name='secretNo']").length === 0) {
							// input태그가 생성되어 있지 않은 경우에만 생성
							$("#secretNo").children().append("<input type='password' name='secretNo' placeholder='4자리 숫자' value='${inquiry.secretNo}' id='SECRET'><button type='button' id='checkBtn'><img src='../../../resources/images/notice/secretEye.png' width='30px'></button>");
							// 비밀번호 보였다 안보이게 처리
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
						}
						$("#secretNo").show();
					}
				});
			});

	
	    </script>		
	</body>
</html>