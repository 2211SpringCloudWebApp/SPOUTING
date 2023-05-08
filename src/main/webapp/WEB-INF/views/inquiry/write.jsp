<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>문의사항 작성✍</title>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
					<!-- 썸머노트 보내줄값 -->
					<input type="hidden" name="id" value="${id}" id="id">
					<div id="selectArea">
						<span>카테고리</span>
						<select name="inquiriesCategory">
							<option value="N">일반문의</option>
							<option value="M">MD관련문의</option>
							<option value="P">결제취소문의</option>
						</select>
					</div>
					<!-- 예약취소인경우 나타날 결제내역div -->
					<div id="bookNo" style="display:none">
						<span>결제내역 </span>
						<select name="bookNo" id="bookingInfo">
							<option value="0">----------선택하기----------</option>
							<c:forEach items="${bList }" var="book">
								<option value="${book.bookNo }">[${book.centerName}|${book.facilityName}]<fmt:formatDate value="${book.startTime }" pattern="MM.dd HH시"/></option>
							</c:forEach>	
						</select>
						<input type="hidden" id="bookingInfoToSave" name="inquiriesContent" value="">
					</div>
					<!-- 여기까지 -->

					<div id="titleArea">
						<span>제목</span>
						<input placeholder="제목을 입력해주세요." name="inquiriesTitle" required="required">
					</div>
					<div id="contentArea">
						<span>내용</span>
						<textarea rows="" cols="" id="summernote" name="inquiriesContent" required="required"></textarea>
					</div>
<!-- 					<div id="test"> -->
<!-- 						<span>파일첨부</span> -->
<!-- 						<input type="file" name="uploadFile"> -->
<!-- 					</div> -->
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

		// 주혜한테 받은 코드
		// const fontList = ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'MapoFlowerIsland', '맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'];
        // $('#summernote').summernote({
        //    placeholder: '내용을 작성하세요',
        //    height: 500,
        //     maxHeight: 400,
        //  lang: "ko-KR",
        //  toolbar: [
        //         ['fontname', ['fontname']],
        //         ['fontsize', ['fontsize']],
        //         ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
        //         ['color', ['forecolor','color']],
        //         ['table', ['table']],
        //         ['para', ['ul', 'ol', 'paragraph']],
        //         ['height', ['height']],
        //         ['insert',['picture']],
        //         ['view', ['fullscreen', 'help']]
        //      ],
        //      fontNames: fontList,
        //      fontNamesIgnoreCheck: fontList,
        //      fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
        //      callbacks : {
        //            onImageUpload : function(files, editor, welEditable) {
        //                for (let i = files.length - 1; i >= 0; i--) {
        //                    uploadSummernoteImageFile(files[i],
        //                        this);
        //                }
        //            }
        //        }
        //   });
        
        // function uploadSummernoteImageFile(file, el) {
        //     let data = new FormData();
        //     let id = document.getElementById("id").value;
        //     data.append("file", file);
        //     data.append("id", id);
        //     $.ajax({
        //         data : data,
        //         type : "POST",
        //         url : "/review/ImgFileUpload",
        //         contentType : false,
        //         enctype : 'multipart/form-data',
        //         processData : false,
        //         success : function(data) {
        //             $img = $('<img>').attr({ src: data.src });
        //             $(el).summernote('insertNode', $img[0]);
        //         }
        //     });
        // }
		// 여기까지
			
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

		// 비밀번호 유효성검사
		$("#saveBtn").click(function(){
			var secretNo = $("input[name='secretNo']").val();
			var regex = /^[0-9]{4}$/; // 비밀번호는 숫자 4자리로만 입력되어야 함
			if($("#secretNo").is(":visible") && !regex.test(secretNo)){
				alert("비밀번호는 숫자 4자리로 입력해주세요.");
				return false;
			}
		});
		
		///////////////////////////////
		//취소문의했을때 예약내역 선택 보이기
		const categorySelect = document.querySelector('select[name="inquiriesCategory"]');
		const bookSelect = document.getElementById("bookNo");
		
		categorySelect.addEventListener("change", function () {
		  if (categorySelect.value === "P") {
		    bookSelect.style.display = "flex";
		  } else {
		    bookSelect.style.display = "none";
		  }
		});
		
		//예약내역 내용란에 자동 합저장 할것	
		document.querySelector("#bookingInfo").addEventListener("change", function(){
			const bookingInfoSelect = document.querySelector("#bookingInfo");
			const bookingInfoText = bookingInfoSelect.options[bookingInfoSelect.selectedIndex].innerHTML;
			let bookNo = bookingInfoSelect.value;
			document.querySelector("#bookingInfoToSave").value="예약취소요청:" + bookingInfoText ;
			console.log(bookingInfoText)
			console.log(bookNo);
		});
		
		
		
		//////////////////////////////
		

	
	    </script>		
	</body>
</html>