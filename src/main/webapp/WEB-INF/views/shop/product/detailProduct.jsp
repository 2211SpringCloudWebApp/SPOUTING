<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 상세</title>
	<link rel="stylesheet" href="../../../../resources/css/shopCss/detailProduct.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
	<body>
		<jsp:include page="../../common/header.jsp"></jsp:include>
		<div id="maincontainer">
			<h1>🛒 상품 상세 페이지</h1>
			<p>자세한 상품 정보를 확인해 보세요.</p>
			<br><br><br><br>
			<input type="hidden" id="prouct" name="prouct" value=${product.productNo }>
			<input type="hidden" id="prouct" name="prouct" value=${product.categoryNo }>
			<div id="tablebox">
				<table id="table1">
					<tr>
						<td>
							<img src="/resources/images/product/items/${product.productFilename1}">
						</td>
						<td>
							<table id="table2">
								<tr>
									<td>상품명</td>
									<td>${product.productName }</td>
								</tr>
								<tr>
									<td>상품가격</td>
									<td>${product.productPrice }</td>
								</tr>
								<tr>
									<td>상품설명</td>
									<td>${product.productDescription }</td>
								</tr>
								<tr>
									<td>수량</td>
									<td id="pQty">
									<span id="qtyControl" class="btn-group" role="group">
										<button class="btn" id="downQty" type="button" onclick="if(document.querySelector('#qty').value > 1)document.querySelector('#qty').value--; calTotalPrice();" style="width : 20px;">-</button>
										<input  class="btn" id="qty" type="text" value="1" readonly style="width:30px; text-align:center; background-color : white; color : black;">
										<button class="btn" id="upQty" type="button" onclick="document.querySelector('#qty').value++; calTotalPrice();" style="width : 20px;">+</button>
									</span>
									</td>
								</tr>
								<tr>
									<td>총 상품 금액</td>
									<td id="totalPrice">
										<span>${product.productPrice}</span> 
										<span>원</span>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<div id="buttonbox">
					<button  class="btn" onclick="orderProduct()">주문하기</button>
					<button class="btn" onclick="loginCheck('${sessionScope.loginUser.userId}',function(){addCart('${sessionScope.loginUser.userId }',${product.productNo },document.querySelector('#qty').value)});">장바구니 담기</button>
					<button class="btn btn-wishlist">위시리스트</button>
				</div>
			</div>
			<div id="box1">
				<a href="/shop/catelist2?c=${product.categoryNo }">카테고리로 이동</a>
			</div>
			<div id="box2">
				<img src="/resources/images/product/items/${product.productFilename1}">
				<p>🔖 ${product.productDescription }</p>
				<img id="desimg" src="/resources/images/product/description/${product.productFilename2}">
			</div>
			<div id="box3">
				<h3>상품 정보 제공 고시</h3>
				<p>[전자상거래에 관한 상품정보 제공에 관한 고시] 항목에 의거 등록된 정보입니다.</p>
				
				<table id="table3">
	                        <tr>
	                            <td>상품번호</td>
	                            <td>${product.productNo }</td>
	                        </tr>
	                        <tr>
	                            <td>상품상태</td>
	                            <td>새상품</td>
	                        </tr>
	                        <tr>
	                            <td>부가세 면세여부</td>
	                            <td>과세상품</td>
	                        </tr>
	                        <tr>
	                            <td>영수증발행</td>
	                            <td>발행가능 - 신용카드 전표, 온라인 현금영수증</td>
	                        </tr>
	                        <tr>
	                            <td>사업자구분</td>
	                            <td>사업자 판매자</td>
	                        </tr>
	                        <tr>
	                            <td>브랜드</td>
	                            <td>SPOUTING</td>
	                        </tr>
	                        <tr>
	                            <td>원산지</td>
	                            <td>국내생산</td>
	                        </tr>
	                        <tr>
	                            <td>제품소재</td>
	                            <td>상세정보 직접입력</td>
	                        </tr>
	                        <tr>
	                            <td>색상</td>
	                            <td>상세정보 직접입력</td>
	                        </tr>
	                        <tr>
	                            <td>제조국</td>
	                            <td>국내 생산</td>
	                        </tr>
	                        <tr>
	                            <td>취급시 주의사항</td>
	                            <td>세탁 및 보관에 주의</td>
	                        </tr>
	                        <tr>
	                            <td>주문후 예상 배송기간</td>
	                            <td>주문일로부터 5영업일 이내</td>
	                        </tr>
	                    </table>
	                    <br><br>
	                    <p style="font-size : 15px; line-height : 30px;">
	                        구매, 교환, 반품, 배송, 설치 등과 관련하여 추가비용, 제한조건 등의 특이사항이 있는 경우<br>
	                        소비자가 전자상거래등에서 소비자 보호에 관한 법률 제 17조 제1항 또는 제3항에 따라 청약철회를 하고<br>
	                        동법 제 18조 제1항 에 따라 청약철회한 물품을 판매자에게 반환하였음에도 불구 하고 결제 대금의<br>
	                        환급이 3영업일을 넘게 지연된 경우, 소비자 는 전자상거래등에서 소비자보호에 관한 법률 제18조<br>
	                        제2항 및 동법 시행령 제21조 2에 따라 지연일수에 대하여 전상법 시행령으로 정하는 이율을 곱하여<br>
	                        산정한 지연이자(“지연배상금”)를 신청할 수 있습니다. 자세한 문의는 개별 판매자에게 연락하여 주시기 바랍니다.
	                    </p>
			</div>
		
			<script>
				//로그인 체크
				function loginCheck(loginId,action){
					event.preventDefault();
					if(loginId==""){
						alert("로그인을 해주세요.");
						location.href="/user/login";		
					}else{
						action();
					}
				}
				// 총 가격 계산
				function calTotalPrice(){
				    var totalPriceTag = document.querySelector("#totalPrice");
				    var productPrice = parseFloat('${product.productPrice}'.replace(',', ''));    
				    var qty = parseInt(document.querySelector('#qty').value);
				    var totalPrice = qty * productPrice;
				    console.log(totalPrice);
				    totalPriceTag.innerHTML = "<span> " + totalPrice.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "</span><span id='wonSymbol'>원</span>";
				}
			
				// 바로 결제
				function orderProduct() {
				  var qty = document.querySelector('#qty').value;
				  var productNo = '${product.productNo}';
				  var userId = '${loginUser.userId}';
				  var confirmation = confirm('해당 상품을 구매하시겠습니까?');
				  if (confirmation) {
				    loginCheck(userId, function() {
				      location.href='/detail/orderView?qty=' + qty + '&productNo=' + productNo;
				    });
				  }
				}

				
				//장바구니 추가
				function addCart(userId, productNo, cartQuantity){
					$.ajax({
						url:"/cart/register",
						data:{
							"userId":userId,
							"productNo":productNo,
							"cartQuantity":cartQuantity
						},
						type:"post",
						success:function(result){
							if(result == "success"){
								alert("상품이 장바구니에 추가되었습니다.");
							}else{
								alert("상품이 추가되지 않았습니다.");
							}
						},
						error:function(){}
					});
				}
				
				// 위시리스트 추가 알람창
				$(".btn-wishlist").click(function() {
					alert("상품을 위시리스트에 추가했습니다.");
				});
				
			</script>
	</div>
	
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	</body>
</html>