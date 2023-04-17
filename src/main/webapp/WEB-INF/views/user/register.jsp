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
                JOIN FOR SPOUTING🥊
            </section>
            <section id="regi-area">

                <!-- 이용약관 모달창 -->
                <div id="modal">
                <div id="modal-content">
                    모달창
                    <button type="button" id="close-mod">창 닫기</button>
                </div>
                <div id="modal-layer"></div>
                </div>


                <form action="/user/register" method="POST">
                    <table>
                        <tr>
                            <th>ID</th>
                            <td>
                                <input type="text" id="userId" name="userId" placeholder="※ 4~12자 영문 소문자, 숫자" maxlength="12">
                                <input type="button" id="idCheck" value="중복확인"><br>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div id="idCheck-msg" style="text-align: center; font-size: 15px;"></div>
                            </td>
                        </tr>
                        <tr>
                            <th>PW</th>
                            <td>
                                <input type="password" id="userPw" name="userPw" placeholder="※ 6~15자 영문 대소문자, 숫자" maxlength="15">
                            </td>
                        </tr>
                        <tr>
                            <th>PW :re</th>
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
                                <input type="text" name="userEmail" id="userEmail">
                                <input type="button" id="check-send" value="이메일 인증">
                                <input type="hidden" id="check-code" placeholder="인증번호 입력">
                                <input type="hidden" id="check-btn" value="확인">
                                <span id="check-msg"></span>
                            </td>
                        </tr>
                        <tr>
                            <th>Gender</th>
                            <td id="gender-box">
                                <span><input type="radio" value="M" name="userGender"> Male</span>
                                <span><input type="radio" value="F" name="userGender"> Female</span>  
                            </td>
                        </tr>
                        <tr> 
                            <th>
                                이용약관 동의    
                                                          
                            </th>                          
                            <td>
                                개인정보 수집∙이용 동의 <input type="checkbox" id="info-con"><label for="info-con"></label>
                                <button type="button" id="open-mod">약관보기</button>
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
                    if(userId === "") {
                        $('#idCheck-msg').html("아이디를 입력해주세요!");
				        $('#idCheck-msg').css("color", "blue");
                        return false;
                    }
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
        //이메일 인증 ajax
        $('#check-send').click(function() {
            const email = $("#userEmail").val();
            //hidden 상태의 input 태그 활성화
            $('#check-code').attr("type", "text");
            $('#check-btn').attr("type", "button");
            $('#check-code').focus();

            $.ajax({
            type : "get",
            url : "",
            success : function(data) {

            }
            });
        });





        var ckeckRegi = () => {
            const userId = $("#userId").val();
            const userPw = $("#userPw").val();
            const userPw2 = $("#userPw2").val();
            const userName = $("#userName").val();
            const userEmail = $("#userEmail").val();
            
            /*********** 유효성검사 ***********/
            const userIdReg = /^[a-z0-9]{4,12}$/;
            const userPwReg = /^[a-zA-Z0-9]{6,15}$/;
            const userNameReg = /^[가-힣]{2,6}$/;
            const userEmailReg = /^[A-Za-z0-9\_\.\-]+@[a-z0-9\-\_]+\.[a-z]+$/;
            
            //아이디 공백 여부 체크
            if(userId === "") {
                alert("아이디를 입력해주세요.");
                $("#userId").focus();
                return false;
            }
            //아이디 유효성
            if(!userIdReg.test(userId)) {
                alert("아이디는 영문 소문자, 숫자 4~12자리로 입력해주세요.");
                $("#userId").focus();
                return false;
            }
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
            //비번 유효성
            if(!userPwReg.test(userPw)) {
                alert("비밀번호는 영문 대소문자, 숫자 6~15자리로 입력해주세요.");
                $("#userPw").focus();
                return false;
            }
            //비밀번호 일치여부 체크
            if(userPw !== userPw2) {
                alert("비밀번호가 일치하지 않습니다!")
                $("#userPw2").focus();
                return false;
            }
            // 이름 공백여부 체크
            if(userName === "") {
                alert("이름을 입력해주세요.");
                $("#userName").focus();
                return false;
            }
            //이름 유효성
            if(!userNameReg.test(userName)) {
                alert("이름은 한글만 가능하며, 2~6글자 입력 가능합니다.");
                $("#userName").focus();
                return false;
            }   
            //이메일 공백여부 체크
            if(userEmail === "") {
                alert("이메일을 입력해주세요.");
                $("#userEmail").focus();
                return false;
            }      
            //이메일 유효성체크
            if(!userEmailReg.test(userEmail)) {
                alert("이메일 형식이 올바르지 않습니다.");
                $("#userEmail").focus();
                return false;
            }              
            //이메일 인증 했는지 체크

            




            //성별 선택여부 체크
            if(!$('input:radio[name=userGender]').is(':checked')) {
                alert("성별을 체크해주세요!");
                return false;
            }
            alert("가입을 환영합니다. Spouting Together!");
        }
        

        //이용약관 모달창
        $("#open-mod").click(function() {
                $("#modal").fadeIn();
        })
        $("#close-mod").click(function() {
            $("#modal").attr('style','display:none;')
        })
   
    </script> 
</body>
</html>