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
	    <title>follower List</title>
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
	
	        .followList-main {
	            padding: 20px;
				height: 750px;
				width: 800px;
				background-color: #F3F3F3FF;
	 			margin: auto;
	 			border: solid 1px black;
	            --text-align: center;
	            margin-top: 20px;
	        }
	        
	        #header-block {
	            margin: 25px;
	        }
	        
	        #followList-header {
	        	text-align: center;
	        }
	        
	        #content-block {
	        	padding: 20px;
	        	overflow: auto;
	        }
	        
	        .member-info-list {
	        	display: flex;
	        	margin-bottom: 25px;
	        }
	        
	        .img-box {
				height: inherit;
				width: 100px;
				--background-color: beige;
				float: left;
				display: flex;
				justify-content: center;
				align-items: center;
			}
			
			.sns-profile-img {
				border-radius: 50%;
				--border: solid 1px black;
				width: 43px;
				height: 43px;
				display: flex;
				justify-content: center;
				align-items: center;
				cursor: pointer;
					}
			
			.profile-box {
				height: inherit;
				width: 500px;
				--background-color: coral;
				float: left;
				display: flex;
				flex-direction: column;
				justify-content: center;
			}
			
			.profile-intro {
				font-size: 14px;
			}
	
	
	    </style>
	</head>
	<body>
	
		<jsp:include page="../common/header.jsp"></jsp:include>
		<br>
	
	    <div class="followList-main">
	    
	        <div id="header-block">
	            <h1 id="followList-header">Follower List</h1>
	        </div>
	        
			<hr>
	
	        <div id="content-block">
	        
	        		<c:forEach items="${followerList }" var="followerList" varStatus="i">
						<div class="member-info-list">
					
							<div class="img-box">
								<img class="sns-profile-img" src="/resources/images/profile/${followerList.profileFileRename }" onclick="location.href='/sns?userNo=${followerList.userNo }';">
							</div>
							
							<div class="profile-box">
								<input type="hidden" value="${followerList.userNo }" id="userNo" name="userNo">
								<div class="profile-name-box">
									<h3 class="profile-name">${followerList.userName }</h3>
								</div> 
								<div class="profile-intro-box">
									<span class="profile-intro">${followerList.profileIntoduce }</span>
								</div>
							</div>
							
						</div> 	
					</c:forEach>

	        </div>
	
	    </div>
	
	    
	    <br>
	    <jsp:include page="../common/footer.jsp"></jsp:include>
	

	</body>
</html>