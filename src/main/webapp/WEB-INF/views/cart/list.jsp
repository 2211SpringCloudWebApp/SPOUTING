<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Cart</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div id="maincontainer">
		<h1>🛒 장바구니</h1>
		<p>담은 상품을 결제해 보세요.</p>
		<div>
			<span>장바구니 (${cList.size() })</span>
		</div>
		<div>
			<p>⚠️50,000원 이상 구매 시 무료 배송</p>
			<table border="1">
				<tr>
					<th><input class="cartCheck" type="checkbox" onchange="allCheck(this);"></th>
					<th>이미지</th>
					<th>상품명</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
				</tr>	
				<tr>
					<td><input type="checkbox"></td>
					<td>
						<a href=""><img src="/resources/images/product/items/${cart.product.productFilename1}"></a>
					</td>
					<td>${cart.product.productName }</td>
					<td>${cart.product.productPrice } 원</td>
					<td>
						<button class="btn" id="downQty" type="button" onclick="if(document.querySelector('#qty').value > 1)document.querySelector('#qty').value--; calTotalPrice();" style="width : 20px;">-</button>
						<input  class="btn" id="qty" type="text" value="1" readonly style="width:30px; text-align:center; background-color : white; color : black;">
						<button class="btn" id="upQty" type="button" onclick="document.querySelector('#qty').value++; calTotalPrice();" style="width : 20px;">+</button>
					</td>
					<td>${cart.product.productPrice} 원</td>
					<td><button type="button" onclick="removeCart(${cart.productNo},'${sessionScope.loginUser.userId}');">X</button></td>
				</tr>
				<tr>
					<td colspan="2">상품 금액</td>
					<td colspan="4">
						<span id="totalPrice"></span>
						<span>원</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">배송비</td>
					<td colspan="4">
						<span id="deliverFee"></span>
						<span>원</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">결제 예정 금액</td>
					<td colspan="4">
						<span id="finalCost"></span>
						<span>원</span>
					</td>
				</tr>
			</table>
			<div id="buttonbox">
					<button class="cartbtn" onclick="location.href='/shop/productList';">쇼핑 계속하기</button>
					<button class="cartbtn" onclick="if(confirm('선택 상품을 구매하시겠습니까?')&&finalCost!=0){location.href='/cart/orderView';}else{alert('구매할 상품을 선택해주세요.');}">결제하기</button>
				</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
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
	</script>
</body>
</html>