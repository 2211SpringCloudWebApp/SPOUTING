<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>지점정보 수정</title>
		<link rel="stylesheet" href="../../../resources/css/centerCss/modify.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	</head>
	<body>
		<!-- header -->
		<jsp:include page="../admin/adminHeader.jsp"></jsp:include>
		
		<form action="/center/modify" method="post" enctype="multipart/form-data">
			<main class="main">
				<div class="centerTbl">
					<div class="centerTbl_header">
						<h1><p>&#128736;</p><br>SPOUTING</h1>
						<h3>지점정보 수정</h3>
					</div>
					<input type="hidden" name="centerNo" value="${center.centerNo }">
					<input type="hidden" name="centerFilepath1" value="${center.centerFilepath1 }">
					<input type="hidden" name="centerFilepath2" value="${center.centerFilepath2 }">
					<table>
						<tr>
							<th>센터명 * </th>
							<td><input type="text" name="centerName" class="inputTag" id="centerName" value="${center.centerName }"></td>
						</tr>
						<tr>
							<th>지번주소 * </th>
							<td><input type="text" name="centerAddr" class="inputTag" id="centerAddr" value="${center.centerAddr }"></td>
						</tr>
						<tr>
							<th>도로명주소 * </th>
							<td><input type="text" name="centerSnaddr" class="inputTag" id="centerSnaddr" value="${center.centerSnaddr }"></td>
						</tr>
						<tr>
							<th>위도/경도 *</th>
							<td>
								<input type="text" name="centerLat" class="latlngTag" id="centerLat" value="${center.centerLat }">
								<input type="text" name="centerLng" class="latlngTag" id="centerLng" value="${center.centerLng }">
							</td>
						</tr>
						<tr>
							<th>전화번호 * </th>
							<td><input type="text" name="centerTel" class="inputTag" id="centerTel" value="${center.centerTel }"></td>
						</tr>
						<tr>
							<th>센터사진</th>
							<td><input type="file" name="reloadFile1" class="centerImg">${center.centerFilename1 }</td>
							<td><input type="file" name="reloadFile2" class="centerImg">&nbsp;&nbsp; ${center.centerFilename2 }</td>
						</tr>
					</table>
				</div>
				
				<input type="submit" class="button" value="수정완료" onclick="return checkModify(event)">
				<input type="reset" class="button" value="취소">
				<div class="link">
					<a href="/center/listView" style="background-color: white; border-radius: 3px; font-size: 12px; font-weight: 600; padding: 10px;">목록으로</a>
				</div>
			</main>
		</form>
		
		
		
		<script>
		/* 수정완료 버튼 클릭 시 */
			var checkModify = () => {
				const centerName = $("#centerName").val();
				const centerAddr = $("#centerAddr").val();
				const centerSnaddr = $("#centerSnaddr").val();
				const centerLat = $("#centerLat").val();
				const centerLng = $("#centerLng").val();
				const centerTel = $("#centerTel").val();
				
				/* 센터명 공백 확인 */
				if(centerName == "") {
					alert("센터명을 입력해주세요");
					$("#centerName").focus();
	                return false;
				}
				/* 지번주소 공백 확인 */
				if(centerAddr == "") {
					alert("지번주소를 입력해주세요");
					$("#centerAddr").focus();
	                return false;
				}
				/* 도로명주소 공백 확인 */
				if(centerSnaddr == "") {
					alert("도로명주소를 입력해주세요");
					$("#centerSnaddr").focus();
	                return false;
				}
				/* 위도 공백 확인 */
				if(centerLat == "") {
					alert("지점의 위도를 입력해주세요");
					$("#centerLat").focus();
	                return false;
				}
				/* 경도 공백 확인 */
				if(centerLng == "") {
					alert("지점의 경도를 입력해주세요");
					$("#centerLng").focus();
	                return false;
				}
				/* 전화번호 공백 확인 */
				if(centerTel == "") {
					alert("지점의 전화번호를 입력해주세요");
					$("#centerTel").focus();
	                return false;
				}
				
				alert("📌 수정이 완료되었습니다!");
				
			}
			
		</script>
		
		
		
		<!-- footer -->
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>