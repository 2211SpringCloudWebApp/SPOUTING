<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>REVIEW LIST</title>
	<link rel="stylesheet" href="/resources/css/pointCss/detail.css">
    <link rel="stylesheet" href="/resources/css/mypageCss/nav.css">
	<style>
		#point-list {
        width: 800px;
        display: block;
        margin: 0 auto;
        line-height: 3;
        text-align: center;
    	}
        .table-line {
            width:800px;
            border-bottom: 1px solid #ccc;
            display: table;
            padding-right: 10px;
            padding-left: 10px;
        }
        #navi-box {
		    width: 800px;
		    height: 120px;
		    margin: 0 auto;
		    margin-bottom: 50px;
		    text-align: center;
		    padding-top: 30px;
		}
		#list-wrapper {
		    width: 900px;
		    margin: 0 auto;
		    display: block;
		}
		#list-title {
		    width: 600px;
		    height: 50px;
		    margin: 50px auto;
		    text-align: center;
		    padding: 10px;
		}
	</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp"></jsp:include>
	 <div id="head-info">
        <table>
            <tr>
                <td id="user-msg">
                    ${sessionScope.loginUser.userName}님 <br>
                    오늘도 Spouting!
                </td>
                <td>
                    <button id="daily-btn" onclick="location.href='/diary/list'">🦾오늘 기록</button>
                </td>
            </tr>
        </table>
    </div>
    <ul id="left-nav">
        <li><a href="">예약내역</a></li>
        <li><a href="/order/list">주문내역</a></li>
        <li class="selected"><a href="">상품후기</a></li>
        <li><a href="">나의 커뮤니티</a></li>
        <li><a href="">나의 문의</a></li>
        <li><a href="/point/detail">포인트 관리</a></li>
        <li><a href="/mypage/myinfo">개인정보 수정</a></li>
    </ul>
    
    <div id="main">
        <div id="list-title">
            <p>${sessionScope.loginUser.userName}님의 후기 내역</p>
        </div>
        <div id="list-wrapper">
       		<table id="point-list">
				<tr class="table-line">
				 	<th scope="row" style="width: 25%;">번호</th>
				 	<th scope="row" style="width: 25%;">제목</th>
				 	<th scope="row" style="width: 25%;">작성자</th>
				 	<th scope="row" style="width: 25%;">등록일자</th>
				 </tr>
				 <c:forEach var="review" items="${rList }">
					<tr class="table-line" onclick="location.href='/review/detail?reviewNo=${review.reviewNo}'"style="cursor: pointer;">
						<td style="width: 25%;">${review.reviewNo }</td>
						<td style="width: 25%;">${review.reviewTitle }</td>
						<td style="width: 25%;">${review.userId }</td>
						<td style="width: 25%;"><fmt:formatDate value="${review.reviewDate}" pattern="yyyy.MM.dd" /></td>
					</tr>
				</c:forEach>
            </table>
        </div>
	</div>
	<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>