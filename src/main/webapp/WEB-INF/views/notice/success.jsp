<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>등록완료😎</title>
		
<!-- 		css설정 -->
		<style type="text/css">
			.main{
				display: flex;
				flex-direction: column;
				align-items: center;
				margin-top: 30px;
				margin-bottom: 30px;
			}
			.main h2{
				font-size: 43px;
				margin-top: 50px;
				margin-bottom: 50px;
			}
			.imageTag img{
				width: 100px;
				height: 100px;
			}
 			.main button{ 
 				color: #a9ddff;
 				border-color: #a9ddff;
 			}
 			
			.box {
			  /* padding: 4.5em 0; */
			  display: -webkit-flex;
			  display: -ms-flexbox;
			  display: flex;
			  -webkit-flex-wrap: wrap;
			  -ms-flex-wrap: wrap;
			  flex-wrap: wrap;
			  -webkit-justify-content: center;
			  justify-content: center;
			}
 			
			.button {
			  float: left;
			  min-width: 150px;
			  max-width: 250px;
			  display: block;
			  margin: 1em;
			  padding: 1em 2em;
			  border: none;
			  background: none;
			  color: inherit;
			  vertical-align: middle;
			  position: relative;
			  z-index: 1;
			  -webkit-backface-visibility: hidden;
			  -moz-osx-font-smoothing: grayscale;
			}
			.button:focus {
			  outline: none;
			}
			.button > span {
			  vertical-align: middle;
}
/*  			버튼두께 */
			.button--border-thick {
			  border: 3px solid;
			}
/* 			버튼둥글게 */
			.button--round-l {
			  border-radius: 40px;
			}
			.button--text-thick {
			  font-weight: 600;
			}
			.button--text-upper {
			  letter-spacing: 2px;
			  text-transform: uppercase;
			}
			.button--size-s {
			  font-size: 14px;
			}
			/* Winona */
			.button--winona {
			  overflow: hidden;
			  padding: 0;
			  -webkit-transition: border-color 0.3s, background-color 0.3s;
			  transition: border-color 0.3s, background-color 0.3s;
			  -webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
			  transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
			}
			.button--winona::after {
			  content: attr(data-text);
			  position: absolute;
			  width: 100%;
			  height: 100%;
			  top: 0;
			  left: 0;
			  opacity: 0;
			  color: #3f51b5;
			  -webkit-transform: translate3d(0, -50%, 0);
			  transform: translate3d(0, -50%, 0);
			}
			.button--winona > span {
			  display: block;
			}
			.button--winona::after,
			.button--winona > span {
/* 			  padding: 1em 2em; */
			  -webkit-transition: -webkit-transform 0.3s, opacity 0.3s;
			  transition: transform 0.3s, opacity 0.3s;
			  -webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
			  transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
			  
			}
			.button--winona:hover {
			  border-color: #3f51b5;
			  background-color: rgba(63, 81, 181, 0.1);
			}
			.button--winona:hover::after {
			  opacity: 1;
			  -webkit-transform: translate3d(0, 0, 0);
			  transform: translate3d(0, 0, 0);
			}
			.button--winona:hover > span {
			  opacity: 0;
			  -webkit-transform: translate3d(0, -50%, 0);
			  transform: translate3d(0, -50%, 0);
			}
		</style>
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		
	    <div class="main">
	        <br><br>
	        <c:if test="${msg eq '문의사항이 등록완료되었습니다!😎'}">
		        <div class="imageTag"><img src="../../../resources/images/notice/question.png"/></div>
	        </c:if>
			<c:if test="${msg eq '문의사항수정이 완료되었습니다!'}">
		        <div class="imageTag"><img src="../../../resources/images/notice/question.png"/></div>
	        </c:if>
			<c:if test="${msg eq '문의사항 삭제 완료'}">
		        <div class="imageTag"><img src="../../../resources/images/notice/bin.png"/></div>
	        </c:if>
	        <c:if test="${msg eq '공지사항 등록완료!'}">
		        <div class="imageTag"><img src="../../../resources/images/notice/check.png"/></div>
	        </c:if>
			<c:if test="${msg eq '공지사항 수정이 완료되었습니다!'}">
		        <div class="imageTag"><img src="../../../resources/images/notice/check.png"/></div>
	        </c:if>
			<c:if test="${msg eq '공지사항 삭제 완료'}">
		        <div class="imageTag"><img src="../../../resources/images/notice/bin.png"/></div>
	        </c:if>
	        <h2>${msg }</h2>
	        <div class="box bg-2">
		        <button onclick="location.href='/'" class="button button--winona button--border-thick button--round-l button--text-upper button--size-s button--text-thick" data-text="Main"><span>Main</span></button>
<!-- 		        <button onclick="location.href='/'">메인화면으로 가기</button> -->
	        </div>
	    </div>
	    
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>