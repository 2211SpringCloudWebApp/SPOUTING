<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>SPOUTING</title>
	<link rel="stylesheet" href="/resources/css/mainCss/home.css">
</head>
<body>
	<jsp:include page="./common/header.jsp"></jsp:include>
	<div id="img-box">
        <img class="img" src="/resources/images/homeImg/mainimg1.jpg" alt="mainimg1">
        <img class="img" src="/resources/images/homeImg/mainimg2.jpg" alt="mainimg2">
        <img class="img" src="/resources/images/homeImg/mainimg3.jpg" alt="mainimg3">
        <img class="img" src="/resources/images/homeImg/mainimg4.jpg" alt="mainimg4">
        <img class="img" src="/resources/images/homeImg/mainimg5.jpg" alt="mainimg5">
    </div>
    <div id="box1">
        <div class="box11">
            <p>시설 이용과 SNS를 한 번에,</p>
            <p>나만의 헬스케어까지</p>
            <h1>SPOUTING</h1>
        </div>
        <div class="box12">
            <div>
                <img src="/resources/images/homeImg/icon1.svg" alt="icon1">
                <h1>1,234</h1>
                <p>공간 수</p>
            </div>
            <div>
                <img id="img12" src="/resources/images/homeImg/icon2.svg" alt="icon2">
                <h1>14,727</h1>
                <p>이용된 공간 수</p>
            </div>
            <div>
                <img src="/resources/images/homeImg/icon3.svg" alt="icon3">
                <h1>9,783</h1>
                <p>이용한 고객 수</p>
            </div>
        </div>
    </div>

    <div id="box2">
        <div class="box21">
            <h1>SPOUTING 만의 굿즈를 만나보세요.</h1><br>
            <a href="/shop/main">구매하러 가기</a>
        </div>
        <div class="box22">
            <div class="box23">
                <img src="/resources/images/homeImg/goods1.jpg" alt="goods1">
            </div>
            <div class="box23">
                <img src="/resources/images/homeImg/goods2.jpg" alt="goods2">
            </div>
            <div class="box23">
                <img src="/resources/images/homeImg/goods3.jpg" alt="goods3">
            </div>
        </div>
    </div>
    <div id="box3">

    </div>
    
    <jsp:include page="./common/footer.jsp"></jsp:include>
    <script>
        const images = document.querySelectorAll('.img');
        let current = 0;
        function showSlide() {
            for (let i = 0; i < images.length; i++) {
				images[i].classList.remove('on');
			}
			current++;
			if (current > images.length) {
				current = 1;
			}
			images[current - 1].classList.add('on');
			setTimeout(showSlide, 5000);
        }
        showSlide();
    </script>
</body>
</html>
