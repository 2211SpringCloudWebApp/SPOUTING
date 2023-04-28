<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문 내역 상세</title>
	<!-- jquery -->
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<div id="maincontainer">
		<h1>🛒 주문 상세 조회</h1>
		<p>주문 정보를 확인해 보세요.</p>
		<br><br><br><br>
		<form action="/order/detail" method="POST">
			<table>
				<tr>
					<td>주문번호</td>
					<td>${order.orderNo }</td>
				</tr>
				<tr>
					<td>주문자명</td>
					<td>${order.orderName }</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>${order.orderPhone }</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${order.orderEmail }</td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td>${order.orderPostcode }</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>${order.orderRoadaddr }</td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td>${order.orderDetailaddr }</td>
				</tr>
				<tr>
					<td>배송 요청사항</td>
					<td>${order.orderRequest }</td>
				</tr>
				<tr>
					<td>주문일자</td>
					<td>${order.orderDate }</td>
				</tr>
				<tr>
					<td>배송상태</td>
					<td>
					 	<c:if test="${order.orderState ==  '1' }">
					 		배송준비중
					 	</c:if>
					 	<c:if test="${order.orderState == '0' }">
					 		결제대기
					 	</c:if>
					</td>
				</tr>
				<tr>
					<td>결제금액</td>
					<td>${order.orderCost }</td>
				</tr>
				<tr>
					<td>
						<input type="button" value="예약취소" onclick="/order/delete">
						<input type="button" value="쇼핑몰" onclick="/shop/productList">
						<input type="button" value="예약내역" onclick="location.href='/order/list'" class='btn btn-success'/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	
	<script type="text/javascript">
	function deleteCheck(orderNo){
		if(confirm("주문을 취소하시겠습니까?")){
			location.href="/order/delete?orderNo="+orderNo;
		} 
	}
	</script>
</body>
</html>