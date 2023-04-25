<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Cart</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
	<link rel="stylesheet" href="../../../resources/css/shopCss/cart.css">
	<style>
		img {height : 50px; }
	</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div id="maincontainer">
		<h1>🛒 ${sessionScope.loginUser.userId}님 장바구니</h1>
		<p>스파우팅 마켓은 전 상품 무료 배송 !</p>
		<div id="contents" class="row">
				<div class="contents col">
					<div id="inner-header">
						<span>장바구니(${cList.size() })</span>
					</div>
					<div class="col-10">
						전체선택 <input id="allCheckbox" type="checkbox" onchange="allCheck(this);">
					</div>
					<div class="col-11" >
						<c:forEach items="${cList }" var="cart" varStatus="n" >
							<div class="oneCart row m-auto" >
								<!-- 체크박스 -->
								<div class="cartCheck col-1">
									<input  class="cartCheck" type="checkbox" name="cartCheck" onchange="cartCheck(this,'${sessionScope.loginUser.userId }',${cart.productNo });" <c:if test="${cart.cartCheck eq 'Y'}">checked</c:if>>
								</div>
								<!-- 상품 썸네일 -->
								<div class="pImg col-1">
									<img class="cartImg" src="/resources/images/product/items/${cart.product.productFilename1}" onclick="location.href='/product/detail?productNo=${cart.product.productNo}';" >
								</div>
								<div class="pName cartInfo col-3">
									<!-- 상품명 -->
									<div>
										<span class="pName">${cart.product.productName }</span>
									</div>
									<!-- 상품 가격 -->
									<div>
										<span class="pName"><fmt:formatNumber value="${cart.product.productPrice }" pattern="#,###"/></span>
										<span>원</span> 
									</div>
								</div>
								<!-- 상품 수량 조절 -->
								<div class="qtyCon btn-group cartQty col-3" role="group">
									<button class="btn downQty" type="button" onclick="if(document.querySelectorAll('.qty')[${n.count-1}].value > 1)document.querySelectorAll('.qty')[${n.count-1}].value--; calCartPrice(${n.count-1},'${cart.product.productPrice }');modifyCartQty(${n.count-1 },${cart.productNo });calCartTotalPrice();">-</button>
									<input class="btn qty" type="text" value="${cart.cartQuantity }" readonly>
									<button class="btn upQty" type="button" onclick="document.querySelectorAll('.qty')[${n.count-1}].value++; calCartPrice(${n.count-1},${cart.product.productPrice });modifyCartQty(${n.count-1 },${cart.productNo });calCartTotalPrice();">+</button>
								</div>
								<!-- 상품가격 * 수량 -->
								<div class="cartPrice-wrap col-2">
								    <span class="cartPrice"></span>
								    <span class='wonSymbol'>원</span>

								</div>
								<div class="col-1">
									<!-- 삭제버튼 -->
									<button type="button" onclick="removeCart(${cart.productNo},'${sessionScope.loginUser.userId }');">X</button>
								</div>
							</div>
						</c:forEach>
						<hr>
						<!-- 장바구니토탈가격 -->
						<div id="totalPrice-wrap" class="row">
							<div class="col">
								<div>총 상품 금액</div> 
								<span id="totalPrice"></span>
								<span class='wonSymbol'>원</span>
							</div>
							<div class="col">
								<div>총 결제 금액</div> 
								<span id="finalCost">
								</span>
								<span class='wonSymbol'>원</span>
							</div>
						</div>
						<hr>
						<div id="cartBtn" style="text-align:center;margin:10px;">
							<button class="cartbtn" onclick="location.href='/shop/productList';">쇼핑계속</button>
							<button class="cartbtn" onclick="if(confirm('선택 상품을 구매하시겠습니까?')&&finalCost!=0){location.href='/cart/orderView';}else{alert('구매할 상품을 선택해주세요.');}">구매하기</button>
						</div>
					</div>
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
		
		// 장바구니 상품 체크 여부
		function cartCheck(checkBtn,userId,productNo){
			var cartCheck = "";
			if(checkBtn.checked){
				cartCheck = "Y";
			}else{
				cartCheck = "N";
			}
			$.ajax({
				url:"/cart/modifyCheck",
				data:{
					"cartCheck":cartCheck,
					"userId":userId,
					"productNo":productNo
					
				},
				type:"get",
				success:function(result){
					if(result == "success"){
						calCartTotalPrice();
					}else{
					}
				},
				error:function(){}
			});
		}
		
		
		//전체체크
		function allCheck(allCheck){
			var size = '${cList.size() }';
			var cartCheck = "";
		 	if(allCheck.checked){
		 		for(var j=0; j<size; j++){
			 		document.querySelectorAll(".cartCheck")[2*j+1].checked = true;
		 		}
		 		cartCheck = 'Y';
		 	}else{
		 		for(var j=0; j<size; j++){
			 		document.querySelectorAll(".cartCheck")[2*j+1].checked = false;
		 		}
		 		cartCheck = 'N';
		 	}
		 	$.ajax({
		 		url:"/cart/modifyAllCheck",
		 		data:{
					"cartCheck":cartCheck,
					"userId":'${sessionScope.loginUser.userId}',
		 		},
		 		type:"get",
				success:function(result){
					if(result == "success"){
						calCartTotalPrice();
					}else{
					}
				},
		 		error:function(){}
		 	});
		}
		
		// 렌더링 시 전체 체크상태 검토
		allCheckCheck();
		function allCheckCheck(){
			var isAllCheck = true;
			for(var j=0; j<'${cList.size() }'; j++){
				if(document.querySelectorAll(".cartCheck")[2*j+1].checked == false){
					isAllCheck = false;
				}
			}
			if(isAllCheck == true){
				document.querySelector("#allCheckbox").checked = true;
			}
		}
		
		// 장바구니 수량변경 ajax
		function modifyCartQty(n,productNo){
			var cartQuantity = document.querySelectorAll(".qty")[n].value;
			var userId = '${sessionScope.loginUser.userId}';
			$.ajax({
				url:"/cart/modify",
				data:{
					"cartQuantity":cartQuantity,
					"userId":userId,
					"productNo":productNo
				},
				type:"get",
				success:function(result){
					if(result == "success"){
						calCartTotalPrice();
					}else{
					}
				},
				error:function(){}
			});
		}
		
		// 가격 계산
		function calCartPrice(n,productPrice){
			var cartPriceTag = document.querySelectorAll(".cartPrice")[n];
			var totalPrice = document.querySelectorAll('.qty')[n].value * productPrice;
			cartPriceTag.innerText = totalPrice.toLocaleString();
		}
		
		// 상품별 가격 계산
		function calTotalPrice(){
		    var totalPriceTag = document.querySelector("#totalPrice");
		    var productPrice = parseFloat('${product.productPrice}'.replace(',', ''));    
		    var qty = parseInt(document.querySelector('#qty').value);
		    var totalPrice = qty * productPrice;
		    console.log(totalPrice);
		    totalPriceTag.innerHTML = "<span> " + totalPrice.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "</span><span id='wonSymbol'>원</span>";
		}
		
		// 장바구니 총 가격 계산
		var finalCost = 0;
		calCartTotalPrice();
		function calCartTotalPrice(){
			var $totalPrice = document.querySelector("#totalPrice");
			var $finalCost = document.querySelector("#finalCost");
			var sumPrice = 0;
			for(var i = 0; i<'${cList.size()}'; i++){
				if(document.querySelectorAll(".cartCheck")[2*i+1].checked){
					var temp = document.querySelectorAll(".cartPrice")[i].innerHTML.replace(/,/g,"");
					sumPrice += Number(temp);
				}
			}
		$totalPrice.innerText = sumPrice.toLocaleString();
		}
		
		// 장바구니 삭제
		function removeCart(productNo, userId) {
		  $.ajax({
		    url: "/cart/remove",
		    data: {
		      "productNo": productNo,
		      "userId": userId
		    },
		    type: "get",
		    success: function(result) {
		      if (result == "success") {
		        calCartTotalPrice();
		        alert("상품이 삭제되었습니다."); 
		      } else {
		    	alert("상품이 삭제되지 않았습니다,");
		      }
		    },
		    error: function() {}
		  });
		}

		
		
		
	</script>
</body>
</html>