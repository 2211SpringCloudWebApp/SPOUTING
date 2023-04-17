<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPOUTING-point</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/pointCss/charge.css">
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <main>
        <div id="user-point">
            <span>
                ${sessionScope.loginUser.userName} 님의 포인트 | 
                ${userPoint} 
            </span>
        </div>
        <form id="main-box">
            <div id="buy-select">
                <span>포인트 충전 금액</span>
                <select name="point-buy" id="point-buy">
                    <option value="10,000">10,000</option>
                    <option value="30,000">30,000</option>
                    <option value="50,000">50,000</option>
                    <option value="100,000">100,000</option>
                </select>
            </div>
            <div id="buy-info">
                <ul>
                    <li>최소 충전가능 금액은 10,000P이고, 포인트는 1P 당 1원입니다.</li>
                    <li>충전 후 포인트는 환불 불가능합니다.</li>
                    <li>회원 탈퇴 시 남은 포인트를 현금으로 환급받을 수 없습니다.</li>
                </ul>
            </div>
            <input type="submit" value="충전하기" id="buy-btn">
            <div class="balloon_01"></div>
        </form>
        <div id="event-box">
            <div>
                <h3>이달의 충전 이벤트</h3>
                50,000P 충전 시 추가 5% 충전!
            </div>
            <div>
                <h3>봄이라 운동해봄</h3>
                따뜻한 날씨, 힘내서 Spouting 해요!<br>
                100,000P 충전 시 추가 7% 충전
            </div>
        </div>
    </main>
    <jsp:include page="../common/footer.jsp"></jsp:include>

    <script>
        
    </script>
</body>
</html>