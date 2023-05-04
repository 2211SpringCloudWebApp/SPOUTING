<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>소셜링 오픈 페이지</title>
    <style>
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
            }

        body {
            --background-color: rgb(237, 237, 237);
            font-family: 'Pretendard-Regular';       
        }

        h1 {
            text-align: center;
        }
        
        #meetingOpen-main{
        	padding: 20px;
			height: 800px;
			width: 800px;
			background-color: #F3F3F3FF;
			margin: 0 auto;
	 		border: solid 1px black;
	        text-align: center;
        }
        
       		#img-viewer {
	            width: 600px;
	            height: 250px;
	            overflow: hidden;
	            margin: 0 auto;
	            border: solid 1px black;
	            background-color: rgba(168, 168, 168, 0.8);
	            --display: flex;
	
	        }
	
	        #img-view {
	            margin: 0 auto;
	            width:100%;
			    height:100%;
			    object-fit:scale-down;
	        }
	        
	        .meeting-info-input {
	        	width: 300px;
	        	height: 30px;
	        	border-radius: 10px;
	        	padding: 10px;
	        	margin: 7px;
	        	
	        }
	        
	        .meeting-info-textarea {
	        	width: 600px;
	        	height: 150px;
	        	resize: none;
	        	padding: 10px;
	        }
        
        	.meeting-info-btn {
        		width: 230px;
        		height: 40px;
        		cursor: pointer;
        		background-color: white;
        		font-size: 18px;
        		border-radius: 15px;
        	}
        	
        	.meeting-info-btn:hover {
        		box-shadow: 0 10px 35px rgba(0, 0, 0, 0.05), 0 6px 6px rgba(0, 0, 0, 0.1);
			    transition: box-shadow 0.1s linear;
			    cursor: pointer;
        	}
        
        
    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>

	<c:if test="${sessionScope.loginUser.userNo eq null }">
		<script>
			$(document).ready(function () {
	            alert("로그인이 필요합니다.")
	            window.location.replace("http://localhost:8999/user/login");
        	});
		</script>
	</c:if>
	
	<br><br><br>
	
    <h1>🙌 SOCIALRING OPEN</h1> <br><br>
    

    <form action="/meetingOpen" method="POST" enctype="multipart/form-data" id="meetingForm">
	    <div id="meetingOpen-main">
	    
		    <input type="hidden" id="readerNo" name="readerNo" value=${loginUser.userNo }>
		    <br><br>
		        제목  <input type="text" name="meetingName" class="meeting-info-input" placeholder="소셜링을 한줄로 소개해주세요."> 
		        <br>
		        인원  <input type="number" value="2" name="meetingPeople" class="meeting-info-input">
		        <br>
		        날짜  <input type="datetime-local" name="meetingDate" class="meeting-info-input">
		        <br>
		        
		        <br><br>
		        
		        <div id="img-viewer">
	                <img id="img-view" width="400">
	            </div> 
	            
		        <textarea name="meetingDetail" placeholder="소셜링 설명을 입력하세요." class="meeting-info-textarea"></textarea>
		        <br>
		        
		        
		        
	            <br>
		        <input type="file" id="uploadFile" name="uploadFile" onchange="loadImg(this);"> <br><br>
		<!--         작성자 : <input type="number" value="3" name="readerNo"> -->
		        <br><br>
		
		        <input type="submit" value="소셜링 주최하기 👋" class="meeting-info-btn">
		<!--         <input type="button" value="닫기" onclick="self.close()"> -->
		
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
		
// 	onclick="doMeetOpen();
	
		function doMeetOpen() {
// 			action="/meetingOpen" method="post"
			var form = document.querySelector("#meetingForm");
			form.action = "/meetingOpen";
			form.method = "get";
			form.submit();
			window.opener.location.href = "/meeting";
			window.close();
		}
	</script>
</body>
</html>