<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- 부트스트랩 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
        <!-- ajax CDN -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <!-- jquery CDN -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
       
        <!-- 포트원 아임포트(결제api)라이브러리 -->
        <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
        <title>시설예약하기</title>
        <style>
        @font-face {
             font-family: 'Pretendard-Regular';
             src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
             font-weight: 400;
             font-style: normal;
         }
         @font-face {
		    font-family: 'Chosunilbo_myungjo';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Chosunilbo_myungjo.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		main{
    --background-color: #1C3879;
		}
		/* 마우스커서  */
body {
  cursor: default !important;
}
		#invoice{
    background-color: #1C3879;
    color: #F9F5EB;
    text-align: center;   
    padding: 10px;
    margin-top: 40px;
    font-size: larger;
		}
    form{
      display: inline-block;
    }
    #tableDiv{
      width: 100%;
      display: flex;
      justify-content: center;
     align-items: center;
    }
    table{
      margin: 0 auto;
      margin-top: 30px;
      margin-bottom: 50px;
      border-collapse: collapse;
    }
    td{
      padding-top: 10px;
      padding-bottom: 10px;
    }
    td:first-child{
      border-right: 1px dashed #607EAA;
      padding-right: 20px;
      font-weight: bolder;
    }
    td:last-child{
      padding-left: 20px;
      color: #1C3879 ;
    }
    tr#dotted-line1, tr#dotted-line2{
      border-bottom: 1px dashed #607EAA;
    }
    input{
	    border-left: none;
	    border-top: none;
	    border-right: none;
	    border-bottom: 1px solid #1C3879;
	    padding-left: 10px;
	    width: 100px;
	}
    input:focus {outline:none;}

        </style>
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<main>
          
           <div id="invoice">
            invoice
          </div>
          <!--            //a지점//시설이름//인원수//이용날짜//이용시간//총금액//포인트불러오기 -->
          <!-- 			//--//사용포인트입력//결제금액//api -->
          <div id="tableDiv">
            <form id="paymentForm" action ="/book/bookUp" method="post">   
                <input type="hidden" id="paidPrice" name="paidPrice">
	            <input type="hidden" value="${book.bookNo }" name="bookNo">  
	            <input type="hidden" value="${book.userNo }" name="userNo">  
	            <table>
	              <tr>
	                <td>지점명</td>
	                <td>${book.centerName }</td>
	              </tr>
	              <tr>
	                <td>시설명</td>
	                <td>${book.facilityName }</td>
	              </tr>
	              <tr>
	                <td>예약자명</td>
	                <td>${book.userName }</td>
	              </tr>
	              <tr>
	                <td>예약자이메일</td>
	                <td>${book.userEmail }</td>
	              </tr>
	              <tr>
	                <td>이용인원수</td>
	                <td>${book.numPeople }</td>
	              </tr>
	              <tr>
	                <td>이용일</td>
	                <td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${book.useDate }"/></td>
	              </tr>
	              <tr>
	                <td>이용시간</td>
	                <td><fmt:formatDate pattern="hh시" value="${book.startTime }"/>~
	                	<fmt:formatDate pattern="hh시" value="${book.endTime }"/></td>
	              </tr>
	              <tr id="dotted-line1">
	                <td>총이용금액</td>
	                <td id="bookPrice">${book.bookPrice }</td>
	              </tr>
	              <tr>
	                <td>보유포인트</td>
	                <td id="totalPoint">${book.userPoint }</td>
	              </tr>
	              <tr id="dotted-line2">
	                <td>사용포인트 입력</td>
	                <td><input type="text" name="pointChange" value="0"></td>
	              </tr>
	              <tr>
	                <td>결제금액</td>
	                <td id="priceToPay"></td>
	              </tr>
	              <tr>
	                <td></td>
	                <td><button type="button" id="fakePay">가짜결제갈겨</button></td>
	               
	                <!-- <td><button onclick="requestPay()">결제갈겨:포트원 이걸로 바꿔야함</button></td> -->
	              </tr>
	            </table>
            <!--              	"수정내역이 있다면 뒤로가기눌러주셈"   -->
          
            </form>
          </div>
           
       	</main>
       	
       	<script>
          
       	$(document).ready(function() {
            // 결제요청 버튼 클릭 시 호출되는 함수
            $("#fakePay").on("click", function() {
            	
                // 결제금액을 가져옵니다.
                var paidPrice = $("#bookPrice").text();
                // 사용포인트를 가져옵니다.
                var pointChange = $("#pointChange").val();
                // 결제요청을 위한 데이터를 생성합니다.
				var bookNo = "${book.bookNo }";
		        var userNo = "${book.userNo }";
		        var centerName = "${book.centerName }";
		        var facilityName = "${book.facilityName }";
		        var userName = "${book.userName }";
		        var userEmail = "${book.userEmail }";
		        var useDate = "${book.useDate }";
		        var startTime = "${book.startTime }";
		        var endTime = "${book.endTime }";
		        var bookPrice = "${book.bookPrice }";
		        var numPeople = "${book.numPeople }";
//                 var data = {
//                     paidPrice: paidPrice,
//                     pointChange: pointChange,
//                     paidPrice: paidPrice,
//                     pointChange: pointChange,
//                     bookNo: bookNo,
//                     userNo: userNo,
//                     centerName: centerName,
//                     facilityName: facilityName,
//                     userName: userName,
//                     userEmail: userEmail,
//                     useDate: useDate,
//                     startTime: startTime,
//                     endTime: endTime,
//                     bookPrice: bookPrice,
//                     numPeople: numPeople
//                 };
                // 아임포트 결제 함수를 호출
                var IMP = window.IMP;  
                IMP.init('imp67410187'); // 아임포트 가맹점 코드
                IMP.request_pay({
                	pg : 'kakaopay.TC0ONETIME',  //카카오페이로 ㄱ
 				    pay_method : "card", //카드설정 ㄱ
 				    merchant_uid : bookNo,
 				    name : facilityName /*상품명*/,
 				    amount : paidPrice /*상품 가격*/, 
 				    buyer_email : userEmail /*구매자 이메일*/,
 				    buyer_name : userName,
 				    //buyer_tel : contactPhone/*구매자 연락처*/,
 				   // buyer_addr : address.replace(/,_/g," ")/*구매자 주소*/,
 				    //vbank_due : afterThreeDaysStr,
                   
                    m_redirect_url: '/book/bookView' // 결제 완료 후 리다이렉트할 URL을 입력합니다.
                }, function(rsp) {
                    if (rsp.success) {
                        // 결제 성공 시, 서버로 결제 결과를 전송합니다.
                        $("#paidPrice").val(paidPrice);
                        $("#paymentForm").submit(); // 폼데이터 서버로 보내기
                    } else {
                        // 결제 실패 시, 에러 처리를 수행합니다.
                        alert("결제 실패: " + rsp.error_msg);
                    }
                });
            });
        });
       	

          
          //입력 받는 포인트에 따라서 최종 결제금액 출력되는 js
       	document.addEventListener('DOMContentLoaded', function() {
          	document.querySelector('input[type="text"]').addEventListener('keyup', function() {
        	  updatePrice();
          	});
         	document.querySelector('#fakePay').addEventListener('click', function() {
        	   updatePrice();
          	});	  
         	updatePrice();
        	  
	       	function updatePrice(){
	            let totalPoint = Number(document.querySelector("#totalPoint").innerHTML);
	            let bookPrice = Number(document.querySelector("#bookPrice").innerHTML);
	            let pointToUse = Number(document.querySelector('input[type="text"]').value);
	                console.log(totalPoint);
	                console.log(bookPrice);
	                console.log(pointToUse);
	            let priceToPay;   
	            
		            //let pointToUse = document.querySelector('input[type="text"]').value;
	       	    if (!pointToUse || isNaN(pointToUse)) {
	       	        pointToUse = 0;
	       	    }
	       	 	document.querySelector('input[name="pointChange"]').value = pointToUse;
		       	 	
	            if(totalPoint >= pointToUse) {
	              priceToPay = bookPrice - pointToUse;
	              console.log(priceToPay);
	            }else {
	              priceToPay = bookPrice; // 포인트가 부족한 경우에는 가격을 그대로 사용. 유효성검사로 고치자...으...으으... 많이고쳐야함...마이너스절대고쳐
	            }
	            document.querySelector("#priceToPay").innerHTML = priceToPay;
	            document.querySelector("#paidPrice").value = priceToPay;
	       		
	       	}  
	            
          	
       	});
          
  </script>
        
        
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>