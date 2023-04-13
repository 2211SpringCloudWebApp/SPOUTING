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
	<jsp:include page="../common/header.jsp"></jsp:include>
    <div id="regi-container">
        <div id="regi-box">
            <section id="regi-msg">
                <h3>just spouting!</h3>
                <p>정확한 회원정보를 입력해주세요. </p>
            </section>
            <section id="regi-area">
                <form action="/user/register" method="POST">
                    <table>
                        <tr>
                            <th>ID</th>
                            <td>
                                <input type="text" id="userId" name="userId" maxlength="15" required>
                                <input type="button" id="idCheck" value="중복확인"><br>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div id="idCheck-msg" style="text-align: center;"></div>
                            </td>
                        </tr>
                        <tr>
                            <th>PW</th>
                            <td>
                                <input type="password" id="userPw" name="userPw" maxlength="15" placeholder="※ 6~15자 영문 대소문자, 숫자">
                            </td>
                        </tr>
                        <tr>
                            <th>PW:re</th>
                            <td>
                                <input type="password" id="userPw2" name="userPw2" placeholder="비밀번호를 다시 입력하세요" maxlength="15">
                            </td>
                        </tr>
                        <tr>
                            <th>NAME</th>
                            <td>
                                <input type="text" name="userName" id="userName" required>
                            </td>
                        </tr>
                        <tr>
                            <th>EMAIL</th>
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
                            <td style="padding-left: 20px;">
                                <input type="radio" value="M" name="userGender"> 남  
                                <input type="radio" value="F" name="userGender"> 여  
                            </td>
                        </tr>
                    </table>
                    <div id="join-btn">
                        <input type="submit" value="가입하기" onclick="return ckeckRegi(event)">
                    </div>                    
                </form>
            </section>        
        </div>
    </div>
	<jsp:include page="../common/footer.jsp"></jsp:include>

    <script>
        //아이디 중복확인 ajax
        $("#idCheck").click(function() {
            const userId = $("#userId").val();
            $.ajax({
                type : "get",
                url : "/user/register/idCheck?userId="+userId,
                success : function(data) {
                    answer = data;
                    if(answer === "true") {
                        $('#idCheck-msg').html("사용 가능한 아이디입니다.");
				        $('#idCheck-msg').css("color", "green");
                    } else {
                        $('#idCheck-msg').html("이미 사용중인 아이디입니다.");
				        $('#idCheck-msg').css("color", "red");
                    }
                }
            });
        });

        var ckeckRegi = () => {
            //아이디 중복확인 했는지 체크
            if($("#idCheck-msg").text() === "") {
                alert("아이디 중복확인을 해주세요.");
                return false;
            }
            //아이디 중복 여부 체크
            if(answer === "false") {
                $("#userId").focus();
                $('#idCheck-msg').html("이미 사용중인 아이디입니다.");
				$('#idCheck-msg').css("color", "red");
                return false;
            }

            const userPw = $("#userPw").val();
            const userPw2 = $("#userPw2").val();
            //비밀번호 일치 여부 체크
            if(userPw !== userPw2) {
                alert("비밀번호가 일치하지 않습니다!")
                return false;
            }
            alert("가입을 환영합니다. Spouting Together!");
        }
        
    </script>
</body>
</html>