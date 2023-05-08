<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 날짜변환용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPOUTING-MyPage</title>
    <link rel="stylesheet" href="/resources/css/mypageCss/nav.css">
    <link rel="stylesheet" href="/resources/css/mypageCss/myinfoCss.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <div id="head-info">
        <table>
            <tr>
                <td id="user-msg">
                    ${sessionScope.loginUser.userName}님 
                    오늘도 Spouting!
                </td>
                <td>
                    <button id="daily-btn" onclick="location.href='/diary/list'">🦾하루기록</button>
                </td>              
            </tr>
        </table>
    </div>
    <ul id="left-nav">
        <li><a href="/book/myBooking?userNo=${sessionScope.loginUser.userNo}">예약내역</a></li>
        <li><a href="/order/list">주문내역</a></li>
        <li><a href="/review/reviewListUser">상품후기</a></li>
        <li><a href="/meeting/myMeetingList">나의 커뮤니티</a></li>
        <li class="selected"><a href="/inquiry/myInquiry">나의 문의</a></li>
        <li><a href="/point/detail">포인트 관리</a></li>
        <li><a href="/mypage/myinfo">개인정보 수정</a></li>
    </ul>

    <div id="i-main-box">
        <div id="i-check-box">
            <div id="logo-main">
                고객님의 문의글목록입니다.    
            </div>
            <table id="i-info-box">
				<tr>
	                <th>POST_NO</th>
	                <th>CATEGORY</th>
	                <th>TITLE</th>
	                <th>WRITE_DATE</th>
	            </tr>
	            
	<%--             <c:set var="num" value="${pi.totalCount - ((pi.currentPage-1) * 10)}"/> --%>
				<c:if test="${empty iList}">
				    <tr>
				        <td colspan="4" id="noInquiry">작성된 문의글이 없습니다.</td>
				    </tr>
				</c:if>
	            <c:forEach items="${iList}" var="inquiry" varStatus="i">
	            <tr>
	                <td>${inquiry.inquiriesNo}</td>
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
	                <td><a href="detail?inquiriesNo=${inquiry.inquiriesNo }">${inquiry.inquiriesTitle}</a></td>
	                <td><fmt:formatDate value="${inquiry.qCreateDate }" pattern="yyyy-MM-dd" /></td>
	            </tr>
	            </c:forEach>
            </table>
<!--             페이징처리 -->
            <table id="navi-box">
            <tr>
                <td>
					<c:if test="${pi.currentPage > 1}">
			       		<a href="/inquiry/myInquiry?page=1" id="navi-btn3"><<</a>
			       	</c:if>
			     	<c:forEach begin="${pi.startNavi}" end="${pi.endNavi}" var="page">
			       		<c:url var="pageUrl" value="/inquiry/myInquiry">
			       			<c:param name="page" value="${page}" />
			       		</c:url>
			       		<a href="${pageUrl}" id="navi-btn3"<c:if test="${pi.currentPage == page}"></c:if>>${page}</a>
			       	</c:forEach>
			       		<c:if test="${pi.currentPage < pi.maxPage}">
			       			<a href="/inquiry/myInquiry?page=${pi.maxPage}" id="navi-btn3">>></a>
			       		</c:if>
                </td>
            </tr>
        </table>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"></jsp:include>

    <script>
        function press() {
            if(window.event.keyCode == 13) { //JS에서 13=enter키
                checkPw();
            }
        }

        function checkPw() {
            var userPw = $("#userPw").val();
            var userCheckPw = $("#userCheckPw").val();
            if(userPw === userCheckPw) {
                location.href = "/user/modify"
            } else {
                alert("비밀번호 오류!")
            }
        }

        
    </script>
</body>
</html>