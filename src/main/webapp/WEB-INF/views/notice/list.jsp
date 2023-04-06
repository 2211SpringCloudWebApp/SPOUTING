<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
		<jsp:include page="../header.jsp"></jsp:include>
		
<!-- 		메인테이블 -->
	    <div id="main">
	      <h2>공지사항</h2>
	      <h5>스파우팅의 새로운 소식을 만나보세요!</h5>
	      <table class="table table-hover">
	        <thead>
	          <colgroup>
	            <col style="width:10%">
	            <col style="width:50%">
	            <col style="width:20%">
	            <col style="width:20%">
	          </colgroup>
	          <tr>
	              <th>번호</th>
	              <th>제목</th>
	              <th>작성자</th>
	              <th>작성일</th>
	          </tr>
	        </thead>
	        <tbody class="table-group-divider" style="border-top-color : #1C3879;">
	          <tr>
	              <td>2</td>
	              <td>공지사항1</td>
	              <td>스파우터</td>
	              <td>23/03/05</td>
	          </tr>
	          <tr>
	            <td>2</td>
	            <td>공지사항1</td>
	            <td>스파우터</td>
	            <td>23/03/05</td>
	          </tr>
	          <tr>
	            <td>2</td>
	            <td>공지사항1</td>
	            <td>스파우터</td>
	            <td>23/03/05</td>
	          </tr>
	          <tr>
	            <td>2</td>
	            <td>공지사항1</td>
	            <td>스파우터</td>
	            <td>23/03/05</td>
	          </tr>
	        </tbody>
	      </table>
	      <button>공지사항작성</button>
	    </div>
	    
	    <jsp:include page="../footer.jsp"></jsp:include>
	</body>
</html>