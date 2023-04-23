<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 날짜변환용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>문의사항 디테일</title>
<!-- 		부트스트랩링크 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- 		css링크 -->
		<link href="../../../resources/css/noticeCss/detail.css" rel="stylesheet">
<!-- 		Ajax -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
				<table class="table table-borderless">
					<tr>
						<th>제목</th>
						<td>${inquiry.inquiriesTitle } </td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${inquiry.userName }</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td><fmt:formatDate value="${inquiry.qCreateDate }" pattern="yyyy-MM-dd" /></td>
					</tr>
				</table>
				<div id="content">
					${inquiry.inquiriesContent }
				</div>
				<div id="contentImg">
					<img src="/resources/images/inquiry/${inquiry.inquiriesFilerename}" width="400">
				</div>
			</div>
			<div class="mainFooter">
				<div id="buttonTag">
					<c:if test="${user.userType eq 1 }">
						<form action="/inquiry/modifyView" method="post">
							<input type="hidden" name="inquiriesNo" value="${inquiry.inquiriesNo }">
							<button type="submit" class="btn btn-secondary">수정</button>
						</form>
						<form action="/inquiry/delete" method="post">
							<!-- Button trigger modal -->
							<input type="hidden" name="inquiriesNo" value="${inquiry.inquiriesNo }">
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
							  삭제
							</button>
<!-- 							<button type="submit" onclick="deleteBtn()">삭제</button> -->
						</form>
					</c:if>
					<button type="button" class="btn btn-outline-light" onclick="location.href='/inquiry/list'">목록</button>
				</div>
			</div>
		</div>
<!-- 		끝 -->


		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">문의사항을 삭제하시겠습니까?</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				<form action="/notice/delete" method="post">
					<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
		        	<button type="submit" onclick="deleteBtn();" class="btn btn-primary">삭제</button>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
		

		<jsp:include page="../common/footer.jsp"></jsp:include>
		
		
<!-- 	    부트스트랩 링크 -->
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
		<script>
// 		    $(function() {
// 		        $('#deleteBtn').click(function() {
// 		            $.ajax({
// 		                url: '/notice/delete',
// 		                type: 'POST',
// 		                data: $('#deleteForm').serialize(),
// 		                success: function(response) {
// 		                    $('.modal-header .modal-title').text('삭제되었습니다.');
// 		                },
// 		                error: function() {
// 		                    alert('삭제 실패');
// 		                }
// 		            });
// 		        });
// 		    });

		</script>
	</body>
</html>