<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>지점 등록</title>
		<link rel="stylesheet" href="../../../resources/css/centerCss/register.css">
	</head>
	<body>
		<!-- header -->
		<jsp:include page="../admin/adminHeader.jsp"></jsp:include>
		
		<form action="/center/register" method="post" enctype="multipart/form-data">
			<main class="main">
				<div class="centerTbl">
					<div class="centerTbl_header">
						<h1>NEW SPOUTING</h1>
						<h3>스파우팅 지점 등록</h3>
					</div>
					<table>
						<tr>
							<th>센터명 *</th>
							<td><input type="text" name="centerName" class="inputTag" id="centerName" placeholder="NEW 스파우팅 지점명 입력"></td>
						</tr>
						<tr>
							<th>지번주소 *</th>
							<td><input type="text" name="centerAddr" class="inputTag" id="centerAddr" placeholder="NEW 스파우팅 지번 주소 입력"></td>
						</tr>
						<tr>
							<th>도로명주소 *</th>
							<td><input type="text" name="centerSnaddr" class="inputTag" id="centerSnaddr" placeholder="NEW 스파우팅 도로명 주소 입력"></td>
						</tr>
						<tr>
							<th>위도/경도 *</th>
							<td>
								<input type="text" name="centerLat" class="latlngTag" id="centerLat" placeholder="위도 입력">
								<input type="text" name="centerLng" class="latlngTag" id="centerLng" placeholder="경도 입력">
							</td>
						</tr>
						<tr>
							<th>전화번호 *</th>
							<td><input type="text" name="centerTel" class="inputTag" id="centerTel" placeholder="NEW 스파우팅 전화번호 입력"></td>
						</tr>
						<tr class="div">
						</tr>
						<tr>
							<th>사진등록</th>
							<td>
								<div class="file-input">
									<input type="file" name="uploadFile1" id="inputFile1" class="selectFile" onchange="loadImg1(this);"/>
									<label class="selectFile_label" for="inputFile1">
										<svg
										  aria-hidden="true"
										  focusable="false"
										  data-prefix="fas"
										  data-icon="upload"
										  role="img"
										  xmlns="http://www.w3.org/2000/svg"
										  viewBox="0 0 512 512"
										>
											<path
											  fill="currentColor"
											  d="M296 384h-80c-13.3 0-24-10.7-24-24V192h-87.7c-17.8 0-26.7-21.5-14.1-34.1L242.3 5.7c7.5-7.5 19.8-7.5 27.3 0l152.2 152.2c12.6 12.6 3.7 34.1-14.1 34.1H320v168c0 13.3-10.7 24-24 24zm216-8v112c0 13.3-10.7 24-24 24H24c-13.3 0-24-10.7-24-24V376c0-13.3 10.7-24 24-24h136v8c0 30.9 25.1 56 56 56h80c30.9 0 56-25.1 56-56v-8h136c13.3 0 24 10.7 24 24zm-124 88c0-11-9-20-20-20s-20 9-20 20 9 20 20 20 20-9 20-20zm64 0c0-11-9-20-20-20s-20 9-20 20 9 20 20 20 20-9 20-20z"
											></path>
								  		</svg>
										<span>Upload file</span>
									</label>
								</div>
								<div id="img-viewer1">
									<img id="img-view1" width="200">
								</div>
								  
								  
								<div class="file-input">
									<input type="file" name="uploadFile2" id="inputFile2" class="selectFile" onchange="loadImg2(this);"/>
									<label class="selectFile_label" for="inputFile2">
										<svg
										  aria-hidden="true"
										  focusable="false"
										  data-prefix="fas"
										  data-icon="upload"
										  role="img"
										  xmlns="http://www.w3.org/2000/svg"
										  viewBox="0 0 512 512"
										>
											<path
											  fill="currentColor"
											  d="M296 384h-80c-13.3 0-24-10.7-24-24V192h-87.7c-17.8 0-26.7-21.5-14.1-34.1L242.3 5.7c7.5-7.5 19.8-7.5 27.3 0l152.2 152.2c12.6 12.6 3.7 34.1-14.1 34.1H320v168c0 13.3-10.7 24-24 24zm216-8v112c0 13.3-10.7 24-24 24H24c-13.3 0-24-10.7-24-24V376c0-13.3 10.7-24 24-24h136v8c0 30.9 25.1 56 56 56h80c30.9 0 56-25.1 56-56v-8h136c13.3 0 24 10.7 24 24zm-124 88c0-11-9-20-20-20s-20 9-20 20 9 20 20 20 20-9 20-20zm64 0c0-11-9-20-20-20s-20 9-20 20 9 20 20 20 20-9 20-20z"
											></path>
										</svg>
										<span>Upload file</span>
									</label>
								</div>
								<div id="img-viewer2">
									<img id="img-view2" width="200">
								</div>
								
							</td>
						</tr>
					</table>
				</div>
				
				
				<input type="submit" class="button" value="등록하기" onclick="return checkRegister(event)">
				<input type="reset" class="button" value="취소">
			</main>
		</form>
		
		
		<script>
			var checkRegister = () => {
				const centerName = $("#centerName").val();
				const centerAddr = $("#centerAddr").val();
				const centerSnaddr = $("#centerSnaddr").val();
				const centerLat = $("#centerLat").val();
				const centerLng = $("#centerLng").val();
				const centerTel = $("#centerTel").val();
				const uploadFile1 = $("#inputFile1").val();
				const uploadFile2 = $("#inputFile2").val();
				
				if(centerName == "") {
					alert("센터명을 입력해주세요");
					$("#centerName").focus();
	                return false;
				}
				if(centerAddr == "") {
					alert("지번주소를 입력해주세요");
					$("#centerAddr").focus();
	                return false;
				}
				if(centerSnaddr == "") {
					alert("도로명주소를 입력해주세요");
					$("#centerSnaddr").focus();
	                return false;
				}
				if(centerLat == "") {
					alert("지점의 위도를 입력해주세요");
					$("#centerLat").focus();
	                return false;
				}
				if(centerLng == "") {
					alert("지점의 경도를 입력해주세요");
					$("#centerLng").focus();
	                return false;
				}
				if(centerTel == "") {
					alert("지점의 전화번호를 입력해주세요");
					$("#centerTel").focus();
	                return false;
				}
				
				alert("지점 등록이 완료되었습니다.")
				
			}
// 			var ckeckRegister = () => {
// // 				const centerName = $("#centerName").val();
// // 				$.ajax({
// // 					if(centerName == "") {
// // 						alert("센터명을 입력해주세요");
// // 					}
// // 				})
// 				alert("센터명을 입력해주세요");
// 			}
				
				
				// 세션 스토리지에 입력된 값들 저장
// 				sessionStorage.setItem("centerName", centerName);
// 				sessionStorage.setItem("centerAddr", centerAddr);
// 				sessionStorage.setItem("centerSnaddr", centerSnaddr);
// 				sessionStorage.setItem("centerLat", centerLat);
// 				sessionStorage.setItem("centerLng", centerLng);
// 				sessionStorage.setItem("centerTel", centerTel);
// 				sessionStorage.setItem("uploadFile1", uploadFile1);
// 				sessionStorage.setItem("uploadFile2", uploadFile2);
				
				
				
			
// 				if(uploadFile1 == "") {
// 					alert("사진을 업로드하세요");
// 				}
// 				if(uploadFile2 == "") {
// 					alert("모든 정보를 입력하세요");
// 				}
			
			
// 			$(document).ready(function () {
// 			  // 페이지가 로드될 때 세션 스토리지에 저장된 값들 가져와서 입력 폼에 설정
// 			  $("#centerName").val(sessionStorage.getItem("centerName"));
// 			  $("#centerAddr").val(sessionStorage.getItem("centerAddr"));
// 			  $("#centerSnaddr").val(sessionStorage.getItem("centerSnaddr"));
// 			  $("#centerLat").val(sessionStorage.getItem("centerLat"));
// 			  $("#centerLng").val(sessionStorage.getItem("centerLng"));
// 			  $("#centerTel").val(sessionStorage.getItem("centerTel"));
// 			  $("#inputFile1").val(sessionStorage.getItem("uploadFile1"));
// 			  $("#inputFile2").val(sessionStorage.getItem("uploadFile2"));
// 			});
		
		
			function loadImg1(obj) {
				if(obj.files.length != 0 && obj.files[0] != 0) {
					let reader = new FileReader();
					reader.readAsDataURL(obj.files[0]);
					reader.onload = function(e) {
						document.querySelector("#img-view1").setAttribute("src", e.target.result);
					}
				}else {
					document.querySelector("#img-view1").setAttribute("src", "");
				}
			}
			function loadImg2(obj) {
				if(obj.files.length != 0 && obj.files[0] != 0) {
					let reader = new FileReader();
					reader.readAsDataURL(obj.files[0]);
					reader.onload = function(e) {
						document.querySelector("#img-view2").setAttribute("src", e.target.result);
					}
				}else {
					document.querySelector("#img-view2").setAttribute("src", "");
				}
			}
		</script>
		
		<!-- footer -->
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>