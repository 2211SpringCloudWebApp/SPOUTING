<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 상세</title>
	<link rel="stylesheet" href="../../../../resources/css/shopCss/table.css">
	<style>
		#maincontainer {
			height : 1000px;
		}
	</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<div id="maincontainer">
		<br><br><br>
		<h1>🔍 ️리뷰 상세</h1>
		<p>스파우터 회원들이 남긴 리뷰를 확인해 보세요.</p>
		<br><br><br>
		<table>
			<tr>
				<td>제목</td>
				<td>${review.reviewTitle }</td>
			</tr>
			<tr>
				<td>작성일자</td>
				<td>${review.reviewDate }</td>
			</tr>	
			<tr>
				<td>별점</td>
				<td>${review.reviewGrade } / 5</td>
			</tr>	
			<tr>
				<td>후기</td>
				<td>${review.reviewContent }</td>
			</tr>	
			<c:if test="${not empty review.reviewFilename}">
			<tr>
				<td>첨부파일</td>
				<td>
						첨부파일 : ${review.reviewFilename }<br>
						<img id="img-view1" width="200"src="../../../resources/images/review/${review.reviewFilename }" >
				</td>
			</tr>	
			</c:if>
		</table>
	</div>
	<div id="buttonbox">
	  	<button class="btn" onclick="location.href='/review/reviewList';">후기 목록</button>
	  	<c:if test="${review.userId eq loginUser.userId}">
		    <button class="btn" onclick="location.href='/review/modifyView?reviewNo=${review.reviewNo}';">후기 수정</button>
		</c:if>
		<c:if test="${review.userId eq loginUser.userId}">
		   <button class="btn" onclick="removeCheck(${review.reviewNo});">후기 삭제</button>
		</c:if>
	</div>
  	
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	
	<script>
		// 리뷰 삭제
		function removeCheck(reviewNo) {
			if(confirm("정말 삭제하시겠습니까?")) {
				location.href="/review/remove?reviewNo=" + reviewNo;					
			}
		}
	</script>
</body>
</html>