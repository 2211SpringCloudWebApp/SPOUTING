<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>리뷰 상세</title>
	<link rel="stylesheet" href="../../../../resources/css/shopCss/table.css">
  	<style>
  		#maincontainer {
			height : 1200px;
		}
		td {
			height : 100px;
			padding : 10px;
		}
  	</style>
</head>
<body>
	<jsp:include page="../../admin/adminHeader.jsp"></jsp:include>
	<div id="maincontainer">
		<br><br><br>
		<h1>🔍  리뷰 상세</h1>
		<p>상품 후기를 조회하세요.</p>
		<br><br><br>
		<table>
			<tr>
				<td>번호</td>
				<td>${review.reviewNo }</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${review.userId }</td>
			</tr>
			<tr>
				<td>별점</td>
				<td>${review.reviewGrade } / 5</td>
			</tr>	
			<tr>
				<td>등록일자</td>
				<td><fmt:formatDate value="${review.reviewDate}" pattern="yyyy.MM.dd" /></td>
			</tr>	
			<tr>
				<td>제목</td>
				<td>${review.reviewTitle }</td>
			</tr>	
			<tr>
				<td>내용</td>
				<td>${review.reviewContent }</td>
			</tr>	
			<tr>
				<c:if test="${not empty product.productFilename1}">
				<td>첨부파일</td>
				<td>
					<img id="img-view1" width="200"src="/resources/images/product/items/${product.productFilename1 }" >
				</td>
				</c:if>
			</tr>	
		</table>
	</div>
	<div id="buttonbox">
	  <button class="btn" onclick="location.href='/review/adminList';">리뷰 목록</button>
	  <button class="btn" onclick="removeReview('${review.reviewNo}')">리뷰 삭제</button>
	</div>
	
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	
	<script>
	 function removeReview(reviewNo) {
         if(window.confirm("해당 리뷰를 삭제하시겠습니까?")) {
             location.href = "/review/adminDeleteReview?reviewNo=" + reviewNo;
         }
     }
	</script>
</body>
</html>