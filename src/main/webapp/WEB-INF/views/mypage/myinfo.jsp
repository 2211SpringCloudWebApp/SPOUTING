<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPOUTING-MyPage</title>
    <link rel="stylesheet" href="/resources/css/mypageCss/nav.css">
    <link rel="stylesheet" href="/resources/css/mypageCss/myinfoCss.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <div id="head-info">
        <table>
            <tr>
                <td id="user-msg">
                    ${sessionScope.loginUser.userName}님 <br>
                    오늘도 Spouting!
                </td>
                <td>
                    <button id="daily-btn" onclick="location.href='/diary/list'">🦾하루기록</button>
                </td>              
            </tr>
        </table>
    </div>
    <ul id="left-nav">
        <li><a href="">예약내역</a></li>
        <li><a href="">주문내역</a></li>
        <li><a href="">상품후기</a></li>
        <li><a href="">나의 커뮤니티</a></li>
        <li><a href="">나의 문의</a></li>
        <li><a href="/point/detail">포인트 관리</a></li>
        <li class="selected"><a href="/mypage/myinfo">개인정보 수정</a></li>
    </ul>

    <div id="main-box">
        <div id="check-box">
            <div id="logo-main">
                회원님의 안전한 정보보호를 위해 <br>
                비밀번호를 확인해주세요.              
            </div>
            <table id="info-box">
                <tr>
                    <td>ID</td>
                    <td>
                        <input type="text" class="info" value="${sessionScope.loginUser.userId}" readonly>
                    </td>
                </tr>
                <tr>
                    <td>PW * </td>
                    <td>
                        <input type="hidden" value="${sessionScope.loginUser.userPw}" id="userPw">
                        <input type="password" id="userCheckPw" class="info" onkeydown="press();">
                    </td>
                </tr>
            </table>
            <button id="check-btn" onclick="checkPw();">확인</button>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"></jsp:include>

    <script>
        function press() {
            if(window.event.keyCode == 13) { //JS에서 13=enter키
                checkPw();
            }
        }

        function checkPw() {
            var userPw = $("#userPw").val();
            var userCheckPw = $("#userCheckPw").val();
            if(userPw === userCheckPw) {
                location.href = "/user/modify"
            } else {
                alert("비밀번호 오류!")
            }
        }

        
    </script>
</body>
</html>