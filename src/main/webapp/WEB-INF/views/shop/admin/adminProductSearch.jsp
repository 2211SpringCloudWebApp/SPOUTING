<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SPOUTING PRODUCT</title>
	<link rel="stylesheet" href="../../../../../resources/css/shopCss/shop.css">
	<style>
		#nav {
		  float: left;
		  width: 200px;
		  height : 50vh;
		}
	</style>
</head>
<body>
	<jsp:include page="../../admin/adminHeader.jsp"></jsp:include>
	<div id="nav">
		<jsp:include page="../../shop/product/menu.jsp"></jsp:include>
	</div>
	<div id="maincontainer">
	<h1 style="color:#1C3879">SPOUTING'S ALL PRODUCT</h1>
	<p>스파우팅 마켓의 모든 제품을 한 눈에 !</p>
	<br><br><br><br>
	<table>
		<c:if test="${sList eq null}">
			<div id="no-one">
				<p>해당 회원이 없음</p>
				<a href="/admin/user">[전체 회원 보기]</a>
			</div>
		</c:if>
		
		<c:if test="${sList ne null}">
			<thead>
				<tr>
					<th scope="row">상품번호</th>
					<th scope="row">이미지</th>
					<th scope="row">상품명</th>
					<th scope="row">가격</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${sList }">
					<tr>
						<td>${row.productNo }</td>
						<td>
							<a href="/product/adminDetailProduct?productNo=${row.productNo}">
								<img src="/resources/images/product/items/${row.productFilename1}">
							</a>
						</td>
						<td>${row.productName }</td>
						<td>${row.productPrice }</td>
					</tr>
				</c:forEach>
			</tbody>
		</c:if>
	</table>	
	
	 <table id="navi-box">
	 	<!-- 페이징 처리 -->
   		<tr>
             <td>
                 <c:if test="${pi.currentPage ne 1}">
                     <a href="/admin/adminSearch?page=1" id="navi-btn1"> ≪ </a>
                 </c:if>
                 <c:if test="${pi.currentPage ne 1}">
                     <a href="/admin/adminSearch?page=${pi.currentPage-1}" id="navi-btn2"> ＜ </a>
                 </c:if>
                 
                 <c:forEach begin="${pi.startNavi}" end="${pi.endNavi}" var="p">
                     <c:url var="pageUrl" value="/admin/adminSearch">
                         <c:param name="page" value="${p }"></c:param>
                         <c:param name="searchValue" value="${search.searchValue }"></c:param>
						 <c:param name="searchCondition" value="${search.searchCondition }"></c:param>
                     </c:url>
                     <a href="${pageUrl }" class="navi-btn3">${p }</a>&nbsp;
                 </c:forEach>

                 <c:if test="${pi.currentPage + 1 <= pi.maxPage}">
                     <a href="/admin/adminSearch?page=${pi.currentPage+1}" id="navi-btn4"> ＞ </a>
                 </c:if> 
                 <c:if test="${pi.currentPage + 1 <= pi.maxPage}">
                     <a href="/admin/adminSearch?page=${pi.maxPage}" id="navi-btn5"> ≫ </a>
                 </c:if>
             </td>
         </tr>  
         <!-- 조건부 검색 -->
         <tr>
             <td >
                 <form action="/admin/adminSearch" method="get">
                     <select name="searchCondition" id="search-select">
                     	<option value="all" <c:if test="${search.searchCondition == 'all' }">selected</c:if>>전체</option>
                        <option value="no" <c:if test="${search.searchCondition == 'no' }">selected</c:if>>상품번호</option>
						<option value="title" <c:if test="${search.searchCondition == 'title' }">selected</c:if>>상품명</option>
						<option value="description" <c:if test="${search.searchCondition == 'description' }">selected</c:if>>상품설명</option>
                     </select>
                     <input type="text" id="search-box" name="searchValue" value="${search.searchValue}">
                     <input type="submit" id="search-btn" value="검색">
                 </form>
             </td>                       
         </tr>
     </table>
	
	</div>
	<jsp:include page="../..//common/footer.jsp"></jsp:include>
</body>
</html>