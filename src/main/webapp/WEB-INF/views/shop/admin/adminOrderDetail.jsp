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
  	<link rel="stylesheet" href="../../../../resources/css/shopCss/table.css">
  	<style>
  		#maincontainer {
			height : 1200px;
		}
		td {
			height : 50px;
			padding : 10px;
		}
  	</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<div id="maincontainer">
		<br><br><br>
		<h1>🛒 주문 상세 조회</h1>
		<p>주문 정보를 확인해 보세요.</p>
		<br><br><br>
		<form action="/order/detailAdmin" method="POST">
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
					<td>
						<c:if test="${order.orderRequest eq  null }">
					 		없음
					 	</c:if>
					 	<c:if test="${order.orderRequest ne  null }">
					 		${order.orderRequest}
					 	</c:if>
					</td>
				</tr>
				<tr>
					<td>주문일자</td>
					<td>
						<fmt:formatDate value="${order.orderDate}" pattern="yyyy.MM.dd" />
					</td>
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
			</table>
			<div id="buttonbox">
				<input class='btn btn-success' type="button" value="주문목록" onclick="location.href='/order/listAdmin'"/>
				<input class="btn" type="button" value="주문취소" onclick="deleteCheck(${order.orderNo});">
			</div>
		</form>
	</div>
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	
	<script>
	function deleteCheck(orderNo){
		if(confirm("주문을 취소하시겠습니까?")){
			location.href="/order/deleteAdmin?orderNo="+orderNo;
		} 
	}
	</script>
</body>
</html>