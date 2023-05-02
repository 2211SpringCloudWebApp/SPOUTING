<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="../../../resources/css/mainCss/header.css">
</head>
<body>
<div id="container">
        <header>
            <div id="logo">
                <a href="/"><img src="../../resources/images/homeImg/logo.png" alt="logo"></a>
            </div>
            <div id="login">
                <c:if test="${sessionScope.loginUser.userId eq null}">
                    <a href="/user/register" class="login-btn">💙JOIN</a>
                    <a href="/user/login" class="login-btn">⚽LOGIN</a>       
                </c:if>
                <c:if test="${sessionScope.loginUser.userId ne null}">
                    <input type="hidden" id="userId" value="${sessionScope.loginUser.userId}">                                
                    <div id="user-drop">
                        <span id="user-box">${sessionScope.loginUser.userName} SPOUTER🏆</span>
                        <ul id="user-menu">
                            <li><a href="/diary/list">TODAY'S SPOUTING</a></li>
                            <li><a href="/shop/cartView">CART</a></li> 
                            <li><a href="/mypage/myinfo">MY PAGE</a></li>
                            <li><a href="/user/logout">LOGOUT</a></li>                                                      
                        </ul>
                    </div>
                </c:if>          
            </div>
            <nav>
                <ul class="drop_nav">
                    <div class="item_part">
                        <div class="item_name"><a href="">소개</a></div>
                        <div class="item_content">
                            <li><a href="">스파우팅 소개</a></li>
                            <li><a href="/center/search">지점 찾기</a></li>
                        </div>
                    </div>
​
                    <div class="item_part">
                        <div class="item_name"><a href="/book/bookView">예약</a></div>
                        <div class="item_content">
                            <li><a href="/book/bookView">예약하기</a></li>
                             <c:if test="${sessionScope.loginUser.userId ne null}">
                            	<li><a href="/book/myBooking?userNo=${sessionScope.loginUser.userNo}">예약조회</a></li>
                             </c:if>
                        </div>
                    </div>
​
                    <div class="item_part">
                        <div class="item_name"><a href="/shop/main">마켓</a></div>
                        <div class="item_content">
                            <li><a href="/shop/productList">카테고리</a></li>
                            <li><a href="/review/reviewList">상품후기</a></li>
                        </div>
                    </div>
​
                    <div class="item_part">
                        <div class="item_name"><a href="">커뮤니티</a></div>
                        <div class="item_content">
                            <li><a href="/meeting">소셜링</a></li>
                            <li><a href="/sns?userNo=${loginUser.userNo }">SNS</a></li>
                        </div>
                    </div>
​
                    <div class="item_part">
                        <div class="item_name"><a href="/notice/list">게시판</a></div>
                        <div class="item_content">
                            <li><a href="/notice/list">공지사항</a></li>
                            <li><a href="/inquiry/list">문의사항</a></li>
                        </div>
                    </div>
                    
                </ul>
            </nav>
​
        </header>
    </div>
</body>
</html>