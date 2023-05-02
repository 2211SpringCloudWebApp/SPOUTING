<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메세지함</title>

    <style>
        @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
        }
        
        body {
            font-family: 'Pretendard-Regular';
        }

        .message-main {
            width: 530px;
            height: 600px;
            --background-color: pink;
            border: 1px solid black;

        }

        .message-header {
            padding: 35px;
            text-align: center;
            font-size: 20px;
            font-weight: bolder;
            background-color: rgba(136, 172, 202, 0.5);
        }

        .message-nav {
            background-color: rgb(255, 255, 255);
            padding: 13px;
            display: flex;
            justify-content: space-around;
            border-bottom: 1px solid rgb(82, 82, 82);
            border-top: 1px solid rgb(82, 82, 82);
        }

        .message-btn {
            width: 100px;
            height: 30px;
            cursor: pointer;
            background-color: white;
            border-radius: 5px;
            border: 1px solid rgb(163, 144, 90);
            font-family: 'Pretendard-Regular';
        }

        .message-btn:hover {
            border: 1px solid rgb(0, 0, 0);
            background-color: rgb(218, 211, 211);
        }

        .message-list {
            --background-color: aqua;
            width: 530px;
            height: 400px;
            overflow: auto;
        }

        .one-message {
            width: 450px;
            height: 100px;
            background-color: rgb(255, 255, 255);
            border: 1px solid rgb(180, 180, 180);
            margin: 30px;
        }

        #one-line {
            width: 500px;
        }

        hr {
            margin-block-start: 0em;
            margin-block-end: 0em;
            width: 500px;
        }


        .one-message-header {
            width: 450px;
            height: 50px;
            background-color: rgb(248, 235, 218);
            border-bottom: 1px solid rgb(180, 180, 180);
            display: flex;
            align-items: center;
        }

        .letter-icon {
            margin: 0 15px 0 15px;
        }

        .user-name {
            --margin: 0 5px 0 5px;
        }
        .open-yn {
            margin: 0 5px 0 15px;
        }

        .send-time {
            margin: 0 15px 0 0;
            float: right;
            margin-left: auto;

        }

        .one-message-content {
            width: 450px;
            height: 50px;
            background-color: rgb(255, 255, 255);
            border-bottom: 1px solid rgb(180, 180, 180);
            display: flex;
            align-items: center;
            cursor: pointer;
        }
        .send-message {
            margin: 0 15px 0 15px;
        }

        .message-write {
            width: 480px;
            height: 370px;
            --background-color: bisque;
            margin: auto;
        }

        .search-user {
            width: 480px;
            height: 100px;
            --background-color: aqua;
            margin: auto;
        }

        .search-user-header {
            padding: 20px 5px 5px 5px;
        }

        .search-user-main {
            padding: 5px;
        }

        .search-user-textbox {
            width: 455px;
            height: 35px;
            background-color: rgb(226, 226, 226);
            border: 0;
            border-radius: 3px;
            padding: 5px;
            font-family: 'Pretendard-Regular';
        }

        .message-box {
            width: 480px;
            height: 270px;
            --background-color: blue;
            margin: auto;
        }

        .message-box-header {
            padding: 15px 5px 5px 5px;
        }

        .message-box-main {
            padding: 5px;
        }

        .message-textbox {
            width: 455px;
            height: 200px;
            font-family: 'Pretendard-Regular';
            resize: none;
        }

        .button-area {
            --width: 480px;
            height: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
        }



        .reset-btn {
            width: 100px;
            height: 30px;
            background-color: rgb(255, 255, 255);
            border: 1px solid #0D6EFD;
            color: #0D6EFD;
            font-family: 'Pretendard-Regular';
            cursor: pointer;
            border-radius: 3px;

        }

        .submit-btn {
            width: 100px;
            height: 30px;
            background-color: #0D6EFD;
            border: 0;
            color: rgb(255, 255, 255);
            font-family: 'Pretendard-Regular';
            cursor: pointer;
            border-radius: 3px;

        }

    </style>
</head>
<body>
    <div class="message-main">
        <div class="message-header">
            MESSAGE BOX
        </div>

        <div class="message-nav">
            <button class="message-btn" onclick="location.href='/message?userNo=${loginUser.userNo}';">받은 쪽지</button>
            <button class="message-btn" onclick="location.href='messageSend?userNo=${loginUser.userNo}';">보낸 쪽지</button>
            <button class="message-btn" onclick="location.href='/messageWrite?userNo=${loginUser.userNo}';">쪽지 보내기</button>
        </div>

	        <div class="message-write">
	            <div class="search-user">
	                <div class="search-user-header">
	                    <img class="person-icon" src="/resources/images/message/user.png" alt="" width="16px" height="16px">
	                   	 &nbsp;받는사람
	                </div>
	                <div class="search-user-main">
	                    <input type="text" class="search-user-textbox" value="${oneMessage.userName }">
	                </div>
	            </div>
	
	            <div class="message-box">
	                <div class="message-box-header">
	                    <img class="chat-icon" src="/resources/images/message/chat.png" alt="" width="16px" height="16px">
	                    	&nbsp;쪽지내용
	                </div>
	                <div class="message-box-main">
	                    <textarea class="message-textbox">${oneMessage.msgContent }</textarea>
	                </div>
	            </div>
	        </div>
	        <br><hr>
	        <div class="button-area">
	            <input type="reset" class="reset-btn" value="취소하기">
	            &nbsp;&nbsp;&nbsp;
	            <input type="submit" class="submit-btn" value="쪽지 보내기">
	        </div>



    </div>
</body>
</html>