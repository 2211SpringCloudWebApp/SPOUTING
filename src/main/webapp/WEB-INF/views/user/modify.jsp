<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPOUTING-정보수정</title>
    <link rel="stylesheet" href="/resources/css/userCss/modifyCss.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <div id="modi-container">
        <div id="modi-box">
            <section id="modi-msg">
                <h2>수정할 회원정보를 입력해주세요.</h2>
            </section>
            <section id="modi-area">
                <form action="/user/modify" method="post">
                    <table>
                        <tr>
                            <th>ID</th>
                            <td>
                                <input type="text" id="userId" name="userId" value="${user.userId}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th>PW</th>
                            <td>
                                <input type="password" id="userPw" name="userPw" maxlength="15" value="${user.userPw}" required>
                            </td>
                        </tr>
                        <tr>
                            <th>PW:re</th>
                            <td>
                                <input type="password" id="userPwRe" name="userPwRe" placeholder="비밀번호를 다시 입력하세요" maxlength="15" required>
                                <span id="pwdCheck-msg"></span>
                            </td>
                        </tr>
                        <tr>
                            <th>NAME</th>
                            <td>
                                <input type="text" name="userName" id="userName" value="${user.userName}" required>
                            </td>
                        </tr>
                    </table>
                    <div id="btn-box">
                        <input type="submit" id="modi-btn" value="수정하기" onclick="return checkModi(event)"><br>
                        <input type="button" id="remo-btn" value="탈퇴하기" onclick="return removeUser()">
                    </div>                    
                </form>
            </section>        
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"></jsp:include>

    <script>
        function checkModi() {
            const userPw    = $("#userPw").val();
            const userPwRe  = $("#userPwRe").val();
            const userName  = $("#userName").val();
            if(userPw === "") {
                alert("비밀번호를 입력해주세요!")
                return false;
            } else if(userPw != userPwRe) {
                alert("비밀번호가 비밀번호 확인과 다릅니다.");
                return false;
            } else if(userName === "") {
                alert("회원 이름이 필요합니다!");
                return false;
            }
            alert("정보 수정 완료😉")
        }

        function removeUser() {
            if(window.confirm("정말 탈퇴하시겠습니까?😢")) {
                alert("탈퇴완료! 꼭 다시 만나요~")
                var userId = "${user.userId}";
                location.href = "/user/delete?userId=" + userId;
            }
        }
    </script>
</body>
</html>