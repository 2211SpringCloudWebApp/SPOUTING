<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<style>
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }

        *{
            list-style:none;
            font-family: 'Pretendard-Regular';
            box-sizing:border-box;
        }

        h3 {
            text-align: center;
            line-height: 3;
            color :#1C3879;
        }
        a{ 
            text-decoration:none;
            color : black;
        }
        .clear {clear:both; }
        #navcontainer{
        	width : 200px;
        	height : calc(100vh - 150px);
        	padding-top : 100px;
        	}
        
        #nav-v2{
            width: 150px;
            text-align:center;
            position: fixed;
        }
        .menu-v2{
            line-height:2;
            position:relative;
        }
        .menu-v2 .submenu{
            position:absolute;
            width:150px;
            left:150px;
            background-color: #607EAA;
            color:white;
            top : 0;
            display:none;
        }
        .menu-v2:hover{
            background-color: #607EAA;
        }
        .menu-v2 .submenu>li:hover{
            background-color: white;
        }

    
    </style>
</head>
<body>
	<div id="navcontainer">
		<c:if test="${sessionScope.loginUser.userId eq null}">
			<input type="hidden" id="userId" value="${sessionScope.loginUser.userId}"> 
			<ul id="nav-v2">
	            <h3>카테고리</h3>
				<li class="menu-v2"><a href="/shop/catelist1?c=1,2">APPAREL</a>
					<ul class="submenu">
						<li><a href="/shop/catelist2?c=1">CLOTHES</a></li>
						<li><a href="/shop/catelist2?c=2">BAGS</a></li>
					</ul>
				</li>
				<li class="menu-v2"><a href="/shop/catelist1?c=3,4">LIFE</a>
					<ul class="submenu">
						<li><a href="/shop/catelist2?c=3">TECH</a></li>
						<li><a href="/shop/catelist2?c=4">LIVING</a></li>
					</ul>
				</li>
				<li class="menu-v2"><a href="/shop/catelist1?c=5,6">LEISURE</a>
					<ul class="submenu">
						<li><a href="/shop/catelist2?c=5">OFFICE</a></li>
						<li><a href="/shop/catelist2?c=6">SPORTS</a></li>
					</ul>
				</li>
			</ul>
		</c:if>
		<c:if test="${sessionScope.loginUser.userId ne null}">
			<input type="hidden" id="userId" value="${sessionScope.loginUser.userId}"> 
	        <ul id="nav-v2">
	            <h3>CATEGORY</h3>
				<li class="menu-v2"><a href="/shop/catelist1?c=1,2">APPAREL</a>
					<ul class="submenu">
						<li><a href="/shop/catelist2?c=1">CLOTHES</a></li>
						<li><a href="/shop/catelist2?c=2">BAGS</a></li>
					</ul>
				</li>
				<li class="menu-v2"><a href="/shop/catelist1?c=3,4">LIFE</a>
					<ul class="submenu">
						<li><a href="/shop/catelist2?c=3">TECH</a></li>
						<li><a href="/shop/catelist2?c=4">LIVING</a></li>
					</ul>
				</li>
				<li class="menu-v2"><a href="/shop/catelist1?c=5,6">LEISURE</a>
					<ul class="submenu">
						<li><a href="/shop/catelist2?c=5">OFFICE</a></li>
						<li><a href="/shop/catelist2?c=6">SPORTS</a></li>
					</ul>
				</li>
				<br><br>
				<h3>MY SHOP</h3>
				<li class="menu-v2"><a href="/shop/cartView">CART</a>
			</ul>
        </c:if>
    </div>

    <script>
	//menu v2
	$(".menu-v2").mouseover(function(){
		$(this).children(".submenu").show(200);
	});
	$(".menu-v2").mouseleave(function(){
		$(this).children(".submenu").hide(200);
	});
    </script>
</body>
</html>