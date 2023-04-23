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
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- 		css링크 -->
	    <link href="../../../resources/css/noticeCss/list.css" rel="stylesheet">
<!-- 	    jQuery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- 		모달테스트 -->
		<style type="text/css">
			
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
							  <!-- 카테고리부분 -->
				              <c:if test="${inquiry.inquiriesCategory eq 'N'}">
					              <td>일반문의</td>
				              </c:if>
				              <c:if test="${inquiry.inquiriesCategory eq 'M'}">
					              <td>MD관련문의</td>
				              </c:if>
				              <c:if test="${inquiry.inquiriesCategory eq 'P'}">
					              <td>결제취소문의</td>
				              </c:if>
							  <!-- 비밀글여부 -->
				              <c:if test="${inquiry.inquiriesSecret eq 'Y' }">
				              	<td><img alt="" src="../../../resources/images/notice/lockIcon.png" style="width:30px; height:30px;"></td>
				              </c:if>
				              <c:if test="${inquiry.inquiriesSecret eq 'N' }">
				              	<td></td>
				              </c:if>
							  <!--비회원일경우 디테일제한-->
							  <c:choose>
							  	<c:when test="${user.userNo ne null}">
									<!-- 회원이면서 비밀번호여부 -->
									<c:choose>
										<c:when test="${inquiry.inquiriesSecret eq 'N'}">
											<td><a href="detail?inquiriesNo=${inquiry.inquiriesNo }">${inquiry.inquiriesTitle }</a></td>
										</c:when>
										<c:otherwise>
											<td><a href="detail?inquiriesNo=${inquiry.inquiriesNo }" id="click">${inquiry.inquiriesTitle }</a></td>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<td><a href="detail?inquiriesNo=${inquiry.inquiriesNo }" data-bs-toggle="modal" data-bs-target="#exampleModal">${inquiry.inquiriesTitle }</a></td>
								</c:otherwise>
							  </c:choose>
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
			      	<c:if test="${user.userType eq '0' }">
			      		<button type="button" class="btn btn-primary"onclick="location.href='/inquiry/write'">문의사항 작성</button>
			      	</c:if>		     
			      </div>
			    </div>
				<!-- <button id="click">모달테스트</button> -->
	    </div>
	    
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
			  <div class="modal-content">
				<div class="modal-header">
				  <h1 class="modal-title fs-5" id="exampleModalLabel">회원가입 후 이용가능합니다.</h1>
				  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-footer">
				  <form action="/user/register" method="get">
					  <button type="submit" class="btn btn-primary">확인</button>
				  </form>
				</div>
			  </div>
			</div>
		  </div>


		<!-- 모달테스트 -->
		<div class="Modaltest">
			<form action="/inquiry/detail" method="post">
			<div class="Modal-content" title="클릭하면 창이 닫힌다.">
				비밀글입니다.<br>
				비밀번호를 입력해주세요.<br>
				<input type="text" name="secretNo">
				<button id="OK">확인</button>
			</div>
			</form>
		</div>
	    <jsp:include page="../common/footer.jsp"></jsp:include>
	    
		
	    <script type="text/javascript">
	    	console.log(${user.userNo})
			$(function(){
				$("#click").click(function(){
					$(".Modaltest").fadeIn();
				});
				$("#OK").click(function(){
					$(".Modaltest").fadeOut();
				});
			})
	    </script>
	</body>
</html>