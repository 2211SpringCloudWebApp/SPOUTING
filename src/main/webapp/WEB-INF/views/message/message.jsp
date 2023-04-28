<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
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
            width: 450px;
            height: 600px;
            --background-color: pink;
            border: 1px solid black;
        }

        .message-header {
            padding: 35px;
            text-align: center;
            font-size: 20px;
            font-weight: bolder;
            background-color: rgb(223, 223, 223);
        }

        .message-nav {
            background-color: rgb(186, 161, 161);
            padding: 10px;
            display: flex;
            justify-content: space-around;
        }

        .message-btn {
            width: 100px;
            height: 30px;

        }

    </style>
</head>
<body>
    <div class="message-main">
        <div class="message-header">
            MY ACCOUNT
        </div>
        <div class="message-nav">
            <button class="message-btn">111111</button>
            <button class="message-btn">222222</button>
            <button class="message-btn">333333</button>
        </div>

    </div>
</body>
</html>