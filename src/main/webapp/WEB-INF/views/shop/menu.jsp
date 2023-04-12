<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        	padding-top : 200px;
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
		<ul id="nav-v2">
            <h3>카테고리</h3>
			<li class="menu-v2"><a href="#">APPAREL</a>
				<ul class="submenu">
					<li><a href="#">CLOTHES</a></li>
					<li><a href="#">BAG&POUCH</a></li>
				</ul>
			</li>
			<li class="menu-v2"><a href="#">LIFE</a>
				<ul class="submenu">
					<li><a href="#">TECH</a></li>
					<li><a href="#">LIVING</a></li>
				</ul>
			</li>
			<li class="menu-v2"><a href="#">LEISURE</a>
				<ul class="submenu">
					<li><a href="#">SPORTS</a></li>
					<li><a href="#">OFFICE</a></li>
				</ul>
			</li>
		</ul>
            

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