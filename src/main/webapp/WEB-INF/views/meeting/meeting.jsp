<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모임 찾기</title>
    <style>
    	@font-face {
		    font-family: 'Pretendard-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
		    font-weight: 400;
		    font-style: normal;
		    }
	
		body {
		    background-color: #F9F5EB;
		    font-family: 'Pretendard-Regular';
		}
		
		#meeting-main {
			padding: 40px;
			height: 800px;
		}
		
		#meeting-header {
		    float: left;
		}
		
		#meeting-startBtn {
		    width: 200px;
		    height: 40px;
		    background-color: rgb(238, 238, 238);
		    border-radius: 20px;
		    cursor: pointer;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    float: right;
		}
		
		#meeting-startBtn:hover{
		    background-color: rgb(31, 9, 119);
		    color: white;
		}
    	
    </style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<div id="meeting-main">
	    <h1 id="meeting-header">🎯 모집 중인 소셜링</h1>
	
	    <br>
	    <div id="meeting-startBtn"><b>소셜링 주최하기👆</b></div>
    </div>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>