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
			<main>
				<div class="centerTbl">
					<table>
						<tr>
							<th>센터명*</th>
							<td><input type="text" name="centerName" class="inputTag" placeholder="NEW 스파우팅 지점명 입력"></td>
						</tr>
						<tr>
							<th>주소*</th>
							<td><input type="text" name="centerAddr" class="inputTag" placeholder="NEW 스파우팅 주소 입력"></td>
						</tr>
						<tr>
							<th>전화번호*</th>
							<td><input type="text" name="centerTel" class="inputTag" placeholder="NEW 스파우팅 전화번호 입력"></td>
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
								
<!-- 								<input type="file" name="uploadFile1" class="selectFile" onchange="loadImg1(this);"> -->
<!-- 								<div id="img-viewer1"> -->
<!-- 									<img id="img-view1" width="200"> -->
<!-- 								</div> -->
<!-- 								<input type="file" name="uploadFile2" class="selectFile" onchange="loadImg2(this);"> -->
<!-- 								<div id="img-viewer2"> -->
<!-- 									<img id="img-view2" width="200"> -->
<!-- 								</div> -->
							</td>
						</tr>
					</table>
				</div>
				
				
				<input type="submit" value="등록하기">
				<input type="reset" value="취소">
			</main>
		</form>
		
		
		<script>
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