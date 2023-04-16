<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>지점정보 수정</title>
	</head>
	<body>
		<!-- header -->
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<form action="/center/modify" method="post" enctype="multipart/form-data">
			<input type="hidden" name="centerNo" value="${center.centerNo }">
			<input type="hidden" name="uploadFilePath1" value="${center.centerFilepath1 }">
			<input type="hidden" name="uploadFilePath2" value="${center.centerFilepath2 }">
			<table>
				<tr>
					<th>센터명 * </th>
					<td><input type="text" name="centerName" value="${center.centerName }"></td>
				</tr>
				<tr>
					<th>주소 * </th>
					<td><input type="text" name="centerAddr" value="${center.centerAddr }"></td>
				</tr>
				<tr>
					<th>전화번호 * </th>
					<td><input type="text" name="centerTel" value="${center.centerTel }"></td>
				</tr>
				<tr>
					<th>센터사진</th>
					<td><input type="file" name="uploadFile1">${center.centerFilename1 }</td>
					<td><input type="file" name="uploadFile2">&nbsp;&nbsp; ${center.centerFilename2 }</td>
				</tr>
			</table>
<%-- 			<input type="hidden" name="centerNo" value="${center.centerNo }"> --%>
<%-- 			센터명 : <input type="text" name="centerName" value="${center.centerName }"><br> --%>
<%-- 			주소 : <input type="text" name="centerAddr" value="${center.centerAddr }"><br> --%>
<%-- 			전화번호 : <input type="text" name="centerTel" value="${center.centerTel }"><br> --%>
<%-- 			센터사진 : <input type="file" name="uploadFile">&nbsp;&nbsp; ${center.centerFilename1 }<br> --%>
<%-- 			<input type="hidden" name="uploadFilePath" value="${center.centerFilepath1 }"> --%>
<%-- 			센터사진2 : <input type="file" name="uploadFile2">&nbsp;&nbsp; ${center.centerFilename2 }<br> --%>
<%-- 			<input type="hidden" name="uploadFilePath2" value="${center.centerFilePath2 }">  --%>
			
			<input type="submit" value="수정완료">
			<input type="reset" value="취소">
		</form>
		
		
		
		<!-- footer -->
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>