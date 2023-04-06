<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPOUTING-Login</title>
    <link rel="stylesheet" href="/resources/css/userCss/login.css">
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <div id="login-container">
            <div id="login-box">
                <p>SPOUTING TOGETHER</p>
                <input type="text" placeholder="  ID" id="userId" name="userId" class="login-input">
                <input type="password" placeholder="  PW" id="userPw" name="userPw" class="login-input"><br>
                <button id="login-btn">LOGIN</button><br>
                <a href="/user/findId">아이디 찾기</a> | 
                <a href="/user/findPw">비밀번호 찾기</a><br><br><br><br>
                <span>"SPOUTER"가 되어 건강한 일상을 누리세요!</span>
                <button id="join-btn">JOIN</button>
            </div> 
    </div>
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>