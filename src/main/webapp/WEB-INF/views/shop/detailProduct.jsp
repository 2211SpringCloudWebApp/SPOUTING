<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 상세</title>
	<style>
		@font-face {
		    font-family: 'Pretendard-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
		    font-weight: 400;
		    font-style: normal;
		}
		
		* {
		    font-family: 'Pretendard-Regular'; 
		    box-sizing: border-box;
		}
		#nav {
		  float: left;
		  width: 200px;
		  height : 50vh;
		}
		#maincontainer {
		    width: calc(100% - 200px);
		    margin-left : 200px;
		    height : 2000px;
		    padding-top : 150px;
		}
		h1, p {
			text-align : center;
		}
		img{
			height : 100px;
		}
	</style>
</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
	<div id="nav">
		<jsp:include page="./menu.jsp"></jsp:include>
	</div>
	
	<div id="maincontainer">
		<h1>상품 상세 페이지</h1>
		${product }
	</div>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>