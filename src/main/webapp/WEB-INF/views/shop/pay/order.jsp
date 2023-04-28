<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문서</title>
	<!-- 카카오 주소 API -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- / 결제 API -->
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	<!-- 스타일 -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/css/shopCss/order.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	<style>
		img {width : 50px; padding : 0; margin : 0;}
	</style>
 </head>
<body>
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<div id="maincontainer">
		<h1>💳 주문서 작성</h1>
		<div class="contents">
			<div class="box-form-left">
				<form id="form1" action="/payment" method="post">
				<div class="space-info">
					<h3>상품 정보</h3>
					<c:forEach items="${cList }" var="cart" varStatus="n" >
						<!-- 넘겨줄 productNo는 히든 값으로 맨 위에 올려서 넘겨줄 수 있도록 하기 -->
						<!-- cart. 이하의 값들은 form 태그 안에서만 사용하도록 하기 -->
						<input type="hidden" name="productNo" value="${cart.product.productNo }">  
						<ul class="list-detail">
							<li>
								<span class="info-photo"><img src="/resources/images/product/items/${cart.product.productFilename1}"></span>
								<span class="pName">${cart.product.productName }</span>
								<span id="cartPrice">
									<fmt:formatNumber value="${cart.product.productPrice}" pattern="#,###"/>
								</span>
								<span class='wonSymbol'>원</span>
								<span> * </span>
								<span class="pQty">
									${cart.cartQuantity }개
								</span>
							</li>
						</ul>
					</c:forEach>
					
					<div class="user-info">
						<div class="info-heading">
							<h3>예약자 정보</h3>
							<h3 class="info-requ">* 필수입력</h3>
						</div>
						
						<div>
							<dl class="flex-box">
								<dt class="flex-tit">
									<label for="name">받으시는 분</label>
									<span class="ico-requ">*</span>
								</dt>
								<dd class="flex">
				                  <input type="text" id="orderName" name="orderName" value="${loginUser.userName }" required="required">
				                </dd>
							</dl>
							<dl class="flex-box">
				                <dt class="flex-tit">
				                  <label for="name">휴대전화</label>
				                  <span class="ico-requ">*</span>
				                </dt>
				                <dd class="flex-phone">
				                  <div class="phone-col">
			                    	<input name="phone1" name="phone1"  id="orderPhone1" title="휴대폰 앞자리" value="010" readonly>
				                  </div>
				                  <span>-</span>
				                  <div class="phone-col">
				                    <input name="phone2" name="phone2" value="${phone2 }" id="orderPhone2"  maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" required="required" title="휴대폰 중간자리" type="tel">
				                  </div>
				                  <span>-</span>
				                  <div class="phone-col">
				                    <input name="phone3" name="phone3" value="${phone3 }" id="orderPhone3" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" required="required" title="휴대폰 뒷자리" type="tel">
				                  </div>
<!-- 								<div class="flex"> -->
<%-- 									<input class="phone-col" type="text" name="orderPhone" value="${order.orderPhone }" id="orderPhone" required="required" placeholder="-를 제외한 숫자만 입력하세요."> --%>
<!-- 								</div> -->
				                </dd>
				              </dl>
				              <dl class="flex-box">
				                <dt class="flex-tit">
				                  <label for="name">이메일</label>
				                  <span class="ico-requ">*</span>
				                </dt>
				                <dd class="flex">
				                  <input type="email" name="orderEmail" value="${user.userEmail }" id="orderEmail" required="required">
				                </dd>
				              </dl>
				              <dl class="flex-box">
				                <dt class="flex-tit">
				                  <label for="name">주소</label>
				                  <span class="ico-requ">*</span>
				                </dt>
				                <dd class="flex-addr">
				                  <input type="text" name="orderPostcode" id="orderPostcode" placeholder="우편번호" readonly="readonly" required="required">
				                  <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
				                  <input type="text" class="flex-addr-col" name="orderRoadaddr" id="orderRoadaddr" placeholder="도로명주소" readonly="readonly" required="required"><br>
				                  <input type="text" class="flex-addr-col" name="orderDetailaddr" id="orderDetailaddr" placeholder="상세주소" required="required">
				                  <input type="hidden" id="jibunAddress">
								  <input type="hidden" id="extraAddress">
				                </dd>
				              </dl>
				              <dl class="flex-box">
				                <dt class="flex-tit">
				                  <label for="name">배송 요청사항</label>
				                </dt>
				                <dd class="flex">
				                  <textarea name="orderRequest" id="orderRequest" cols="73" rows="7" placeholder="쇼핑몰이 아닌 배송 기사님께 보여지는 메시지 입니다."></textarea>
				                </dd>
				              </dl>
						</div>
						
						<div class="info-notice">
							<h3>주문 시 주의사항</h3>
							<ul>
								<li>결제를 하면 쇼핑몰 이용약관, 개인정보 수집 및 이용 동의에 모두 동의하는 것으로 간주합니다.</li>
								<li>결제 버튼을 누르면 결제 정보를 확인하고, 구매 진행에 동의한 것으로 간주합니다.</li>
								<li>본 약관에 동의하지 않으실 경우 상품 주문을 할 수 없습니다.</li>
								<li>결제 후 주문내역 조회는 마이페이지 내에서 하실 수 있으며.</li>
								<li>배송 상태가 [상품준비중] 일 경우에만 주문 취소가 가능합니다.</li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="box-form-right">
		          <div class="info-pay">
		            <h3>결제 예정 금액</h3>
		            <ul>
		              <li>
		                <span class="info-pay-col1">상품금액</span>
		                <span class="info-pay-col2">
		               	 <span class="cartPrice">
							<fmt:formatNumber value="${sum }" pattern="#,###"/> 
						 </span>
						 <span class='wonSymbol'>원</span>
		                </span>
		              </li>
		              <li>
		                <span class="info-pay-col1">배송비</span>
		                <span class="info-pay-col2">
	          				0원<br><br>
	          				<span class="ico-requ">* 스파우터는 전 제품 무료배송 !</span>
		                </span>
		              </li>
		              <li id="pay-result">
		                <span id="pay-result-right"></span>
		                <span id="pay-result-left">원</span>
		              </li>
		            </ul>
		            <input type="button" id="payment" value="결제" onclick="iamport()">
		          </div>
				</div>
				
				<input type="hidden" name="userId" value="${sessionScope.loginUser.userId }">
				<button type="submit" id="submit"></button>
      
			</form>
			</div>
		</div>
	</div>
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	
	<script>
	// 도로명 주소
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('orderPostcode').value = data.zonecode;
                document.getElementById("orderRoadaddr").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }
            }
        }).open();
    }
	
	//  포트원 결제 (kg 이니시스 사용)
	function iamport() { 
		// 변수 선언
		var orderEmail = document.querySelector("#orderEmail").value
		var orderName = document.querySelector("#orderName").value
		var orderPhone1 = document.querySelector("#orderPhone1").value;
		var orderPhone2 = document.querySelector("#orderPhone2").value;
		var orderPhone3 = document.querySelector("#orderPhone3").value;
		var orderPhone = orderPhone1 + orderPhone2 + orderPhone3;

// 		var orderPhone = document.querySelector("#orderPhone").value
		
  		// 결제 실행
		var IMP = window.IMP; 				// 생략 가능
  		IMP.init("imp05245083"); 			// 가맹점 식별코드, 예: imp00000000a
  	    IMP.request_pay({
  	      pg: "html5_inicis.INIpayTest",	// 상점 아이디, 결제테스트용은 html5_inicis.INIpayTest 
  	      pay_method: "card",
  	      name: "SPOUTING MARKET 상품",  		// 결제창에서 보여질 이름
		  amount: 10,            			// 실제 결제 금액
  	      buyer_email: orderEmail,
  	      buyer_name: orderName,	
  	      buyer_tel: orderPhone,	
  	      buyer_addr: "서울시 중구 명동10길 29",
  	      buyer_postcode: "01181"
  	    }, function (rsp) { // callback
  	      console.log(rsp);
  	      // 결제 검증
		  $.ajax({
		   	type : "POST",
		   	url : "/verifyIamport/" + rsp.imp_uid 
		   }).done(function(data) {
		   	
		   	console.log(data);
		   	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
		   	if(rsp.paid_amount == data.response.amount){
		    	console.log("결제 및 결제검증완료");
		    	document.querySelector("#submit").click();
		   	} else {
		   		console.log("결제 실패");
		   	}
		   });
  	    });
  	  }
  		
	</script>
</body>
</html>