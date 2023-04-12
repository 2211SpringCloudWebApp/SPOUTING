<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 디테일</title>
<!-- 		부트스트랩링크 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<style>
			table{
				border-top: 1px solid black;
				border-bottom: 1px solid black;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		
<!-- 		메인테이블 -->
		<div id="main">
			<h1>공지사항</h1>
			<h3>스파우팅의 새로운 소식을 만나보세요!</h3>
			<table class="table table-borderless">
				<tr>
					<th>제목</th>
					<td>${notice.noticeTitle } </td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${notice.userNo }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${notice.nCreateDate } </td>
				</tr>
			</table>
			${notice.noticeContent }
		</div>
		<div id="buttonTag">
			<c:if test="${user.userType eq 1 }">
				<button>수정</button>
				<button>삭제</button>
			</c:if>
			<button type="button" onclick="location.href='/notice/list'">목록</button>
		</div>
<!-- 		끝 -->

		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>