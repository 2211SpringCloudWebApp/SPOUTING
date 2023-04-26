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
    <!-- 포트원 결제 api 라이브러리 -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <link rel="stylesheet" href="/resources/css/pointCss/charge.css">
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <section>
        <main>
            <div id="user-point">
                <span>
                    ${sessionScope.loginUser.userName}님의 현재 포인트 ✔ 
                    <b id="now-point">  ${userPoint}P </b>
                </span>
            </div>
            <form id="main-box" action="/point/charge" method="POST">
                <div id="buy-select"><br>
                    <span>포인트 충전 금액</span>
                    <select name="pointBuy" id="pointBuy" onchange="valChange()">
                        <option value="10000">10000</option>
                        <option value="30000">30000</option>
                        <option value="51500">50000</option>
                        <option value="107000">100000</option>
                    </select><br>
                    <p id="after-info">충전 후 잔여 포인트 : <span id="after-char" style="font-size: 17px; padding: 10px;"></span></p>
                    <div class="balloon"></div>
                </div>
                <div id="buy-info">
                    <ul>
                        <li>최소 충전가능 금액은 10,000P이고, 포인트는 1P 당 1원입니다.</li>
                        <li>충전 후 포인트는 환불 불가능합니다.</li>
                        <li>회원 탈퇴 시 남은 포인트를 현금으로 환급받을 수 없습니다.</li>
                    </ul>
                </div>
                <input type="button" value="충전하기" id="buy-btn" onclick="payment();">

            </form>
            <div id="event-box">
                <div>
                    <h3>🏆이달의 충전 이벤트🏆</h3><br>
                    50,000P 충전 시 추가 3% 충전!
                </div>
                <div>
                    <h3>🌺봄이라 운동해봄🌺</h3><br>
                    따뜻한 날씨, 힘내서 Spouting해요<br>
                    100,000P 충전 시 추가 7% 충전
                </div>
            </div>
            <input type="hidden" id="userName" value="${sessionScope.loginUser.userName}">
            <input type="hidden" id="userEmail" value="${sessionScope.loginUser.userEmail}">s
        </main>
    </section>
    <jsp:include page="../common/footer.jsp"></jsp:include>

    <script>
        function valChange() {
            const selectedVal = $("#pointBuy option:selected").val();
            const balloon = $(".balloon");
            const afterChar = $("#after-char");

            if(selectedVal === "10000") {
                balloon.attr('style','display:none;')
                var calc = Number('${userPoint}')+Number(10000);
                afterChar.html(calc + 'P');
            }
            if(selectedVal === "30000") {
                balloon.attr('style','display:none;')
                var calc = Number('${userPoint}')+Number(30000);
                afterChar.html(calc + 'P');
            }
            if(selectedVal === "51500") {
                balloon.attr('style','display:block;')
                balloon.html('이달의 충전 이벤트!<br> >1,500P< 추가 충전😉')
                var calc = Number('${userPoint}')+Number(51500);
                afterChar.html(calc + 'P');
            }
            if(selectedVal === "107000") {
                balloon.attr('style','display:block;')
                balloon.html('봄이라 운동해봄<br> >>7,000P<< 추가 충전😎')
                var calc = Number('${userPoint}')+Number(107000);
                afterChar.html(calc + 'P');
            }
        }
        //결제 api
        function payment() {
            const addPoint = $("#pointBuy").find(":selected").val();
            const totalPrice = $("#pointBuy").find(":selected").text();
            const userName = $("#userName").val();
            const userEmail = $("#userEmail").val();
            console.log(totalPrice);

            const IMP = window.IMP; // 생략 가능
            IMP.init("imp60366253"); // 예: imp00000000a
            IMP.request_pay({
                pg: "kakaopay",
                pay_method: "card",
                merchant_uid: new Date().getTime(),   // 주문번호
                name: "SPOUTING 포인트 충전",
                amount: totalPrice, 
                buyer_email: userEmail,
                buyer_name: userName,
            }, function (rsp) { // callback
                //결제 검증
                if(rsp.success) {
                    $.ajax({
                        type    : "POST",
                        url     : "/point/charge",
                        data    : {
                                    "totalPrice" : addPoint
                                    },
                        success : function(data){
                            if(data == "true") {
                                alert("충전 성공💰")
                                $(location).attr('href','/point/detail');
                            } else {
                                alert("포인트 충전 실패");
                            }
                        }
                    })       
                } else {
                    alert("결제 오류");
                }          
            });   
        }

        
        
    </script>
</body>
</html>