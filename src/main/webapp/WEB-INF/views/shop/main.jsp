<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>SPOUTING MARKET</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../../../resources/css/shopCss/main.css">
    <title>Document</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div id="maincontainer">

    <div id="box3">
        <div id="slideShow">
            <div class="slides">
                <div class="slides-box">
                    <img src="/resources/images/product/items/living7.jpg">
                    <p>for SPOUTER</p>
                    <h2>SWIMMING KIT</h2>
                </div>
                <div class="slides-box">
                    <img src="/resources/images/product/items/living8.jpg">
                    <p>for SPOUTER</p>
                    <h2>DESK KIT</h2>
                </div>
                <div class="slides-box">
                    <img
                        src="/resources/images/product/items/living9.jpg">
                    <p>for SPOUTER</p>
                    <h2>CLEAN KIT</h2>
                </div>
                <div class="slides-box">
                    <img src="/resources/images/product/items/womtop2.jpg">
                    <p>clothes</p>
                    <h2>T-SHIRT</h2>
                </div>
                <div class="slides-box">
                    <img src="/resources/images/product/items/office3.jpg">
                    <p>my daily</p>
                    <h2>SPORTS DIARY</h2>
                </div>
                <div class="slides-box">
                    <img src="/resources/images/product/items/sports2.jpg">
                    <p>for picnic</p>
                    <h2>PICNIC SET</h2>
                </div>
                <div class="slides-box">
                    <img src="/resources/images/product/items/living7.jpg">
                    <p>for SPOUTER</p>
                    <h2>CHEERING KIT</h2>
                </div>
            </div>
            <p class="controller">
                <span class="prevmm">&lang;</span> <span class="nextmm">&rang;</span>
            </p>
        </div>
    </div>
    <div id="box2" style="height:500px;">
        <h1 style="color:#1C3879; font-size:40px;">Shopping News & Event</h1>
        <br><br>
        <div id="outterbox">
			<div>
				<img src="/resources/images/product/ad/ad1.jpg">
				<div id="inner">
					<a>스파우터 한정 무료배송</a>
					<br>
					<a>합리적인 가격으로 만나보세요</a>
				</div>
			</div>
			<div>
				<img src="/resources/images/product/ad/ad2.jpg">
				<div id="inner">
					<a>스파우터들과 함께</a>
					<br>
					<a>전용 굿즈로 모임해요</a>
				</div>
			</div>
			<div>
				<img src="/resources/images/product/ad/ad3.jpg">
				<div id="inner">
					<a>언제나 열려있는 스파우팅 마켓</a>
					<br>
					<a>궁금한 사항을 물어보세요</a>
				</div>
			</div>
		</div>
    </div>
    <div id="box2" style="height:500px;">
        <div id="outterbox">
			<div>
				<img src="/resources/images/product/ad/ad4.jpg">
				<div id="inner">
					<a>스파우터 한정 무료배송</a>
					<br>
					<a>합리적인 가격으로 만나보세요</a>
				</div>
			</div>
			<div>
				<img src="/resources/images/product/ad/ad5.jpg">
				<div id="inner">
					<a>스파우터 한정 무료배송</a>
					<br>
					<a>합리적인 가격으로 만나보세요</a>
				</div>
			</div>
			<div>
				<img src="/resources/images/product/ad/ad6.jpg">
				<div id="inner">
					<a>스파우터 한정 무료배송</a>
					<br>
					<a>합리적인 가격으로 만나보세요</a>
				</div>
			</div>
		</div>
    </div>
    <div id="box2">
        <h1 style="color:#1C3879; font-size:40px;">SPOUTING MARKET</h1>
        <br><br>
        <div style="color:#607EAA; font-size:15px;">
	        <p>스파우팅 마켓은</p>
	        <p>바쁜 생활 속에서도 활기찬 순간을 선물하고 싶습니다.</p>
	        <p>편안하고 담백한 나만의 취미생활,</p>
	        <p>그 속에서 실용적으로 사용할 수 있는 상품들을 제작합니다.</p>
	        <p>다양한 상품들을 지금, 스파우팅 마켓에서 만나보세요</p>
	        <br><br>
        </div>
        <div id="buttonbox">
	        <button class="btn" onclick="location.href='/shop/productList';">상품 보러 가기 > </button>
        </div>
    </div>
    
    
    	
	</div>


    <script>
	// 상위 슬라이드
		const slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너
		const slideImg = document.querySelectorAll('.slides-box'); //모든 슬라이드들
		let currentIdx = 0; //현재 슬라이드 index
		const slideCount = slideImg.length; // 슬라이드 개수
		const prevmm = document.querySelector('.prevmm'); //이전 버튼
		const nextmm = document.querySelector('.nextmm'); //다음 버튼
		const slideWidth = 300; //한개의 슬라이드 넓이
		const slideMargin = 100; //슬라이드간의 margin 값
		slides.style.width = (slideWidth + slideMargin) * slideCount + 'px';

		function moveSlide(num) {
			slides.style.left = -num * 400 + 'px';
			currentIdx = num;
		}

		prevmm.addEventListener('click', function() {
			if (currentIdx !== 0)
				moveSlide(currentIdx - 1);
		});

		nextmm.addEventListener('click', function() {
			if (currentIdx !== slideCount - 1) {
				moveSlide(currentIdx + 1);
			}
		});
	</script>
</body>
</html>