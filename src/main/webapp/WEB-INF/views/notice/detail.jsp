<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 날짜변환용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 디테일</title>
<!-- 		부트스트랩링크 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- 		css링크 -->
		<link href="../../../resources/css/noticeCss/detail.css" rel="stylesheet">
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		
<!-- 		메인테이블 -->
		<div id="main">
			<div class="mainHeader">
				<div class="titleWrap">
					<h1>공지사항</h1>
					<h3>스파우팅의 새로운 소식을 만나보세요!</h3>
				</div>
			</div>
			<div class="mainCenter">
				<table class="table table-borderless">
					<tr>
						<th>제목</th>
						<td>${notice.noticeTitle } </td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${notice.userId }</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td><fmt:formatDate value="${notice.nCreateDate }" pattern="yyyy-MM-dd" /></td>
					</tr>
				</table>
				<div id="content">
					${notice.noticeContent }
				</div>
				<div id="contentImg">
					<img src="/resources/images/notice/${notice.noticeFilerename}" width="400">
				</div>
			</div>
			<div class="mainFooter">
				<div id="buttonTag">
					<c:if test="${user.userType eq 1 }">
						<form action="/notice/modifyView" method="post">
							<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
							<button type="submit">수정</button>
						</form>
						<form action="/notice/delete" method="post">
							<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
							<button type="submit" onclick="deleteBtn()">삭제</button>
						</form>
					</c:if>
					<button type="button" onclick="location.href='/notice/list'">목록</button>
				</div>
			</div>
		</div>
<!-- 		끝 -->

		<jsp:include page="../common/footer.jsp"></jsp:include>
		
		<script>
		  function deleteBtn() {
			    if (confirm("공지사항을 삭제하시겠습니까?")) {
			      document.getElementById('deleteForm').submit();
			    }
			    else {
			      event.preventDefault();
			    }
			  }
		</script>
	</body>
</html>