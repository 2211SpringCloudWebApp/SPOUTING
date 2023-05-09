<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!-- ajax CDN -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <!-- jquery CDN -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<title>예 약 완 료 !</title>
		 <style>
		 @font-face {
		    font-family: 'Chosunilbo_myungjo';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Chosunilbo_myungjo.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
    	
section{
	margin-top: 50px;
	margin-bottom: 50px;
}

img{
    width: 100%;
  }
  .login {
      height: 600px;
      width: 100%;
      --background-color: rgb(37, 37, 37);
      position: relative;
  }
  .login_box {
      width: 980px;
      height: 600px;
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%,-50%);
      background: #fff;
      border-radius: 10px;
      box-shadow: 1px 4px 22px -8px #0004;
      display: flex;
      overflow: hidden;
  }
  .login_box .left{
    width: 41%;
    height: 100%;
    padding: 25px 25px;
    
  }
  .login_box .right{
    width: 59%;
    height: 100%  
  }
  .left .top_link a {
      color: #1C3879;
      font-weight: bolder;
      font-family: 'Chosunilbo_myungjo';
      
  }
  .left .top_link{
    height: 20px
  }
  .left .contact{
    display: flex;
      align-items: center;
      justify-content: center;
      align-self: center;
      height: 100%;
      width: 73%;
      margin: auto;
      font-size: 2em;
      font-family: 'Chosunilbo_myungjo';
      font-weight: bold;
      color: #607EAA;
  }
  
  
  .left{
    background: linear-gradient(-45deg, #dcd7e0, #fff);
    opacity: 0.7;
     z-index:1;
  }

  
  
  .right {
    background: linear-gradient(212.38deg, rgba(207, 207, 207, 0.7) 0%, rgba(155, 155, 155, 0.71) 100%), url(../images/signup.png);
    color: #fff;
    position: relative;
    z-index:1;
  }
  
  .right .right-text{
    height: 100%;
    position: relative;
    transform: translate(37%, 45%);
  }
  .right-text .right-text1{
    font-family: 'Chosunilbo_myungjo';
    margin-left: 30px;
    display: block;
    width: 100%;
    text-align: left;
    font-size: 40px;
    
  }
  .right-text #right-text2{
    margin-left: 10px;
    font-family: 'Chosunilbo_myungjo';
    display: block;
    width: 100%;
    text-align: left;
    font-size: 55px;
    
  }
  
  .right {
    position: absolute;
    width: 70px;
    height: 7px;
    background: #fff0;
    left: 50%;
    bottom: 70px;
    transform: translate(-50%, 0%);
  }
  .right-inductor {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}
.right-inductor img {
  width: 100%;
  height: auto%;
  z-index:0;
}
  .top_link img {
      width: 28px;
      padding-right: 7px;
      margin-top: -3px;
  }

    </style>
    <link rel="stylesheet" href="/resources/css/mypageCss/nav.css">
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		 <main>
            <!--------------------------------------->
            <section class="login">
                <div class="login_box">
                  <div class="left">
                    <div class="top_link">
                    	<a href="/"><img src="https://drive.google.com/u/0/uc?id=16U__U5dJdaTfNGobB_OpwAJ73vM50rPV&export=download" alt="">메인페이지로</a>
                    </div>
                    <div class="contact">
                      ${msg}<br><br><br>
                
                    </div>
                  </div>
                  <div class="right">
                    <div class="right-text">
                      <span class="right-text1">고맙습니다,</span>
                      <span id="right-text2">『스파우팅』
                      <span class="right-text1">에서 만날 날을 고대하겠습니다.</span></span>
                    </div>
                  </div>
                  <div class="right-inductor">
                  	<img src="/../../../resources/images/book/confirmed.jpg" alt="">
                  </div>
                </div>
              </section>
			
			
			
			
			
		<script>
		
		</script>
		
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>