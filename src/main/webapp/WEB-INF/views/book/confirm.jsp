<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>예 약 확 인</title>
		<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- ajax CDN -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <!-- jquery CDN -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- fullcalendar CDN -->
        <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
        <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
        <!-- fullcalendar 언어 CDN -->
        <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
        <!-- 포트원(결제api)라이브러리 -->
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
            <form action ="/book/bookUp" method="post">         
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
	                <td>${book.useDate }</td>
	              </tr>
	              <tr>
	                <td>이용시간</td>
	                <td>${book.startTime }~${book.endTime }</td>
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
	                <td><input type="text" name="pointChange" ></td>
	              </tr>
	              <tr>
	                <td>결제금액</td>
	                <td id="priceToPay"></td>
	              </tr>
	              <tr>
	                <td></td>
	                <td><button>가짜결제갈겨</button></td>
	               
	                <!-- <td><button onclick="requestPay()">결제갈겨:포트원 이걸로 바꿔야함</button></td> -->
	              </tr>
	            </table>
            <!--    -업데이트(페이시간, 남은포인트(원래남은포인트-입력한포인트).
            		-포인트상세테이블에 인서트
            	"수정내역이 있다면 뒤로가기눌러주셈"   -->
            <!--            -api쓰기    -->
            </form>
          </div>
           
       	</main>
       	
       	<script>
          document.querySelector('input[type="text"]').addEventListener('keyup', function() {
            let totalPoint = Number(document.querySelector("#totalPoint").innerHTML);
            let bookPrice = Number(document.querySelector("#bookPrice").innerHTML);
            let pointToUse = Number(document.querySelector('input[type="text"]').value);
                console.log(totalPoint);
                console.log(bookPrice);
                console.log(pointToUse);
            let priceToPay;    
            if(totalPoint >= pointToUse) {
              priceToPay = bookPrice - pointToUse;
              console.log(priceToPay);
            }else {
              priceToPay = bookPrice; // 포인트가 부족한 경우에는 가격을 그대로 사용. 유효성검사로 고치자...나중에...
            }
            document.querySelector("#priceToPay").innerHTML = priceToPay;
          });
          
          
//           //결제시도!!!
//           var IMP = window.IMP;  
//           IMP.agency('가맹점 식별코드', 'imp67410187');  //  Tier Code
//           function requestPay() {
//         	    IMP.request_pay({
//         	      pg: "kcp.{상점ID}",
//         	      pay_method: "card",
//         	      merchant_uid: "ORD20180131-0000011",   // 주문번호: bookNo
//         	      name: "노르웨이 회전 의자",			//시설명
//         	      //amount: 64900,                         // 숫자 타입 //양
//         	      buyer_email: "gildong@gmail.com",
//         	      buyer_name: "홍길동",
//         	      //buyer_tel: "010-4242-4242",
//         	      //buyer_addr: "서울특별시 강남구 신사동",
//         	      //buyer_postcode: "01181"
//         	    }, function (rsp) { // callback
//         	      if (rsp.success) {
//         	        // 결제 성공 시 로직
//         	    	  console.log(rsp);
//         	      } else {
//         	        // 결제 실패 시 로직
//         	    	  console.log(rsp);
//         	      }
//         	    });
//         	  }
          
          
          
        </script>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>