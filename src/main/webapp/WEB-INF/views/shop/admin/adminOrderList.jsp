<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 내역 조회</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/adminCss/user.css">
</head>
<body>
    <jsp:include page="../../admin/adminHeader.jsp"></jsp:include>
    <div id="main-box">
    	<c:if test="${oList eq null}">
			<div id="no-one">
				<p>해당 주문이 없음</p>
				<a href="/order/listAdmin">[전체 상품 보기]</a>
			</div>
		</c:if>
        <div id="user-title">
            SPOUTING ORDER LIST
        </div>
        <table id="user-list">
            <tr>
                <th>주문번호</th>
                <th>아이디</th>
                <th>주문자명</th>
                <th>주문일자</th>
                <th>결제가격</th>
            </tr>
            
            <c:set var="num" value="${pi.totalCount - ((pi.currentPage-1) * 10)}"/>
			<c:forEach items="${oList }" var="order" varStatus="i">
				<tr>
					<td>${num}</td>
					<td>${order.userId}</td>
	                <td>${order.orderName}</td>
	                <td>
	                	<fmt:formatDate value="${order.orderDate}" pattern="yyyy.MM.dd  HH:mm" />
	               	</td>
	                <td><fmt:formatNumber value="${order.orderCost}" pattern="#,###"/> 원</td>
	
	                <c:if test="${user.userType != '1'}">
	                    <td><input type="button" id="remo-btn" value="조회" onclick="location.href='/order/detailAdmin?orderNo=${order.orderNo}'"></td>
	                </c:if>
	                <c:if test="${user.userType == '1'}">
	                    <td style="color: rgb(255, 136, 0);">관리자</td>
	                </c:if>      
	                <c:if test="${user.userType != '1'}">
	                    <td><input type="button" id="remo-btn" value="주문취소" onclick="deleteCheck(${order.orderNo});"></td>
	                </c:if>
	                <c:if test="${user.userType == '1'}">
	                    <td style="color: rgb(255, 136, 0);">관리자</td>
	                </c:if>
                </tr>
			<c:set var="num" value="${num-1 }"/>
			</c:forEach>
        </table>
        
        <table id="navi-box">
            <!-- 게시글 페이징 처리 -->
			<tr>
                <td>                  
                    <c:forEach begin="${pi.startNavi}" end="${pi.endNavi}" var="p">
                        <c:url var="pageUrl" value="/order/listAdmin">
                            <c:param name="page" value="${p } "></c:param>
                            <c:param name="searchValue" value="${search.searchValue }"></c:param>
							<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
                        </c:url>
                        <a href="${pageUrl }" class="navi-btn3">${p }</a>&nbsp;
                    </c:forEach>
                </td>
            </tr>
            <!-- 게시글 검색 -->
            <tr>
                <td >
                    <form action="/order/searchAdmin" method="get">
                        <select name="searchCondition" id="search-select">
                            <option value="all">ALL</option>
                            <option value="userId">ID</option>
                            <option value="orderName">NAME</option>
                        </select>
                        <input type="text" id="search-box" name="searchValue" placeholder="검색어를 입력하세요.">
                        <input type="submit" id="search-btn" value="검색">
                    </form>
                </td>                       
            </tr>
        </table>
    </div>

    <script>
	function deleteCheck(orderNo){
		if(confirm("주문을 취소하시겠습니까?")){
			location.href="/order/deleteAdmin?orderNo="+orderNo;
		} 
	}
	</script>
</body>
</html>