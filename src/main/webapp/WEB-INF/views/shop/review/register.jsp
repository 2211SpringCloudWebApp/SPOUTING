<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 후기 작성</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="../../../../resources/css/shopCss/table.css">
	<style>
		#inputGrade {	
			width : 100%;
			height : 100px;
			margin : auto;
			padding : 0;
			display : flex;
			align-items : center;
			justify-content: center;
		}
	</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<div id="maincontainer">
		<h1>🖍️ ️상품 후기 작성</h1>
		<br>
		<p>구매한 제품의 후기를 남겨보세요</p>
		<p>※ ${sessionScope.loginUser.userId }님 ! 상품 후기는 구매 건당 7일 이내 1회 작성 가능합니다.</p>
		<br>
		<p style="font-size : 15px; color : #ccc;">드래그하여 별점을 입력할 수 있습니다.</p>
		<form action="/review/register" method="post" enctype="multipart/form-data">
			<div id="inputGrade">
				<div id="inputStarGrade" style="font-weight:bold;font-size:30px;">
					<span class="inputStars" onclick="addGrade(1);" onmouseover="effectStar(1);" onmouseout="effectStarEnd()" style="color:#607EAA">★</span>
					<span class="inputStars" onclick="addGrade(2);" onmouseover="effectStar(2);" onmouseout="effectStarEnd()" style="color:#607EAA">★</span>
					<span class="inputStars" onclick="addGrade(3);" onmouseover="effectStar(3);" onmouseout="effectStarEnd()" style="color:#607EAA">★</span>
					<span class="inputStars" onclick="addGrade(4);" onmouseover="effectStar(4);" onmouseout="effectStarEnd()" style="color:#607EAA">★</span>
					<span class="inputStars" onclick="addGrade(5);" onmouseover="effectStar(5);" onmouseout="effectStarEnd()" style="color:#607EAA">★</span>
				</div>
			</div>
			<input type="hidden" name="productNo" 	id="productNo"	value="1">
			<input type="hidden" name="reviewGrade" id="gradeVal" value="5" readonly>
			<table>
				<tr>
					<td>작성자</td>
					<td><input type="text" id="userId" name="userId" value="${loginUser.userId }" readonly></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="reviewTitle"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="reviewContent"></textarea>
				</tr>
				<tr>
					<td>파일</td>
					<td class="filebox">
						<input class="upload-name" value="첨부파일" placeholder="첨부파일" readonly>
						<label for="file">파일찾기</label> 
						<input type="file" id="file" name="uploadFile1" onchange="loadImg1(this);">
						<div id="img-viewer1">
							<img id="img-view1" width="200">
						</div>
					</td>
				</tr>
			</table>
			<div id="buttonbox">
				<input class="btn" type="submit" value="등록하기">
				<input class="btn" type="reset" value="취소">
			</div>
		</form>
	</div>
	
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	
	
	<script> 
	//리뷰 별점 주기
	var inputStars = document.querySelector("#inputStarGrade");
	var inputGrade = document.querySelector("#inputGrade");
	var pointer = 1;
	function addGrade(number){
			console.log(pointer);
			//자식요소가 1,3,5,7,9
		if(number < pointer){
			for(var i=number+1; i<=5; i++){
				inputStars.childNodes[2*i-1].style.color="#c0c0c0";
			}
		}else{
			for(var i=1; i<=number;i++){
				inputStars.childNodes[2*i-1].style.color="bluw";
			}
		}
		pointer = number;
		document.querySelector("#gradeVal").value = pointer;
		console.log("밸류값" + document.querySelector("#gradeVal").value);
	}
	
	//리뷰 마우스오버 이펙트
	var overPointer=1;
	function effectStar(number){
		if(number>overPointer){
			for(var i=1; i<=number;i++){
				inputStars.childNodes[2*i-1].style.color="#1C3879";
			}
		}else{
			for(var i=pointer+1; i<=5; i++){
				inputStars.childNodes[2*i-1].style.color="#c0c0c0";
			}		
		}
	}
	
	function effectStarEnd(){
		for(var i=pointer+1; i<=5; i++){
			inputStars.childNodes[2*i-1].style.color="#c0c0c0";
		}
	}
	
	// 파일 첨부
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
	
	// 파일명 출력
	$("#file").on('change',function(){
	  var fileName = $("#file").val();
	  $(".upload-name").val(fileName);
	});
	
	</script>
</body>
</html>