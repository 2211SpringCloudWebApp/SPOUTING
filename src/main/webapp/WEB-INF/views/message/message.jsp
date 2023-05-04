<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<html>
<head>
<meta charset="EUC-KR">
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
            width: 550px;
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
            width: 540px;
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
            font-size: 13px;

        }

        .one-message-content {
            width: 450px;
            height: 50px;
            background-color: rgb(255, 255, 255);
            border-bottom: 1px solid rgb(180, 180, 180);
            display: flex;
            align-items: center;
            cursor: pointer;
            --display: block;
            white-space: nowrap;
			overflow: hidden;
			text-overflow: ellipsis;
        }
        .send-message {
            margin: 0 15px 0 15px;
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

        <div class="message-list">
        
		<c:forEach items="${messageList }" var="messageList" varStatus="i">
            <div class="one-message">
                <div class="one-message-header">
                	<input type="hidden" value="${messageList.msgNo }">
                    <img class="letter-icon" src="/resources/images/message/mail.png" alt="" width="25px" height="25px">
                    <span class="user-name">${messageList.userName }</span>
                    
<!--                     메세지 읽음 여부 체크 -->
                    <c:if test="${messageList.msgOpenCk eq 0 }">
                    	<span class="open-yn" style="color: rgb(226, 1, 1);">(읽지 않음)</span>
                    </c:if>
                    <c:if test="${messageList.msgOpenCk ne 0 }">
                    	<span class="open-yn" style="color: rgb(59, 80, 201);">(읽음)</span>
                    </c:if>
                    
                    <span class="send-time">${messageList.sendTimeNew }</span>
                </div>
                <div class="one-message-content" onclick="location.href='/messageDetail?msgNo=${messageList.msgNo}';">
                    <span class="send-message">${messageList.msgContent }</span>
                </div>
            </div>
            </c:forEach>
            

<!-- 하드코딩 영역 -->
<!--             <div class="one-message"> -->
<!--                 <div class="one-message-header"> -->
<!--                     <img class="letter-icon" src="/resources/images/message/letter.png" alt="" width="25px" height="25px"> -->
<!--                     <span class="user-name">닉네임 영역</span> -->
<%--                     <c:if test="${messageList.msgOpenCk eq 1 }"> --%>
<!--                     <span class="open-yn" style="color: rgb(59, 80, 201);">(읽음)</span> -->
<%--                     </c:if> --%>
<!--                     <span class="send-time">전송 시간</span> -->
<!--                 </div> -->
<!--                 <div class="one-message-content"> -->
<!--                     <span class="send-message">안녕하세용용용</span> -->
<!--                 </div> -->
<!--             </div> -->

        </div>


    </div>
</body>
</html>