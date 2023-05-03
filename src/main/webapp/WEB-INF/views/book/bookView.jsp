<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page import="java.util.List" %>
    <%@page import="com.kh.spouting.book.domain.Book" %>    
<!DOCTYPE html>
<html>
	<head>
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
        
        <!-- 로컬타임 변경 라이브러리 CDN -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
        
        <!-- css -->
        <link rel="stylesheet" href="/resources/css/bookCss/bookView.css">
        <title>시설예약하기</title>
        <style>
    		.fc-toolbar-chunk{
    			--width: 180px !important;
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
	<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!폼!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
           <c:if test="${sessionScope.loginUser.userNo eq null }">
           		<div id="loginPlz">
           			로그인 후 이용해 주세요.
           		</div>
           </c:if>
           <div id="bothSide">
	           <div id="leftSide">
	           <!-- calendar 태그 -->
	              <div id="calendar"></div>
	           </div>
	           <div id="rightSide">
		           <c:if test="${sessionScope.loginUser.userNo ne null }">
			            <form action="/book/confirm" method="post">
				            <input type="hidden" name="userNo" value="${sessionScope.loginUser.userNo }">
				            
				            <div id="booking-info">
				                <div class="booking-option" id="option-branch">
				
				                  <p>지점 선택</p><br>
				                    <select id="select-branch" >
				                        <option value="" selected>선택</option>
				                        <option value="a">합정점</option>
				                        <option value="b">성수점</option>
				                        <option value="c">여의도점</option>
				                        
				                        
				                    </select>
				                </div>
				                <!--지점선택하면 시설선택 selectbox 보이기-->    
				                <div class="booking-option" id="branch-a" style="display: none;">
				                   <p>a-지점 시설 선택</p><br>
				                    <select class="facilBox" id="facilities-a"  name= "facilityName">
				                        <option value="" selected>선택</option>
				                        <option value="a-1">클라이밍센터</option>
<!-- 				                        <option value="a-2">잠수풀</option> -->
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
				                
				                 <div class="booking-option" id="branch-c" style="display: none;">
				                   <p>b-지점 시설 선택</p><br>
				                    <select class="facilBox" id="facilities-c" name= "facilityName">
				                        <option value="" selected>선택</option>
				                        <option value="c-1">잠수풀</option>
				                      
				                    </select>
				                    <div id="infoNumBasket" style="color:red; margin-bottom:20px;"></div>
				                </div>
				                
				
				                <!--시설 입력하고 입력란에서 빠져나오면 date 선택란 보이기-->
				                <div class="booking-option" id="date" style="display:none;">
				                    <p>이용 날짜</p><br>
				                    <input type="date" onchange="showTimeInput()" name="useDate">
				                </div>
				                
				                
				                <!--date 선택하면 time 란 보이기-->
				                <div class="booking-option" id="time" style="display:none;">
				               		<p>이용 시간</p>
				<!--                     input type을 time으로 쓰면 분까지 선택하는게 필수인데 굳이 그렇게 넣어서 파싱할 이유도 없음 -->
				<!--                     예)오후 1시~3시까지 이용할 경우<br>13~15 입력<br> -->
				                    <div id="timeInput">
					                    <input type="number" id="startTime" placeholder="시작시간" onchange="showPeopleInput()" min="10" name="startParam">~
					                    <input type="number" id="endTime" placeholder="종료시간" onchange="showPeopleInput()" min="11" max="18" name="endParam">
				                    </div>
				                </div>
				                
				                <!--타임선택하면 input type number 보이기-->
				                <div class="booking-option" id="num-people" style="display:none;">
				                    <p>인원 수 입력</p><br>
				                    <input type="number" id="numOfPpl" onchange="showPrice()" min="1" id="numPpl" name="numPeople">
				                </div>    
				                
				                <!--인원수까지 선택하면 요금란 보이기-->
				                <div class="booking-option" id="price" style="display:none;">
				                    <!-- 요금 뿅 튀어나오는자리 -->                     
				                </div>
						        <input type="hidden" id="chosenFacil" value="">
						        <input type="hidden" id="facilNo" value="" name="facilityNo">
						        <input type="hidden" id="bookPrice" value="" name="bookPrice">
				                <!--요금 보이고 2초 후에 결제 버튼 보이기-->
				                <button id="payment-btn" style="display:flex;">이 정보로 예약하기</button>
				        	</div>
			   
		       		 	</form>
			        </c:if>    
			    </div>    
			</div>    
        </main>   
        <br><br><br><br><br><br><br><br><br>
        
        
        <script>
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////스크립트영역 
  
            
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

           

            //브랜치 입력(선택)하면 동작하는 함수(display, 스크롤)
            document.getElementById("select-branch").addEventListener("change", function() {
	            const branchSelect = document.getElementById("select-branch");
	            const branchValue = branchSelect.options[branchSelect.selectedIndex].value;
	                        
	            if (branchValue === "a") {
	                document.getElementById("branch-b").style.display = "none";
	                document.getElementById("branch-c").style.display = "none";
	                document.getElementById("branch-a").style.display = "flex";
	
	                const chosenBranchDiv = document.getElementById("branch-a");
	                window.scrollTo({
	                    top: chosenBranchDiv.offsetTop,
	                    behavior: "smooth"
	                });
	
	            } else if (branchValue === "b") {
	                document.getElementById("branch-a").style.display = "none";
	                document.getElementById("branch-c").style.display = "none";
	                document.getElementById("branch-b").style.display = "flex";
	
	                const chosenBranchDiv = document.getElementById("branch-b");
	                window.scrollTo({
	                    top: chosenBranchDiv.offsetTop,
	                    behavior: "smooth"
	                });
	            } else if (branchValue === "c") {
	            	 document.getElementById("branch-a").style.display = "none";
	            	 document.getElementById("branch-b").style.display = "none";
		                document.getElementById("branch-c").style.display = "flex";
		
		                const chosenBranchDiv = document.getElementById("branch-c");
		                window.scrollTo({
		                    top: chosenBranchDiv.offsetTop,
		                    behavior: "smooth"
		            });
	            }        
       		});
          
            //시설 고르기
            let str = "";
            let getFacilNo = 0;
            let getMaxPeople = 0;
			//str=시설 1시간 1명 이용료
            document.querySelector('#facilities-a').addEventListener("change", function() {
                chooseFacil('#facilities-a');
            });

            document.querySelector('#facilities-b').addEventListener("change", function() {
                chooseFacil('#facilities-b');
            });
            
            document.querySelector('#facilities-c').addEventListener("change", function() {
                chooseFacil('#facilities-c');
            });


            function chooseFacil(facilityId) {
                document.querySelector("#leftSide").style.display = "block";
            	
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
                                getMaxPeople=facility[i].maxPeople;
                                console.log(str);
                                console.log(getFacilNo);
                            }
                        };
               			document.querySelector("#facilNo").value=getFacilNo;
                        showPrice();// 아 빡쳐 일단 여기까지 해ㅠ 이렇게 하면 누르자마자 요금 div flex돼버림
                        renderCalendar(getFacilNo); // 선택한 시설 캘린더 호출
                    },
                    error: function(){
                        console.log("ajax 실패 서버 처리 실패 실패실패");
                    }
                });
                
            }
			

//////////////////////////////풀캘린더//
		   
		   let timeAndPeople=[];
		   let timeAndPeopleObjArr = [];
           function renderCalendar(facilityNo) {
            console.log(facilityNo); //아 요청까진 갔는디 왜 데이터 못뿌려->타임스탬프타입 가져올때 지멋대로 형식이 변환 돼서 그럼ㅇㅇ지슨으로 고침
			  var calendarEl = document.getElementById('calendar');
			  var calendar = new FullCalendar.Calendar(calendarEl, {
			    initialView : 'dayGridMonth',
			    locale : 'ko',
			    headerToolbar : {
			      start : "prev,today,next",
			      center : "title",
			      end : 'dayGridMonth,dayGridWeek,dayGridDay'
			    },
			    selectable : true,
			    events: function(info, successCallback, failureCallback) {
			      // 이벤트 리스트를 가져오는 AJAX 요청을 보냅니다.
			      $.ajax({
			        url: '/book/calendarView',
			        type: 'GET',
			        data: 
			        	{"facilityNo": facilityNo}
			        ,
			        success: function(CurrBookings) { 
			          var events = []; //읽기전용 events는 배열임ㅇㅇ
			
			          // 서버에서 받아온 이벤트 리스트를 FullCalendar에서 사용하는 형식으로 변환.
			          CurrBookings.forEach(function(eventData) {
			        	  var event = {
			        			  title: eventData.numPeople + '명',
			        			  start: new Date(eventData.startTime),
			        			  end: new Date(eventData.endTime),
			        			  color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
			        			};
//  						var event = {
// 			              title: '1명',
// 			              start: '2023-04-12 17:06:43.0',
// 			              end: '2023-04-12 17:06:43.0',
// 			              color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
// 			            };
			
			            events.push(event);
			          });
			          successCallback(events);
			          ///////////////////////////
			          var eventsByTime = {};
						events.forEach(function(event) {
						  var startTime = event.start;
						  var endTime = event.end;
						  
						  // 이벤트가 포함된 모든 시간대를 가져와서, 시간대별로 그룹화합니다.
						  for (var t = new Date(startTime); t < new Date(endTime); t.setHours(t.getHours()+1)) {
							  var timeKey = t.toISOString();
							  eventsByTime[timeKey] = eventsByTime[timeKey] || [];
							  eventsByTime[timeKey].push(event);
							}
						});
						
						// 시간대를 로컬 시간대로 변환하여 출력합니다.
						for (var timeKey in eventsByTime) {
						  var eventsInTime = eventsByTime[timeKey];
						  var numPeople = eventsInTime.reduce(function(acc, event) {
						    return acc + parseInt(event.title, 10);
						  }, 0);
						  
						  // 시간대를 UTC에서 로컬 시간대로 변환(moment.js 라이브러리 必)
						  var localTime = moment.utc(timeKey).local().format('YY-MM-DD-HH시');
						  timeAndPeople.push(localTime, numPeople);
							
// 						  console.log('시간대:', localTime, '사용자 수:', numPeople, 'maxPeople:', getMaxPeople);
// 						  console.log(timeAndPeople);
						}
						//배열이 한거뻔에 나오냐ㅠㅠ
						function mergeTimeAndPeople(arr) {
							  const result = [];
							  for (let i = 0; i < arr.length; i += 2) {
							    result.push({
							      time: arr[i],
							      people: arr[i+1]
							    });
							  }
							  return result;
						}
						timeAndPeopleObjArr = mergeTimeAndPeople(timeAndPeople);
						console.log(timeAndPeopleObjArr); //0:{time: '23-04-12-01시', people: 3}...{}
			          
			          
			          ////////////////////////////
			        },
			        error: function(xhr, status, error) {
			          failureCallback(error);
			        }
			      });
			    },
			    dateClick: function(info){
			      var date = info.dateStr;
			      
			      calendar.changeView('timeGridWeek', date);
			      calendar.gotoDate(date);
			    }
			  });
			  
			  calendar.render();
			};
			
			
//////////////////////////////////
            //으악날짜시간배열//
            
            
            
          
            //농구코트 선택했을때 요금 안내
            document.getElementById("facilities-b").addEventListener("change", function() {
                const facilitiesSelect = document.getElementById("facilities-b");
                const facilitiesValue = facilitiesSelect.options[facilitiesSelect.selectedIndex].value;
                                    
                if (facilitiesValue === "b-2") {
                    document.getElementById("infoNumBasket").innerHTML = "※1~5명, 6~10명의 이용 요금이 동일합니다";
                    document.getElementById("infoNumBasket").style.fontSize = "smaller";
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
            document.getElementById("facilities-a").addEventListener("change", showDateInput);
            document.getElementById("facilities-b").addEventListener("change", showDateInput);
            document.getElementById("num-people").addEventListener("blur", showTimeInput);

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
            	  priceElement.innerHTML = "요금💸 " + price;
            	  document.querySelector("#bookPrice").value=price; //폼에 태워보낼애
            	  priceElement.style.display = "flex";
            	  
            	  
            	  ///////////////////////
//                 document.getElementById("numOfPpl").addEventListener("change", showPrice);
                document.getElementById("numOfPpl").addEventListener("change", function(){
                	// 입력받은 날짜
                	let date = new Date(document.querySelector("input[name=useDate]").value);
					console.log("date", date);
                	// 입력받은 시작 시간과 종료 시간
                	let startTime = Number(document.querySelector("input[name=startParam]").value);
                	let endTime = Number(document.querySelector("input[name=endParam]").value)-1;
                	console.log("startTime", startTime);
                	console.log("endTime", endTime);
                	
              	//한시간단위로 잘라서 배열에 저장
                	let hourData = Array.from({ length: endTime - startTime + 1 }, (_, i) => startTime + i);
                	console.log("hourData", hourData);
                	
                	let dateString = date.getFullYear().toString().substr(-2) + '-' + ("0" + (date.getMonth() + 1)).slice(-2) + '-' + ("0" + date.getDate()).slice(-2) + '-';
                	let hourDateData = Array.from({ length: endTime - startTime + 1 }, (_, i) => dateString + ('0' + (startTime + i)).slice(-2) + '시');
                	console.log("hourDateData",hourDateData);
                	
                	
                	let resultArr = hourDateData.map((hour) => {
                		  let peopleSum = 0;
                		  timeAndPeopleObjArr.forEach((obj) => {
                		    if (obj.time === hour) {
                		      peopleSum += obj.people;
                		    }
                		  });
                		  return peopleSum;
                		});
                		console.log(resultArr); //명수만 뽑아서 배열됨. 이중에 최대값을 뽑아야겠다.
                	

                	//최대값 출력(펼쳐서(...) 맥스값 전달)
                	let bookedPeople = Math.max(...resultArr);
                	console.log("bookedPeople", bookedPeople);//얘랑 이제 getMaxPeople 비교해서 
                	
                	let inputNumOfPpl=document.querySelector("#numOfPpl").value                	
                	let spaceAvailable = getMaxPeople-bookedPeople; //input 입력 가능 최대인원
                	console.log("inputNumOfPpl", inputNumOfPpl);
                	console.log("spaceAvailable", spaceAvailable);
                	
                	if(inputNumOfPpl<=spaceAvailable){
	                	showPrice();
                	}else{
                		alert("이용 가능 인원 수를 초과했습니다. 최대 수용 인원수:"+getMaxPeople);
                		document.querySelector("#numOfPpl").value= getMaxPeople-bookedPeople;
                	}
                	
                	
                });
                //////////////////
                
                
                // 예약하기버튼 위치로 스크롤 이동
                const dateDiv = document.getElementById("price");
                window.scrollTo({
                    top: dateDiv.offsetTop,
                    behavior: "smooth"
                });

                setTimeout(function() {
                    document.querySelector("button").style.display = "flex";
                }, 2000);
                // 버튼 위치로 스크롤 이동
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