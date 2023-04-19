<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 날짜변환용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>문의사항</title>
<!-- 		부트스트랩링크 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- 		css링크 -->
	    <link href="../../../resources/css/noticeCss/list.css" rel="stylesheet">
<!-- 	    jQuery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- 		마우스커서 -->
		<style type="text/css">
			body{ cursor:url("../../../resources/images/notice/cursor.png"), auto;}
		</style>
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		
<!-- 		메인테이블 -->
	    <div id="main">
	    	<div class="mainHeaderI">
		    	<div class="titleWrap">
					<p>문의사항</p>
					<p>궁금한 사항을 문의해주세요!</p>
		    	</div>
	    	</div>
	    	<div class="mainCenter">
			      <table class="table table-hover">
				          <colgroup>
				            <col style="width:5%">
				            <col style="width:15%">
				            <col style="width:5%">
				            <col style="width:55%">
				            <col style="width:10%">
				            <col style="width:10%">
				          </colgroup>
			        <thead>
				          <tr>
				              <th style="background-color:red;">번호</th>
				              <th style="background-color:yellow;">카테고리</th>
				              <th style="background-color:yellowgreen;">비밀</th>
				              <th style="background-color:skyblue;">제목</th>
				              <th style="background-color:navy;">작성자</th>
				              <th style="background-color:purple;">작성일</th>
				          </tr>
			        </thead>
			        <tbody class="table-group-divider" style="border-top-color : #1C3879;">
			        	<c:set var="num" value="${pi.totalCount - ((pi.currentPage-1) * 10)}"/>
				        <c:forEach items="${iList }" var="inquiry" varStatus="i">
				          <tr>
				              <td>${num }</td>
				              <c:if test="${inquiry.inquiriesCategory eq 'N'}">
					              <td>일반문의</td>
				              </c:if>
				              <c:if test="${inquiry.inquiriesCategory eq 'M'}">
					              <td>MD관련문의</td>
				              </c:if>
				              <c:if test="${inquiry.inquiriesCategory eq 'P'}">
					              <td>결제취소문의</td>
				              </c:if>
				              <c:if test="${inquiry.inquiriesSecret eq 'Y' }">
				              	<td><img alt="" src="../../../resources/images/notice/lockIcon.png" style="width:30px; height:30px;"></td>
				              </c:if>
				              <c:if test="${inquiry.inquiriesSecret eq 'N' }">
				              	<td></td>
				              </c:if>
				              <td><a href="detail?inquiriesNo=${inquiry.inquiriesNo }">${inquiry.inquiriesTitle }</a></td>
				              <td>${inquiry.userName }</td>
				              <td><fmt:formatDate value="${inquiry.qCreateDate }" pattern="yyyy-MM-dd" /></td>
				          </tr>
				        <c:set var="num" value="${num-1 }"/>
				        </c:forEach>
			        </tbody>
			      </table>
			        <div class="pageWrap">
			        	<div class="pageNation">
			       			<c:if test="${pi.currentPage > 1}">
			       				<a href="/inquiry/list?page=1" class="first-last-page"><<</a>
			       			</c:if>
			       			<c:forEach begin="${pi.startNavi}" end="${pi.endNavi}" var="page">
			       				<c:url var="pageUrl" value="/inquiry/list">
			       					<c:param name="page" value="${page}" />
			       				</c:url>
			       				<a href="${pageUrl}" <c:if test="${pi.currentPage == page}"></c:if>>${page}</a>
			       			</c:forEach>
			       			<c:if test="${pi.currentPage < pi.maxPage}">
			       				<a href="/inquiry/list?page=${pi.maxPage}" class="first-last-page">>></a>
			       			</c:if>
						</div>
				    </div>
			      <div class="searchWrap">
			      	<form action="/inquiry/search" method="get">
			      		<select name="searchCondition">
			      			<option value="title" >제목</option>
			      			<option value="content" >내용</option>
			      		</select>
			      		<input type="text" name="searchValue">
			      		<button type="submit" class="btn btn-secondary btn-sm">검색</button>
			      	</form>
			      </div>
			   	  <div class="buttonWrap">
<%-- 			      	<c:if test="${user.userType eq '1' }"> --%>
<!-- 			      		<button type="button" class="btn btn-primary"onclick="location.href='/notice/write'">공지사항 작성</button> -->
<%-- 			      	</c:if>		      --%>
			      </div>
			    </div>
	    </div>
	    
	    <jsp:include page="../common/footer.jsp"></jsp:include>
	    

	    <script type="text/javascript">
	    	console.log(${pi.totalCount})
	    </script>
	</body>
</html>