<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 상세</title>
	<style>
		@font-face {
		    font-family: 'Pretendard-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
		    font-weight: 400;
		    font-style: normal;
		}
		
		* {
		    font-family: 'Pretendard-Regular'; 
		    box-sizing: border-box;
		}
		#nav {
		  float: left;
		  width: 200px;
		  height : 50vh;
		}
		#maincontainer {
		    width: 100%;
		    height : 2900px;
		    padding-top : 150px;
		}
		h1, h2, h3, p, a {
			text-align : center;
		}
		img{
			height : 400px;
		}
		#desimg {
			height : 40%;
		}
		#tablebox {
			height : 500px;
			width : 100%;
		}
		#box1 {
			height : 50px;
			text-align : center;
			margin : 0 auto;
		}
		a:visited {
			color : gray; 
		}
		#box2 {
			height : 1000px;
			margin : 0 auto;
			text-align : center;
			line-height : 100px;
		}		
		#box3 {
			height : 900px;
			line-height : 50px;
		}
		table {
			width : 80%;
			border-collapse : collapse;
			text-align : center;
			border-top : 1px solid #ccc;
			border-bottom : 1px solid #ccc;
			border-left : 3px solid #1C3879;
			margin : 0 auto;
		}
		#table1 {
			border : 0;
		}
		#table2 {
			margin : 0;
			padding : 0;
		}
		#table1 tr { width : 40%;}
		
		#table2 td {
		margin : 0;
		padding : 0;
		height : 60px;
		border-bottom : 1px solid #ccc;
		}
		#table3 {
		 	width : 60%;
		 	height : 500px;
		}
		#table3 td{
			margin : 0;
			padding : 0;
			height : 5px;
			border-bottom : 1px solid #ccc;
		}
		table td {
			width : 20%;
		}
		table tr {
			width : 80%;
		}
		select {
			width : 90px;
		}
	</style>
</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
	
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
								<td>
									<form method="post" action="/shop/cart/insert">
										<input type="hidden" name="productNo" value=${product.productNo }>
										<select name="amount">
											<c:forEach begin="1" end="5" var="i">
												<option value="${i}">${i}</option>
											</c:forEach>
										</select>
									</form>
								</td>
							</tr>
							<tr>
							    <td>옵션</td>
							    <td>
							        <c:if test="${product.categoryNo == 1 }">
							            <select>
							                <option value="S">S</option>
							                <option value="M">M</option>
							                <option value="L">L</option>
							            </select>
							        </c:if>
							        <c:if test="${product.categoryNo == 2 }">
							            <select>
							                <option value="W">화이트</option>
							                <option value="B">블랙</option>
							            </select>
							        </c:if>
							    </td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
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
		
	</div>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>