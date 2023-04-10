<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
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
                    <br><a href="/user/login">Login </a> | 
                    <a href="/user/register"> Join</a>
                </c:if>
                <c:if test="${sessionScope.loginUser.userId ne null}">
                    <input type="hidden" id="userId" value="${sessionScope.loginUser.userId}">
                    <span>반가워요! Spouter ${sessionScope.loginUser.userName}</span><br>
                    <a href="/user/logout">Logout </a> | 
                    <a href="/user/mypage"> Mypage</a>
                </c:if>
               
            </div>
            <nav>
                <ul class="drop_nav">
                    <div class="item_part">
                        <div class="item_name"><a href="">소개</a></div>
                        <div class="item_content">
                            <li><a href="">스파우팅 소개</a></li>
                            <li><a href="">지점 소개</a></li>
                        </div>
                    </div>
​
                    <div class="item_part">
                        <div class="item_name"><a href="">예약</a></div>
                        <div class="item_content">
                            <li><a href="">예약하기</a></li>
                            <li><a href="">예약조회</a></li>
                        </div>
                    </div>
​
                    <div class="item_part">
                        <div class="item_name"><a href="">판매</a></div>
                        <div class="item_content">
                            <li><a href="">상품 카테고리</a></li>
                            <li><a href="">의류</a></li>
                            <li><a href="">잡화</a></li>
                        </div>
                    </div>
​
                    <div class="item_part">
                        <div class="item_name"><a href="">커뮤니티</a></div>
                        <div class="item_content">
                            <li><a href="">모임찾기</a></li>
                            <li><a href="">소모임</a></li>
                        </div>
                    </div>
​
                    <div class="item_part">
                        <div class="item_name"><a href="">게시판</a></div>
                        <div class="item_content">
                            <li><a href="">공지사항</a></li>
                            <li><a href="">문의사항</a></li>
                        </div>
                    </div>
                    
                    <!-- <li><a href="">소개</a></li>
                    <li><a href="">예약</a></li>
                    <li><a href="">판매</a></li>
                    <li><a href="">커뮤니티</a></li>
                    <li><a href="">게시판</a></li> -->
                </ul>
            </nav>
​
        </header>
    </div>
</body>
</html>