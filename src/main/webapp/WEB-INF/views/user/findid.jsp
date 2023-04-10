<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/resources/css/userCss/find.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>SPOUTING-아이디찾기</title>
</head>

<body>
	<jsp:include page="../common/header.jsp" />
    <div id="find-main">
		<div id="logo-main">아이디 찾기</div>
            <table id="find-box">
                <tr>
                    <td>이름</td>
                    <td>
                        <input type="text" placeholder="이름을 입력하세요" id="userName" name="userName" class="account">
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                        <input type="text" placeholder="이메일을 입력하세요" id="userEmail" name="userEmail" class="account">
                    </td>
                </tr>
            </table>

            <button id="find-submit" onclick="return findCheck()">확인</button>
            <div id="find-result"></div>
    </div >
	<jsp:include page="../common/footer.jsp" />

    <script>
        function findCheck() {
            var userName = $("#userName").val();
            var userEmail = $("#userEmail").val();
            $.ajax({
                type: "POST",
                url: '/user/findid',
                data: {
                    userName: userName,
                    userEmail: userEmail
                },
                success: function(data) {
                    if(data === "false") {
                        $("#find-result").html("해당 회원이 없습니다." + "<br> "+"정보를 확인해주세요.");
                    } else {
                        $("#find-result").html("ID : " + data);
                    }
                }
            });
        }
 
                   
    </script>
</body>

</html>
