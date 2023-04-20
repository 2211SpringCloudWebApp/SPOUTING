<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPOUTING-Login</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/userCss/login.css">
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <div id="login-container">
            <div id="login-box">
                <p>SPOUTING TOGETHER</p>
                <input type="text" placeholder="  ID" id="userId" name="userId" class="login-input">
                <input type="password" placeholder="  PW" id="userPw" name="userPw" class="login-input"><br>
				<button id="login-btn" onclick="return submitCheck()">LOGIN</button><br>
                <a href="/user/findid">아이디 찾기</a> | 
                <a href="/user/findpw">비밀번호 찾기</a><br><br><br><br>
                <span>"SPOUTER"가 되어 건강한 일상을 누리세요!</span>
                <button id="join-btn" onclick="location.href='/user/register'">JOIN</button>
            </div> 
    </div>
    <jsp:include page="../common/footer.jsp"></jsp:include>
    <script>
        function submitCheck() {
            var userId = $("#userId").val();
            var userPw = $("#userPw").val();
            $.ajax({
                type: "POST",
                url: '/user/loginCheck',
                data: {
                    userId: userId,
                    userPw: userPw
                },
                success: function(data) {
                    if(data === "false") {
                        alert('아이디 or 비밀번호가 등록된 정보와 다릅니다.');
                    } else if(data === "admin") {
                        location.href = "/admin/user";    
                    } else {
                        location.href = "/";
                    }
                }
            });
        }
    
    </script>
</body>
</html>