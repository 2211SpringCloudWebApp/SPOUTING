<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SPOUTING PRODUCT</title>
	<link rel="stylesheet" href="/resources/css/adminCss/user.css">
	<style>
		#maincontainer {
		    width: 100%;
		    height : 2000px;
		    padding-top : 150px;
		    margin : 0;
		}
		table img {
			width : 50px;
			margin : 0 auto;
			display : flex;
			align-items : center;
			padding : 10px;
		}
		#buttonbox {
			text-align : center;
			height : 100px;
			display : flex;
			align-items : center;
			justify-content : center;
		}
		.btn {
			width : 100px;
			height : 30px;
			background-color : #1C3879;
			border : none;
			margin : 20px;
			color : white;
		}
	</style>
</head>
<body>
	<jsp:include page="../../admin/adminHeader.jsp"></jsp:include>
	
	<div id="main-box">
		<div id="user-title">
            SPOUTING PRODUCT LIST
        </div>
	<div id="buttonbox">
	  <button class="btn" onclick="location.href='/shop/main';">스파우팅 마켓</button>
	  <button class="btn" onclick="location.href='/product/registserView';">상품 등록</button>
	</div>
	<table id="user-list">
		<tr>
			<th>상품번호</th>
			<th>이미지</th>
			<th>상품명</th>
			<th>가격</th>
		</tr>
		
		<c:forEach var="product" items="${pList }">
			<tr>
				<td>${product.productNo }</td>
				<td>
					<img src="/resources/images/product/items/${product.productFilename1}"> 
				</td>
				<td>${product.productName }</td>
				<td>
					<fmt:formatNumber value="${product.productPrice }" pattern="#,###"/> 원
				</td>
				
				<c:if test="${user.userType != '1'}">
                    <td><input type="button" id="remo-btn" value="조회" onclick="location.href='/product/adminDetailProduct?productNo=${product.productNo}'"></td>
                </c:if>
                <c:if test="${user.userType == '1'}">
                    <td style="color: rgb(255, 136, 0);">관리자</td>
                </c:if>      
                <c:if test="${user.userType != '1'}">
                    <td><input type="button" id="remo-btn" value="삭제" onclick="removeCheck(${product.productNo});"></td>
                </c:if>
                <c:if test="${user.userType == '1'}">
                    <td style="color: rgb(255, 136, 0);">관리자</td>
                </c:if>
			</tr>
		</c:forEach>
	</table>	
	
	<table id="navi-box">
            <!-- 게시글 페이징 처리 -->
			<tr>
                <td>                  
                    <c:forEach begin="${pi.startNavi}" end="${pi.endNavi}" var="p">
                        <c:url var="pageUrl" value="/product/adminSearch">
                            <c:param name="page" value="${p } "></c:param>
                            <c:param name="searchValue" value="${search.searchValue }"></c:param>
							<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
                        </c:url>
                        <a href="${pageUrl }" class="navi-btn3">${p }</a>&nbsp;
                    </c:forEach>
                </td>
            </tr>
            <tr>
                <td >
                    <form action="/product/adminSearch" method="get">
						<select name="searchCondition" id="search-select">
								<option value="all">전체</option>
								<option value="no">상품번호</option>
								<option value="title">상품명</option>
								<option value="description">상품설명</option>
							</select>
							<input type="text" id="search-box" name="searchValue" placeholder="검색어를 입력하세요.">
							<input type="submit" id="search-btn" value="검색">
					</form>
                </td>                       
            </tr>
        </table>
	</div>
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	
	<script>
	function removeCheck(productNo) {
		if(confirm("정말 삭제하시겠습니까?")) {
			location.href="/product/remove?productNo=" + productNo;					
		}
	}
	</script>
</body>
</html>