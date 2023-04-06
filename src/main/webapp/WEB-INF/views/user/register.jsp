<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPOUTING-회원가입</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/userCss/register.css">
</head>
<body>
    <div id="regi-container">
        <div id="regi-box">
            <section id="regi-msg">
                <h3>회원가입 정보</h3>
                <p>정확한 회원정보를 입력해주세요. just spouting!</p>
            </section>
            <section id="regi-area">
                <form action="/user/register" method="POST">
                    <table>
                        <tr>
                            <th>ID <span>*</span></th>
                            <td>
                                <input type="text" id="userId" name="userId" maxlength="15" required>
                                <input type="button" id="idCheck-btn" value="중복확인"><br>
                                <span id="idCheck-msg"></span>
                            </td>
                        </tr>
                        <tr>
                            <th>PW <span>*</span></th>
                            <td>
                                <input type="password" id="userPw" name="userPw" maxlength="15" placeholder="※ 6~15자 영문 대소문자, 숫자">
                            </td>
                        </tr>
                        <tr>
                            <th>PW:re <span>*</span></th>
                            <td>
                                <input type="password" id="userPw2" name="userPw2" placeholder="비밀번호를 다시 입력하세요" maxlength="15">
                                <span id="pwdCheck-msg"></span>
                            </td>
                        </tr>
                        <tr>
                            <th>NAME <span>*</span></th>
                            <td>
                                <input type="text" name="userName" id="userName" required>
                            </td>
                        </tr>
                        <tr>
                            <th>EMAIL <span>*</span></th>
                            <td>
                                <input type="text" name="userEmail">
                                <input type="button" id="check-send" value="이메일 인증">
                                <input type="hidden" id="check-code" placeholder="인증번호 입력">
                                <input type="hidden" id="check-btn" value="확인">
                                <span id="check-msg"></span>
                            </td>
                        </tr>
                        <tr>
                            <th>Gender</th>
                            <td>
                                <input type="radio" value="M" name="userGender"> 남
                                <input type="radio" value="F" name="userGender"> 여
                            </td>
                        </tr>
                    </table>
                    <div id="join-btn">
                        <input type="submit" value="가입하기" >
                    </div>                    
                </form>
            </section>
            
        </div>

    </div>
</body>
</html>