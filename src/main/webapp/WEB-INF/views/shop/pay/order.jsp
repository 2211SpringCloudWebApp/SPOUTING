<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문서</title>
	<!-- / 카카오 주소 API -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- / 결제 API -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
 </head>
<body>
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<div id="maincontainer">
		<h1>💳 주문서 작성</h1>
		<div class="contents">
			<div class="box-form-left">
				<h3>상품 정보</h3>
				<div class="space-info">
					<c:forEach items="${cList }" var="cart" varStatus="n" >
						<ul class="list-detail">
							<li>
								<span class="tit"><img src="/resources/images/product/items/${cart.productFilename1}"></span>
								<span class="pName">${cart.product.productName }</span>
								<span id="cartPrice">
									<fmt:formatNumber value="${productPrice}" pattern="#,###"/>
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
				                    <input name="phone1" name="Phone1"  id="orderPhone1" title="휴대폰 앞자리" value="010" readonly>
				                  </div>
				                  <span>-</span>
				                  <div class="phone-col">
				                    <input name="phone2" name="Phone2" value="${phone2 }" id="orderPhone2"  maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" required="required" title="휴대폰 중간자리" type="tel">
				                  </div>
				                  <span>-</span>
				                  <div class="phone-col">
				                    <input name="phone3" name="Phone3" value="${phone3 }" id="orderPhone3" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" required="required" title="휴대폰 뒷자리" type="tel">
				                  </div>
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
					                <select id="orderRequest" name="orderRequest"> 
										<option value="" selected disabled style="display:none;">메시지를 선택해주세요.</option>
										<option value="안전하게 와주세요.">안전하게 와주세요.</option>
										<option value="배송전에 연락주세요.">배송전에 연락주세요.</option>
										<option value="집 앞에 놓아주세요.">집 앞에 놓아주세요.</option>
									</select>
<!-- 			                  <textarea name="orderRequest" id="orderRequest" cols="73" rows="7"></textarea> -->
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
								<li>
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
							<fmt:formatNumber value="${cart.product.productPrice * cart.productAmount }" pattern="#,###"/> 
						 </span>
						 <span class='wonSymbol'>원</span>
		                </span>
		              </li>
		              <li>
		                <span class="info-pay-col1">배송비</span>
		                <span class="info-pay-col2">
	          				0원
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
			</div>
		</div>
	</div>
	<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>