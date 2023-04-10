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
        <title>시설예약하기</title>
        <style>
        @font-face {
             font-family: 'Pretendard-Regular';
             src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
             font-weight: 400;
             font-style: normal;
         }
         @font-face {
		    font-family: 'Chosunilbo_myungjo';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Chosunilbo_myungjo.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		main{
    --background-color: #1C3879;
}
/*상단포토슬라이드*/

#image-wrapper{
    background-color: #607EAA;
    width: 100%;
    height: 250px;
    position: relative;
}
#image-wrapper img {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  opacity: 0;
  transition: opacity 1s ease-in-out;
}

#image-wrapper .active {
  opacity: 1;
}

#image-wrapper p{  
  font-family: 'Chosunilbo_myungjo';
  position: absolute;
  top: 60%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2;
  color: white;
  font-size: 3em;
  font-weight: 500;
}

/*예약폼*/
#booking-info{
    display: flex;
    flex-direction: column;
    align-items: center;
    padding-top: 70px;
}

#booking-info > div{ 
    display: flex;
    flex-direction: column;
    align-items: center;
}
.booking-option p{
    text-align: center;
    border: 1px solid black;
  border-radius: 20px;
  padding: 10px;
  width: 140px;
  margin-bottom: 0px;
}

/*인풋타입 스타일들*/
#booking-info input[type="number"],
#booking-info input[type="date"],
#booking-info select {
  
  font-size: 1em;  
  --margin-top: 10px;
  margin-bottom: 20px;  
  border: none;
  border-bottom: 1px solid black;
  --width: 120px;
  text-align: center;
  appearance: none;
  -moz-appearance: none;
  -webkit-appearance: none;
  --background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='10' height='6' viewBox='0 0 10 6'%3E%3Cpath fill='%23000000' d='M5 6L0 .5h10L5 6z'/%3E%3C/svg%3E");
  background-repeat: no-repeat;
  background-position-x: 95%;
  background-position-y: center;
}
#time input{
    width: 70px;
}
#time div{
	float: left
}
#booking-info input[type="date"],
#booking-info select,
#num-people input {
    width: 120px;
}

input:focus, select:focus {
  outline: none;
  border-bottom: 1px solid black;
}

#booking-info select::-ms-expand {
  display: none;
}

#booking-info option {
  color: black;
  background-color: white;
}


#price, #payment-btn{
    margin-top: 20px;
}
#timeInput{
display: flex;
flex-direction: row;
}
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

            <div id="booking-info">
                <div class="booking-option" id="option-branch">
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
                    <select class="facilBox" id="facilities-a" >
                        <option value="" selected>선택</option>
                        <option value="a-1">클라이밍센터</option>
                        <option value="a-2">잠수풀</option>
                    </select>
                </div>
            
                <div class="booking-option" id="branch-b" style="display: none;">
                   <p>b-지점 시설 선택</p><br>
                    <select class="facilBox" id="facilities-b" >
                        <option value="" selected>선택</option>
                        <option value="b-1">테니스장</option>
                        <option value="b-2">농구코트</option>
                    </select>
                    <div id="infoNumBasket" style="color:red; margin-bottom:20px;"></div>
                </div>
                
                <!--시설선택하면 input type number 보이기-->

                <div class="booking-option" id="num-people" style="display:none;">
                    <p>인원 수 입력</p><br>
                    <input type="number" onchange="showDateInput()" min="1" id="numPpl">
                </div>    

                <!--인원 입력하고 입력란에서 빠져나오면 date 선택란 보이기-->
                <div class="booking-option" id="date" style="display:none;">
                    <p>이용 날짜</p><br>
                    <input type="date" onchange="showTimeInput()">
                </div>
                <!--날짜 선택하면 풀캘린더 API 등장 ㅜㅜ 우얄꼬-->
                

                <!--date 선택하면 time 란 보이기-->
                <div class="booking-option" id="time" style="display:none;">
                    <p>이용 시간</p><br>
                   
<!--                     input type을 time으로 쓰면 분까지 선택하는게 필수인데 굳이 그렇게 넣어서 파싱할 이유도 없음 -->
<!--                     예)오후 1시~3시까지 이용할 경우<br>13~15 입력<br> -->
					<div>
                    <div id="timeInput">
	                    <input type="number" id="startTime" placeholder="시작시간" min="0">~
	                    <input type="number" id="endTime" placeholder="종료시간" onchange="showPrice()" min="1">
                    </div>
                    </div>
                </div>
                <!--time까지 선택하면 요금란 보이기-->
                <div class="booking-option" id="price" style="display:none;">
                    요금: <!-- {facilities.price} x인원x시간 -->
                    
                </div>
                <!--요금 보이고 2초 후에 결제 버튼 보이기-->
                <button id="payment-btn" style="display:none;">이 정보로 예약하기</button>
            </div>
        </main>   
        <br><br><br><br><br><br><br><br><br><br><br><br>
        <input type="hidden" id="chosenFacil" value="">
        
        
        <script>
            
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
            	if(images.length>0){
		            images[index - 1].classList.remove('active');    		
            	}
            showImage();
            }

           
            
            
            
            
            
          //포커스에 따른 자동 스크롤
            window.addEventListener('lord', function(){
              var inputs = document.querySelectorAll('');
            })


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
          
          //이름 값 가져다 주고 가격 받아오기 아작쓰 도전
            document.querySelector('.facilBox').addEventListener("change", function(){
	            let selectBox = document.querySelector('.facilBox'); // 선택된 select 요소 가져오기
	            let selectedOption = selectBox.options[selectBox.selectedIndex]; // 선택된 option 요소 가져오기
	            let selectedValue = selectedOption.innerHTML; // 선택된 option 요소의 innerHTML 값 가져오기
	            console.log(selectedValue); // 선택된 option 요소의 innerHTML 값 출력하기. selectedValue=시설이름
	            document.querySelector('#chosenFacil').value=selectedValue;
          	    let selectedFacil= document.querySelector('#chosenFacil').value //이게 시설명
	            
            	
            	$.ajax({
            		url: "/book/getPrice",
            		data:{"facilityName": selectedFacil},
            		type:"get",
            		success: function(facility){
            			let str="";
            			for(var i = 0; i<facility.length; i++){
            				if(facility[i].facilityName==selectedFacil){
            					str=facility[i].facilityPrice;
            					console.log(str);
            					
            					//여기까지 했다!! 콘솔 출력된다(갬격)
            				}
            			};
            		},
            		error: function(){
            			console.log("ajax 실패 서버 처리 실패 실패실패");
            		}
            		
            	});
             })
//           	  let facilities = []; //배열임
//           	  let facilityPrice; //가격을 찾아낼것
//           	  <c:forEach var="facility" items="${fList}">
// 	          	  	var facilityOne = {};
// 	          	 	facilityOne.facilityName = "${facility.facilityName}";
// 	          	  	facilityOne.facilityPrice = "${facility.facilityPrice}";
//         	  		facilities.push(facilityOne);
//           	  </c:forEach>
//           	  facilities.forEach(function(facility){//배열에서 객체 뽑아냄
//           		  if(facility.facilityName==selectedFacil){
//           			  facilityPrice = facility.facilityPrice;
          			 
//           		  }
//           	  })
//           	  console.log(facilityPrice);
            
//            console.log("${fList }");
//           인원수= document.querySelector('#numPpl').value            
//           이용시간= document.querySelector('#endTime').value-document.querySelector('#startTime').value
            
            
            
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

            

            function showPeopleInput() {
                document.getElementById("num-people").style.display = "flex";
                document.getElementById("num-people").querySelector("input[type=number]").focus();

                // 요소의 위치로 스크롤 이동
                const numPeopleDiv = document.getElementById("num-people");
                window.scrollTo({
                    top: numPeopleDiv.offsetTop,
                    behavior: "smooth"
                });
                
    			//console.log(documentnum-people)
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
                document.getElementById("price").style.display = "flex";
                // 요소의 위치로 스크롤 이동
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