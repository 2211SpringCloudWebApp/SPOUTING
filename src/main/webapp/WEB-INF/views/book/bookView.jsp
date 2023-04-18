<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>시설예약하기</title>
		<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- ajax CDN -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <!-- jquery CDN -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- fullcalendar CDN -->
        <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
        <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
        <!-- fullcalendar 언어 CDN -->
        <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
        <!-- css -->
        <link rel="stylesheet" href="/resources/css/bookCss/bookView.css">
        <title>시설예약하기</title>
        <style>
    
        </style>
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		<!-- 사진슬라이드 -->
		<main>
            <div id="image-wrapper">
                <img src="../../../resources/images/book/slide1.png" class="active">
                <img src="../../../resources/images/book/slide2.png">
                <img src="../../../resources/images/book/slide3.jpg">
                <img src="../../../resources/images/book/slide4.jpg">
                <p>< 시설 예약 ></p>
            </div>
            <!-- calendar 태그 -->
            <div id='calendar-container'>
              <div id='calendar'></div>
            </div>
	<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!폼!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
            
            <form action="/book/confirm" method="post">
            <input type="hidden" name="userNo" value="21">
            <!-- 왜 세션에 유저넘버가 없나요 난 어디서 데이터를 땡겨오나요 살려줘 -->
            <div id="booking-info">
                <div class="booking-option" id="option-branch">
<!-- 	${loginUser } -->
                  <p>지점 선택</p><br>
                    <select id="select-branch" >
                        <option value="" selected>선택</option>
                        <option value="a">a 지점</option>
                        <option value="b">b 지점</option>
                        
                        
                    </select>
                </div>
                <!--지점선택하면 시설선택 selectbox 보이기-->    
                <div class="booking-option" id="branch-a" style="display: none;">
                   <p>a-지점 시설 선택</p><br>
                    <select class="facilBox" id="facilities-a"  name= "facilityName">
                        <option value="" selected>선택</option>
                        <option value="a-1">클라이밍센터</option>
                        <option value="a-2">잠수풀</option>
                    </select>
                </div>
            
                <div class="booking-option" id="branch-b" style="display: none;">
                   <p>b-지점 시설 선택</p><br>
                    <select class="facilBox" id="facilities-b" name= "facilityName">
                        <option value="" selected>선택</option>
                        <option value="b-1">테니스코트</option>
                        <option value="b-2">농구코트</option>
                    </select>
                    <div id="infoNumBasket" style="color:red; margin-bottom:20px;"></div>
                </div>
                
                <!--시설선택하면 input type number 보이기-->

                <div class="booking-option" id="num-people" style="display:none;">
                    <p>인원 수 입력</p><br>
                    <input type="number" id="numOfPpl" onchange="showDateInput()" min="1" id="numPpl" name="numPeople">
                </div>    

                <!--인원 입력하고 입력란에서 빠져나오면 date 선택란 보이기-->
                <div class="booking-option" id="date" style="display:none;">
                    <p>이용 날짜</p><br>
                    <input type="date" onchange="showTimeInput()" name="useDate">
                </div>
                <!--날짜 선택하면 풀캘린더 API 등장 ㅜㅜ 우얄꼬-->
                <div id="calendar" >
                <div id="calendar-container" >
                </div>
                
                
                
                

                <!--date 선택하면 time 란 보이기-->
                <div class="booking-option" id="time" style="display:none;">
                    
               		<p>이용 시간</p>
                  
<!--                     input type을 time으로 쓰면 분까지 선택하는게 필수인데 굳이 그렇게 넣어서 파싱할 이유도 없음 -->
<!--                     예)오후 1시~3시까지 이용할 경우<br>13~15 입력<br> -->
				
				
                    <div id="timeInput">
	                    <input type="number" id="startTime" placeholder="시작시간" min="0" name="startParam">~
	                    <input type="number" id="endTime" placeholder="종료시간" onchange="showPrice()" min="1" name="endParam">
                    </div>
                   
                </div>
                <!--time까지 선택하면 요금란 보이기-->
                <div class="booking-option" id="price" style="display:none;">
                    <!-- 요금 뿅 튀어나오는자리 -->                     
                </div>
		        <input type="hidden" id="chosenFacil" value="">
		        <input type="hidden" id="facilNo" value="" name="facilityNo">
		        <input type="hidden" id="bookPrice" value="" name="bookPrice">
                <!--요금 보이고 2초 후에 결제 버튼 보이기-->
                <button id="payment-btn" style="display:none;">이 정보로 예약하기</button>
            </div>
        </form>
        </main>   
        <br><br><br><br><br><br><br><br><br><br><br><br>
        
        
        <script>
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////스크립트영역 
            //지도와의 사투
         

//       document.addEventListener('DOMContentLoaded', function() {
//         var calendarEl = document.getElementById('calendar');
//         var calendar = new FullCalendar.Calendar(calendarEl, {
//           initialView: 'dayGridMonth'
//         });
//         calendar.render();
//       });


            
            
            
            //슬라이드이미지
            const images = document.querySelectorAll('#image-wrapper img');
			let index = 0;
			
			function showImage() {
			    images[index].classList.add('active');
			    index++;
			    if (index >= images.length) {
			        index = 0;
			    }
			    setTimeout(hideImage, 4000);
			}
			
			function hideImage() {
			    if (index > 0) {
			        images[index - 1].classList.remove('active');
			    } else {
			        images[images.length - 1].classList.remove('active');
			    }
			    if (index >= images.length) {
			        index = 0;
			    }
			    showImage();
			}
			
			showImage();

           

            //브랜치, 시설 입력(선택)하면 동작하는 함수(display, 스크롤)
            document.getElementById("select-branch").addEventListener("change", function() {
	            const branchSelect = document.getElementById("select-branch");
	            const branchValue = branchSelect.options[branchSelect.selectedIndex].value;
	                        
	            if (branchValue === "a") {
	                document.getElementById("branch-b").style.display = "none";
	                document.getElementById("branch-a").style.display = "flex";
	
	                const chosenBranchDiv = document.getElementById("branch-a");
	                window.scrollTo({
	                    top: chosenBranchDiv.offsetTop,
	                    behavior: "smooth"
	                });
	
	            } else if (branchValue === "b") {
	                document.getElementById("branch-a").style.display = "none";
	                document.getElementById("branch-b").style.display = "flex";
	
	                const chosenBranchDiv = document.getElementById("branch-b");
	                window.scrollTo({
	                    top: chosenBranchDiv.offsetTop,
	                    behavior: "smooth"
	                });
	            }
       		});
          
            //시설 고르기
            let str = "";
            let getFacilNo = 0;
			//str=시설 1시간 1명 이용료
            document.querySelector('#facilities-a').addEventListener("change", function() {
                chooseFacil('#facilities-a');
            });

            document.querySelector('#facilities-b').addEventListener("change", function() {
                chooseFacil('#facilities-b');
            });

            function chooseFacil(facilityId) {
                let selectBox = document.querySelector(facilityId); // 선택된 select 요소 가져오기
                let selectedOption = selectBox.options[selectBox.selectedIndex]; // 선택된 option 요소 가져오기
                let selectedValue = selectedOption.innerHTML; // 선택된 option 요소의 innerHTML 값 가져오기
                console.log(selectedValue); // 선택된 option 요소의 innerHTML 값 출력하기. selectedValue=시설이름               
                document.querySelector('#chosenFacil').value = selectedValue; //#chosenFacil얘는 인풋타입히든임(히든에 태워서 보내?)
                let selectedFacil = document.querySelector('#chosenFacil').value; //시설명을 변수에 넣고

                $.ajax({
                    url: "/book/getPrice",
                    data:{"facilityName": selectedFacil},
                    type:"get",
                    //async : false,
                    success: function(facility){
                        for(var i = 0; i<facility.length; i++){
                            if(facility[i].facilityName==selectedFacil){ //시설명이랑 배열에 있는 애들 비교해서 
                                str=facility[i].facilityPrice; //가격 가져오기
                                getFacilNo=facility[i].facilityNo;
                                console.log(str);
                                console.log(getFacilNo);
                                
                            }
                        };
               			 document.querySelector("#facilNo").value=getFacilNo;
                         showPrice();// 아 빡쳐 일단 여기까지 해ㅠ 이렇게 하면 누르자마자 요금 div flex돼버림
                    },
                    error: function(){
                        console.log("ajax 실패 서버 처리 실패 실패실패");
                    }
                });
            }
			

            
          
            //농구코트 선택했을때 요금 안내
            document.getElementById("facilities-b").addEventListener("change", function() {
                const facilitiesSelect = document.getElementById("facilities-b");
                const facilitiesValue = facilitiesSelect.options[facilitiesSelect.selectedIndex].value;
                                    
                if (facilitiesValue === "b-2") {
                    document.getElementById("infoNumBasket").innerHTML = "※1~5명, 6~10명의 이용 요금이 동일합니다";
                } else {
                    document.getElementById("infoNumBasket").innerHTML = "";
                }
            });    

            
			//인원수 입력란
            function showPeopleInput() {
                document.getElementById("num-people").style.display = "flex";
                document.getElementById("num-people").querySelector("input[type=number]").focus();

                // 요소의 위치로 스크롤 이동
                const numPeopleDiv = document.getElementById("num-people");
                window.scrollTo({
                    top: numPeopleDiv.offsetTop,
                    behavior: "smooth"
                });
                
                let numOfPpl = document.querySelector("#numOfPpl").value;

                		
            }

            function showDateInput() {
                document.getElementById("date").style.display = "flex";
                document.getElementById("date").querySelector("input[type=date]").focus();

                // 요소의 위치로 스크롤 이동
                const dateDiv = document.getElementById("date");
                window.scrollTo({
                    top: dateDiv.offsetTop,
                    behavior: "smooth"
                });
                
                
            }

            //document.getElementById("select-branch").addEventListener("change", showFacilitiesInput);
            document.getElementById("facilities-a").addEventListener("change", showPeopleInput);
            document.getElementById("facilities-b").addEventListener("change", showPeopleInput);
            document.getElementById("num-people").addEventListener("blur", showDateInput);

            function showTimeInput() {
              document.getElementById("time").style.display = "flex";
              document.getElementById("time").querySelector("input[type=number]").focus();

              document.getElementById("time").addEventListener("blur", showPrice);

              // 요소의 위치로 스크롤 이동
              const dateDiv = document.getElementById("time");
                window.scrollTo({
                    top: dateDiv.offsetTop,
                    behavior: "smooth"
                });
                
                
              
            }

            
            function showPrice() {
                 
            	  let numOfPpl = document.getElementById("numOfPpl").value;
            	  let startTime = document.getElementById("startTime").value;
            	  let endTime = document.getElementById("endTime").value;
				  	
            	  //농구 가격 처리. 좋은 코드는 아닌거같다. 잘 바꿀수 있는 방법 생각해보기
            	  if(str==4000){
            		  if(numOfPpl >=1 && numOfPpl <=5 ){
            			  numOfPpl = 5;
            		  }else if(numOfPpl > 5 && numOfPpl <= 10 ){
            			  numOfPpl = 10;
            		  }else{
            			  numOfPpl = 100; //나중에 수정하기
            		  }
            	  }
            	  
            	  let price = str * numOfPpl * (endTime - startTime);
            		  
            	  

            	  let priceElement = document.getElementById("price");
            	  priceElement.innerHTML = "요금: " + price;
            	  document.querySelector("#bookPrice").value=price; //폼에 태워보낼애
            	  priceElement.style.display = "flex";
            	  
                
                
                document.getElementById("numOfPpl").addEventListener("change", showPrice);
                
                
                
                // 예약하기버튼 위치로 스크롤 이동
                const dateDiv = document.getElementById("price");
                window.scrollTo({
                    top: dateDiv.offsetTop,
                    behavior: "smooth"
                });

                setTimeout(function() {
                    document.querySelector("button").style.display = "flex";
                }, 2000);
                // 요소의 위치로 스크롤 이동
                const btnDiv = document.getElementsByTagName("button");
                window.scrollTo({
                    top: btnDiv.offsetTop,
                    behavior: "smooth"
                });
            }

            
            
            
            
            
           
        </script>
       
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>