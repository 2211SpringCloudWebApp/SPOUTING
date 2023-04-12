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
	    <style>
	      .table-hover>.table-group-divider>tr:hover{
	        background-color: #afcfff;
	      }
	      #main{
	        width: 65%;
	        margin: 0 auto;
	      }
	    </style>
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		
<!-- 		메인테이블 -->
	    <div id="main">
	      <h2>공지사항</h2>
	      <h5>스파우팅의 새로운 소식을 만나보세요!</h5>
	      <table class="table table-hover">
		          <colgroup>
		            <col style="width:10%">
		            <col style="width:50%">
		            <col style="width:20%">
		            <col style="width:20%">
		          </colgroup>
	        <thead>
		          <tr>
		              <th>번호</th>
		              <th>제목</th>
		              <th>작성자</th>
		              <th>작성일</th>
		          </tr>
	        </thead>
	        <tbody class="table-group-divider" style="border-top-color : #1C3879;">
		        <c:forEach items="${nList }" var="notice" varStatus="i">
		          <tr>
		              <td>${notice.noticeNo }</td>
		              <td><a href="detail?noticeNo=${notice.noticeNo }">${notice.noticeTitle }</a></td>
		              <td>${notice.userNo }</td>
		              <td><fmt:formatDate value="${notice.nCreateDate }" pattern="yyyy-MM-dd" /></td>
		          </tr>
		        </c:forEach>
	        </tbody>
	      </table>
	      <div>
	      	<c:if test="${user.userType eq '1' }">
	      		<button type="button" onclick="location.href='/notice/write'">공지사항 작성</button>
	      	</c:if>		     
	      </div>
	    </div>
	    
	    <jsp:include page="../common/footer.jsp"></jsp:include>
	    
	    <script type="text/javascript">
	    	console.log(${notice.noticeNo})
	    </script>
	</body>
</html>