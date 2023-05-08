<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 날짜변환용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항</title>
<!-- 		부트스트랩링크 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- 		css링크 -->
	    <link href="../../../resources/css/noticeCss/list.css" rel="stylesheet">
<!-- 	    jQuery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	</head>
	<body>
		<!-- 관리자헤더 -->
		<c:if test="${sessionScope.loginUser.userType eq '1'}">
			<jsp:include page="../admin/adminHeader.jsp"></jsp:include>
		</c:if>
		<!-- 일반회원헤더 -->
		<c:if test="${sessionScope.loginUser.userType eq '0'}">
			<jsp:include page="../common/header.jsp"></jsp:include>
		</c:if>
		<!-- 비회원헤더 -->
		<c:if test="${sessionScope.loginUser.userType eq null}">
			<jsp:include page="../common/header.jsp"></jsp:include>
		</c:if>
		
<!-- 		메인테이블 -->
	    <div id="main">
	    	<div class="mainHeader">
		    	<div class="titleWrap">
					<p>공지사항</p>
					<p>스파우팅의 새로운 소식을 만나보세요!</p>
		    	</div>
	    	</div>
	    	<div class="mainCenter">
			      <table class="table table-hover">
				          <colgroup>
				            <col style="width:10%">
				            <col style="width:50%">
				            <col style="width:15%">
				            <col style="width:15%">
				            <col style="width:10%">
				          </colgroup>
			        <thead>
				          <tr>
				              <th>번호</th>
				              <th>제목</th>
				              <th>작성자</th>
				              <th>작성일</th>
				              <th>조회수</th>
				          </tr>
			        </thead>
			        <tbody class="table-group-divider" style="border-top-color : #1C3879;">
			        	<c:set var="num" value="${pi.totalCount - ((pi.currentPage-1) * 10)}"/>
				        <c:forEach items="${nList }" var="notice" varStatus="i">
				          <tr>
				              <td>${num }</td>
				              <td><a href="detail?noticeNo=${notice.noticeNo }">${notice.noticeTitle }</a></td>
				              <td>${notice.userName }</td>
				              <td><fmt:formatDate value="${notice.nCreateDate }" pattern="yyyy-MM-dd" /></td>
				              <td>${notice.noticeViews }</td>
				          </tr>
				        <c:set var="num" value="${num-1 }"/>
				        </c:forEach>
			        </tbody>
			      </table>
			        <div class="pageWrap">
			        	<div class="pageNation">
			       			<c:if test="${pi.currentPage > 1}">
			       				<a href="/notice/list?page=1" class="first-last-page"><<</a>
			       			</c:if>
<%-- 			       			<c:if test="${pi.currentPage > 1}"> --%>
<%-- 			       				<a href="/notice/list?page=${pi.currentPage - 1}" class="prev-next-page"><</a> --%>
<%-- 			       			</c:if> --%>
			       			<c:forEach begin="${pi.startNavi}" end="${pi.endNavi}" var="page">
			       				<c:url var="pageUrl" value="/notice/list">
			       					<c:param name="page" value="${page}" />
			       				</c:url>
			       				<a href="${pageUrl}" <c:if test="${pi.currentPage == page}"></c:if>>${page}</a>
			       			</c:forEach>
<%-- 			       			<c:if test="${pi.currentPage < pi.maxPage}"> --%>
<%-- 			       				<a href="/notice/list?page=${pi.currentPage + 1}" class="prev-next-page">></a> --%>
<%-- 			       			</c:if> --%>
			       			<c:if test="${pi.currentPage < pi.maxPage}">
			       				<a href="/notice/list?page=${pi.maxPage}" class="first-last-page">>></a>
			       			</c:if>
						</div>
				    </div>
			      <div class="searchWrap">
			      	<form action="/notice/search" method="get">
			      		<select name="searchCondition">
			      			<option value="title" >제목</option>
			      			<option value="content" >내용</option>
			      		</select>
			      		<input type="text" name="searchValue">
			      		<button type="submit" class="btn btn-secondary btn-sm">검색</button>
			      	</form>
			      </div>
			   	  <div class="buttonWrap">
			      	<c:if test="${user.userType eq '1' }">
			      		<button type="button" class="btn btn-primary"onclick="location.href='/notice/write'">공지사항 작성</button>
			      	</c:if>		     
			      </div>
			    </div>
	    </div>
	    
	    <jsp:include page="../common/footer.jsp"></jsp:include>
	    

	    <script type="text/javascript">
	    	console.log(${pi.totalCount})
	    </script>
	</body>
</html>