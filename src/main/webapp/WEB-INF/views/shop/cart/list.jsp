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
	<link rel="stylesheet" href="../../../../resources/css/shopCss/cart.css">
	<style>
		img {height : 50px; }
	</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<div id="maincontainer">
		<h1>🛒 ${sessionScope.loginUser.userId}님의 장바구니</h1>
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
								<div class="col-1">
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
										<input type="hidden" class="productPrice" value="${cart.product.productPrice }">
										<span><fmt:formatNumber value="${cart.product.productPrice }" pattern="#,###"/></span>
										<span>원</span> 
									</div>
								</div>
								<!-- 상품 수량 조절 -->
								<div class="qtyCon btn-group cartQty col-3" role="group" >
									<button class="btn downQty" id="downQty" type="button" data-count="${n.count - 1}" data-product-no="${cart.productNo}">-</button>
									<input class="btn qty" id="qty" type="text" value="${cart.cartQuantity}">
									<button class="btn upQty"  id="upQty"type="button" data-count="${n.count - 1}" data-product-no="${cart.productNo}">+</button>	
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
						</div>
						<hr>
						<div id="cartBtn" style="text-align:center;margin:10px;">
							<button class="shopbtn" onclick="location.href='/shop/productList';">쇼핑계속</button>
							<button class="cartbtn" onclick="if(confirm('선택 상품을 구매하시겠습니까?')&& totalPrice!=0){location.href='/cart/orderView';} else{alert('구매할 상품을 선택해주세요.');}">구매하기</button>
						</div>
					</div>
				</div>
			</div>

	</div>
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	
	<script>
		// 로드와 동시에 수량과 가격이 계산될 수 있도록 하는 코드
		for(var n = 0; n < ${cList.size() }; n++)
			calCartPrice(n, parseFloat(document.querySelectorAll('.productPrice')[n].value));
		
		// 로그인 체크
		function loginCheck(loginId,action){
			event.preventDefault();
			if(loginId==""){
				alert("로그인이 필요합니다.");
				location.href="/user/login";		
			}else{
				location.href="/shop/productList";
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
		
		// 상품 전체 선택
		function allCheck(allCheck){
		    var size = '${cList.size() }';
		    var cartCheck = "";
		    if(allCheck.checked){
		        for(var j = 0; j < size; j++){
		            document.querySelectorAll(".cartCheck")[j].checked = true;
		        }
		        cartCheck = 'Y';
		    } else{
		        for(var j = 0; j < size; j++){
		            document.querySelectorAll(".cartCheck")[j].checked = false;
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

		// 렌더링 시 전체 체크상태 검토, 장바구니 전체 선택이 아닐 시 false
		allCheckCheck();
		function allCheckCheck(){
			var isAllCheck = true;
			for(var j=0; j<${cList.size() }; j++){
				if(document.querySelectorAll(".cartCheck")[j].checked == false){
					isAllCheck = false;
				}
			}
			if(isAllCheck == true){
				document.querySelector("#allCheckbox").checked = true;
			}
		}
		
		// 상품 추가, + 버튼 클릭 이벤트 리스너
		document.querySelectorAll('.upQty').forEach(function(button) {
		  button.addEventListener('click', function() {
		    modifyCartQty(this.dataset.count, this.dataset.productNo, "plus");
		  });
		});

		// 상품 빼기, - 버튼 클릭 이벤트 리스너
		document.querySelectorAll('.downQty').forEach(function(button) {
		  button.addEventListener('click', function() {
		    modifyCartQty(this.dataset.count, this.dataset.productNo, "minus");
		  });
		});
		
		// 장바구니 수량변경 ajax
		function modifyCartQty(n, productNo, type) {
		  var qtyInput = document.querySelectorAll('.qty')[n];
		  var cartQuantity = parseInt(qtyInput.value);

		  if (type === "plus") {
		    cartQuantity++;
		  } else if (type === "minus" && cartQuantity > 1) {
		    cartQuantity--;
		  }
		  qtyInput.value = cartQuantity;
		  var userId = '${sessionScope.loginUser.userId}';

		  $.ajax({
		    url: "/cart/modify",
		    data: {
		      "cartQuantity": cartQuantity,
		      "userId": userId,
		      "productNo": productNo,
		      "isIncrease": (type === "plus") // true if type is "plus", false if "minus"
		    },
		    type: "get",
		    success: function(result) {
		      if (result == "success") {
		        calCartPrice(n, parseFloat(document.querySelectorAll('.productPrice')[n].value)); // 결제하기 전에 먼저 로드시킴
		        calCartTotalPrice();
		      } else {
					alert("상품 수량이 변경되지 않았습니다.");
		      }
		    },
		    error: function() {}
		  });
		}

		// 하나의 상품 가격 계산, 상품 가격 * 상품 수량
		function calCartPrice(n,productPrice){
		  var cartPriceTag = document.querySelectorAll(".cartPrice")[n];
		  var totalPrice = parseInt(document.querySelectorAll('.qty')[n].value) * productPrice;
		  cartPriceTag.innerText = totalPrice.toLocaleString();
		}
		
		// 여러 상품 가격 계산, n은 몇 번째 상품인지를 나타냄
		function calTotalPrice(){
		    var totalPriceTag = document.querySelector("#totalPrice");
		    var productPrice = parseFloat('${product.productPrice}'.replace(',', ''));    
		    var qty = parseInt(document.querySelector('#qty').value);
		    var totalPrice = qty * productPrice;
		    console.log(totalPrice);
		    totalPriceTag.innerHTML = "<span> " + totalPrice.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "</span><span id='wonSymbol'>원</span>";
		}
		
		// 체크된 상품의 총 가격 계산
		var finalCost = 0;
		calCartTotalPrice();
		function calCartTotalPrice(){
			var $totalPrice = document.querySelector("#totalPrice"); // 총 가격
			var $finalCost = document.querySelector("#finalCost"); // 총 결제 금액
			var sumPrice = 0;
			for(let i = 0; i<${cList.size()}; i++){
				if(document.querySelectorAll(".cartCheck")[i].checked){
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
		      }
		    },
		    error: function() {}
		  });
		}

	</script>
</body>
</html>