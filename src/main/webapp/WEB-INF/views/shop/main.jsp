<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SPOUTING MARKET</title>
	<link rel="stylesheet" href="../../../resources/css/shopCss/main.css">
	<style>
		#nav {
		  float: left;
		  width: 200px;
		  height : 50vh;
		}
	</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div id="nav">
		<jsp:include page="./menu.jsp"></jsp:include>
	</div>
	<div id="maincontainer">
    	<h1 style="color:#1C3879">SPOUTING MARKET</h1>
    	<br>
        <p>스파우팅만의 제품들을 만나보세요.</p>
		<div id="prebox">
            <div class="box1">
                <div class="prolist">
                    <img src="/resources/images/product/items/unitop3.jpg">
                    <p>스파우팅 한정 제작 아노락</p>
                    <p>35,000</p>
                </div>
            </div>
            <div class="box2">
                <div class="prolist">
                    <img src="/resources/images/product/items/living9.jpg">
                    <p>(회원전용) 워시</p>
                    <p>20,000</p>
                </div>
            </div>
            <div class="box3">
                <div class="prolist">
                    <img src="/resources/images/product/items/office7.jpg">
                    <p>스파우터 키링</p>
                    <p>10,000</p>
                </div>
            </div>
        </div>
        <div id="movebtn">
	        <a href="/shop/productList" style="text-align : center;">전체 상품 보기</a>          
        </div>
        <div class="box">
            <div class="slide">
                <div class="images">
                    <img src="/resources/images/product/ad/ad1.jpg">
                    <img src="/resources/images/product/ad/ad2.jpg">
                    <img src="/resources/images/product/ad/ad3.jpg">
                    <img src="/resources/images/product/ad/ad4.jpg">
                </div>
            </div>
                <button type="button" class="back">❮</button>
                <button class="next">❯</button>
            </div>
    	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
    <script>
        let pages = 0;//현재 인덱스 번호
        let positionValue = 0;//images 위치값
        const IMAGE_WIDTH = 900;//한번 이동 시 IMAGE_WIDTH만큼 이동한다.
        //DOM
        const backBtn = document.querySelector(".back")
        const nextBtn = document.querySelector(".next")
        const images = document.querySelector(".images")

        function next() {
        if (pages< 2) {
            backBtn.removeAttribute('disabled')//뒤로 이동해 더이상 disabled가 아니여서 속성을 삭제한다.
            positionValue -= IMAGE_WIDTH;//IMAGE_WIDTH의 증감을 positionValue에 저장한다.
            images.style.transform = `translateX(${positionValue}px)`;
                //x축으로 positionValue만큼의 px을 이동한다.
            pages += 1; //다음 페이지로 이동해서 pages를 1증가 시킨다.
        }
        if (pages === 2) { //
            nextBtn.setAttribute('disabled', 'true')//마지막 장일 때 next버튼이 disabled된다.
        }
        }

        function back() {
        if (pages > 0) {
            nextBtn.removeAttribute('disabled')
            positionValue += IMAGE_WIDTH;
            images.style.transform = `translateX(${positionValue}px)`;
            pages -= 1; //이전 페이지로 이동해서 pages를 1감소 시킨다.
        }
        if (pages === 0) {
            backBtn.setAttribute('disabled', 'true')//마지막 장일 때 back버튼이 disabled된다.
        }
        }

        function init() {  //초기 화면 상태
        backBtn.setAttribute('disabled', 'true'); //속성이 disabled가 된다.
        backBtn.addEventListener("click", back); //클릭시 다음으로 이동한다.
        nextBtn.addEventListener("click", next);//클릭시 이전으로 이동한다.
        }
        init();
    </script>
</body>
</html>