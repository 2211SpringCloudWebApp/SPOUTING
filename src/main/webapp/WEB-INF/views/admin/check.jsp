<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SPOUTING-dailyWrite</title>
        <link rel="stylesheet" href="/resources/css/adminCss/ckeck.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    </head>
    <body>
        <div id="admin-ment">
            <img src="/resources/images/admin/user-gear.png" alt="error" width="70px"><br><br>
            <b>관리자 페이지</b>에 접근합니다.<br>
            일반 회원이라면 다시 로그인해주세요.<br>
            <a href="/user/logout"> >LOGIN< </a>
        </div>
        <table id="admin-ck">
            <tr>
                <th>Second PW</th>  
            </tr>
            <tr>
                <td><input type="password" id="admin-pw"></td>
            </tr>
            <tr>
                <td>
                    <input type="button" id="admin-btn" value="확인" onclick="double();">
                </td>
            </tr>
        </table>

        <script>
            function double() {
                var inputPw = $("#admin-pw").val();
                if(inputPw === "princess6") {
                    alert("관리자 인증 완료👩‍🚒")
                    location.href = "/admin/user";
                } else {
                    alert("관리자 인증 실패")
                }
            }
        </script>
    </body>
</html>