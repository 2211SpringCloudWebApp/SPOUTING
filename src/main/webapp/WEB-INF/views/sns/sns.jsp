<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>sns 페이지</title>
    <style>
    	@font-face {
		    font-family: 'Pretendard-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
		    font-weight: 400;
		    font-style: normal;
		    }
	
		body {
		    background-color: white;
		    font-family: 'Pretendard-Regular';
		}
		
		#sns-main {
			padding: 40px;
			height: 700px;
			width: 800px;
			background-color: #F9F5EB;
 			margin: 0 auto;
		}
    	
    </style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<div id="sns-main">
	    <h1 id="sns-header">sns 들어갈 부분</h1>
    </div>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>