<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>sns ���� ���ε�</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
		<form action="/sns/upload" method="post" enctype="multipart/form-data" style="width:1000px; margin:0 auto;">
			<table>
				<tr>
					<th>÷������</th>
					<td><input type="file" name="uploadFile" onchange="loadImg(this);"></td>
				</tr>
				<tr>
					<th>�̹��� ����</th>
					<td>
						<div id="img-viewer">
							<img id="img-view" width="350">
						</div>
					</td>
				</tr>
				<tr>
					<th>����</th>
					<td><textarea rows="3" name="snsContent" style="width:100%;"></textarea></td>
				</tr>
				<tr>
					<th style="text-align:center;" colspan="2">
						<button type="submit">����ϱ�</button>
					</th>
				</tr>
		</table>
	</form>
	
			<script>
			function loadImg(obj) {
				if(obj.files.length != 0 && obj.files[0] != 0) {
					let reader = new FileReader();
					reader.readAsDataURL(obj.files[0]);
					reader.onload = function(e) {
						document.querySelector("#img-view").setAttribute("src", e.target.result);
					}
				}else{
// 					$("#img-view").attr("src", "");
					document.querySelector("#img-view").setAttribute("src", "");
				}
			}
		</script>
</body>
</html>