<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	    <title>sns 사진 업로드 페이지</title>
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
	
	        #sns-insert-main {
	            padding: 20px;
				height: 750px;
				width: 800px;
				background-color: #F3F3F3FF;
	 			margin: 0 auto;
	 			border: solid 1px black;
	            text-align: center;
	        }
	        
	        #header-block {
	            padding: 0px;
	        }
	
	        #uploadFile {
	            float: right;
	        }
	
	        #content-block {
	            margin-top: 50px;
	        }
	
	        #img-viewer {
	            width: 600px;
	            height: 350px;
	            margin: 0 auto;
	            border: solid 1px black;
	            background-color: rgb(255, 255, 255);
	            --display: flex;
	
	        }
	
	        #img-view {
	            margin: 0 auto;
	            align-items: center;
	        }
	
	        #write-viewer{
	            --width: 600px;
	            height: 130px;
	            --border: solid 1px black;
	            --background-color: rgb(255, 255, 255);
	            margin: 0 auto;
	        }
	
	        #photoContent {
	            margin: 0 auto;
	            width: 600px;
	            height: 70px;
	        }
	
	        #upload-btn {
				width: 130px;
				height: 40px;
				cursor: pointer;	        
	
	        }
	
	    </style>
	</head>
	<body>
	
		<jsp:include page="../common/header.jsp"></jsp:include>
		<br>
	
	    <form action="/sns/upload" method="post" enctype="multipart/form-data" style="width:1000px; margin:0 auto;">
	
	    <div id="sns-insert-main">
	        <div id="header-block">
	        	<br>
	            <h1 id="sns-insert-header">사진 업로드</h1>
	        </div>
	
	        <input type="file" id="uploadFile" name="uploadFile" onchange="loadImg(this);"> <br><br>
	
	        <div id="content-block">
	            <div id="img-viewer">
	                <img id="img-view" width="400">
	            </div>
	
	            <br>
	            <div id="write-viewer">
	                <textarea id="photoContent" name="snsContent" placeholder="텍스트를 입력하세요" style="resize: none;"></textarea>
	            </div>
	        </div>
	
	        <button type="submit" id="upload-btn">등록하기</button>
	    </div>
	
	    </form>
	    
	    <br>
	    <jsp:include page="../common/footer.jsp"></jsp:include>
	
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