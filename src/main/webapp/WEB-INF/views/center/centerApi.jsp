<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=wzop7hd7a1&submodules=geocoder"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		<title>지점 위치 확인</title>
		
		
		<style>
		/* COMMON */
			@font-face {
			    font-family: 'Pretendard-Regular';
			    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
			    font-weight: 400;
			    font-style: normal;
			}
			* {
			    font-family: 'Pretendard-Regular'; 
			    margin: 0;
			    padding: 0;
			    box-sizing: border-box;
			}
			
			
		/* MAIN */
			#map{
				width:100%;
				height:75vh;
				position:absolute;
 				overflow:hidden;
				margin: 0 auto;
			}
			.menu_warp {
				position: absolute;
				z-index: 1;
			}
			
			.search_tbl {
				background-color: white;
				margin : 20px;
				padding : 20px;
			}
			
			.cLocal {
				padding: 10px;
				margin-bottom: 15px;
			}
		</style>
	
	</head>
	
	
	<body>
		<jsp:include page="../../../WEB-INF/views/common/header.jsp"></jsp:include>
		
		<!-- 지도포함 -->
		<div class="main_warp">
		
			<!-- 검색창 및 테이블 -->
			<div class="menu_warp">
				<form action="/center/search" onsubmit="searchPlaces(); return false;" method="GET">
					<div class="search_tbl">
						<table>
							<tbody>
								<tr>
									<td class="al">
										<label for="searchKeyword"></label>
										<input type="text" name="centerName" required value="${center.centerName }" id="searchKeyword" class="cLocal" placeholder="지점명을 검색해보세요">
										 <input type="submit" class="cLocal" value="검색" >
									 </td>
								</tr>
								<c:if test="${empty searchResult }">
									<tr><td>해당 지점이 존재하지 않습니다.</td></tr>
								</c:if>
								<c:if test="${!empty searchResult }">
									<c:forEach items="${searchResult }" var="center">
										<input type="hidden" id="centerNo" value="${center.centerNo }">
										<tr onclick="selectMarker(marker, infoWindow)">
										    <td>${center.centerName }</td>
									    </tr>
										<tr><td>${center.centerAddr }</td></tr>
										<tr><td>${center.centerTel }</td></tr>
										<tr><td><hr></td></tr>
									</c:forEach>
								</c:if>
							</tbody>
							 
						</table>
					</div>
				</form>
			</div>
			
			<!-- 네이버 지도 출력 -->
			<div id="map"></div>
			
		</div>
		
		
		<jsp:include page="../../../WEB-INF/views/common/footer.jsp"></jsp:include>
	</body>
	
	
	<script type="text/javascript">
	
	document.querySelector("#searchKeyword").addEventListener("submit", function(e) {
		e.preventDefault();	// submit 이벤트를 취소합니다.
		
// 		var input = e.target.querySelector("input[type=text]");
		var input = e.target.querySelector("${centerName }");
		var searchValue = input.value;
		console.log(searchValue);
// 		location.href="/center/search?centerName=" + searchValue;
		
// 		input.value = searchValue;	// 검색창의 값을 유지

		
		
		
// 		var opt = e.target.options[e.target.selectedIndex];
// 		console.log(opt.value);
// 		location.href="center/search?centerName="+opt.value;

// 		e.target.value = opt.value;
	});
	
	
	$(function() {
		
		initMap();
		
	});
	
	
	function initMap() { 
		
		var areaArr = new Array();  // 지점 정보를 담는 배열 ( 지역명/위도경도 )
		areaArr.push(
						/*지점명*/					/*센터사진*/																							/*주소*/																								/*전화번호*/			/*위도*/			/*경도*/				
			 {location : '스파우팅 합정점' , photo:'<img src="/images/center/climbing.jpg" width="90%" height="100" alt="합정점" class="thumb" />', addr : '서울특별시 마포구 양화로 19 합정오피스빌딩 7층 | 서울특별시 마포구 합정동 471 합정오피스빌딩 7층' , tel : '02-526-9975' , lat : '37.549069' , lng : '126.911333'},  // 합정점 중심좌표
			 {location : '스파우팅 성수점' , photo:'<img src="/images/center/swimming.jpg" width="90%" height="100" alt="성수점" class="thumb" />', addr : '서울 성동구 아차산로15길 19 우리W타워 2층 | 서울특별시 성동구 성수동2가 277-28 우리W타워 2층' , tel : '02-233-8415' ,lat : '37.544728' , lng : '127.062106'},  // 성수점 중심좌표
			 {location : '스파우팅 여의도점' , photo:'<img src="/images/center/tennis.jpg" width="90%" height="100" alt="여의도점" class="thumb" />' , addr : '서울특별시 영등포구 의사당대로 83 오투타워 9층 | 서울특별시 영등포구 여의도동 23-6' , tel : '02-814-7788', lat : '37.523409' , lng : '126.923392'},  // 여의도점 중심좌표
	
		);
		
		
		let markers = new Array(); // 마커 정보를 담는 배열
		let infoWindows = new Array(); // 정보창을 담는 배열
		
		
// 		var HOME_PATH = window.HOME_PATH || '.';	
		
		/* 지도를 그려주는 함수 */
		var map = new naver.maps.Map('map', {
	        center: new naver.maps.LatLng(37.530235, 126.952262), //지도 시작 지점
	        zoom: 13
	    });
		
		
		// 지점을 담은 배열의 길이만큼 for문으로 마커와 정보창의 정보를 반복
		for (var i = 0; i < areaArr.length; i++) {
	
			
			/* 지점 아이콘 설정 */
// 			var markeroption = {
// 				position: position.destinationPoint(90, 15),
// 				map: map,
// 				icon : {
// 					url: HOME_PATH + '/images/center/logo.png',
// 					size : new naver.maps.Size(50, 52),
// 					origin: new naver.maps.Point(0, 0),
// 					anchor: new naver.maps.Point(25, 26)
// 				}
// 			};
			
// 			var marker = new naver.maps.Marker(markeroption);
			 
			// 지점정보를 담은 배열을 각각 부여
		    var marker = new naver.maps.Marker({
		        map: map,
		        centerphoto: areaArr[i].photo,	// 센터 사진
		        title: areaArr[i].location, // 센터 지점명 
		        position: new naver.maps.LatLng(areaArr[i].lat , areaArr[i].lng), // 지점의 위도와 경도 
		        address : areaArr[i].addr,	// 지점 주소
		        telephone : areaArr[i].tel	// 지점 전화번호
		    });
			
			
		    
		    /* 정보창 */
			 const centerNo = document.querySelector("#centerNo").value;
			 var infoWindow = new naver.maps.InfoWindow({
				 // HTML 작성 - 클릭 시 정보창에 띄울 정보 작성
			     content: '<div style="width:200px;text-align:center;padding:10px;">' + areaArr[i].photo + '<br><b>' + areaArr[i].location + '</b><br>' + areaArr[i].addr + '<br><b>☎ ' + areaArr[i].tel + '</b></div><div style="width:200px;text-align:center;padding-bottom:10px;"><a href="/book/bookView">예약하기</a><a href="/center/detail/'+ centerNo +'">자세히보기</a></div>',
			     // CSS 작성 - 정보창의 디자인 작성
			     maxWidth: 250,
				 backgroundColor: "#fff",
				 borderColor: "#3E54AC",
				 borderWidth: 1,
				 anchorSize: new naver.maps.Size(30, 30),
				 anchorSkew: true,
				 anchorColor: "#fff",
				 pixelOffset: new naver.maps.Point(20, -20)
			 });
			 
			 markers.push(marker); // 생성한 마커를 배열에 담는다
			 infoWindows.push(infoWindow); // 생성한 정보창을 배열에 담는다
			 
		}
		
		
		
		
		function selectMarker() {
			console.log("test");
		}
		 
	    function getClickHandler(seq) {
			
	            return function(e) {  // 마커를 클릭하는 부분
	                var marker = markers[seq], // 클릭한 마커의 시퀀스로 찾는다
	                    infoWindow = infoWindows[seq]; // 클릭한 마커의 시퀀스로 찾는다
	
	                if (infoWindow.getMap()) {
	                    infoWindow.close();
	                } else {
	                    infoWindow.open(map, marker); // 표출
	                }
	    		}
    	}
	    
	    for (var i=0, ii=markers.length; i<ii; i++) {
	    	console.log(markers[i] , getClickHandler(i));
	        naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i)); // 클릭한 마커 핸들러
	    }
	    
	    
	    
	    
	    
	    
	}
	
	
	
	<!-- 지도를 움직이게 해주는 함수 -->
// 	function moveMap(len, lat) {
// 		var mapOptions = {
// 			    center: new naver.maps.LatLng(len, lat),
// 			    zoom: 15,
// 			    mapTypeControl: true
// 			};
// 	    var map = new naver.maps.Map('map', mapOptions);
// 	    var marker = new naver.maps.Marker({
// 	        position: new naver.maps.LatLng(len, lat),
// 	        map: map
// 	    });
// 	}
	
	
	</script>
	

</html>
    

    
    
	
<!-- 	<script>
	var hapjeong = new naver.maps.LatLng(37.549069, 126.911333),
	    map = new naver.maps.Map('map', {
	        center: hapjeong,
	        zoom: 15
	    }),
	    marker = new naver.maps.Marker({
	        map: map,
	        position: hapjeong
	    });

	
	var contentString = [
	        '<div class="iw_inner">',
	        '   <h3>스파우팅 합정점</h3>',
	        '   <p>서울특별시 마포구 양화로 19 합정오피스빌딩 7층 | 서울특별시 마포구 합정동 471 합정오피스빌딩 7층<br />',
	        '       <img src="/images/center/climbing.jpg" width="90%" height="100" alt="합정점" class="thumb" /><br />',
	        '       02-4123-2567<br />',
	        '   </p>',
	        '</div>'

	    ].join('');
	
	var infowindow = new naver.maps.InfoWindow({
	    content: contentString,
	    maxWidth: 140,
	    backgroundColor: "#fff",
	    borderColor: "#3E54AC",
	    borderWidth: 5,
	    anchorSize: new naver.maps.Size(30, 30),
	    anchorSkew: true,
	    anchorColor: "#fff",
	    pixelOffset: new naver.maps.Point(20, -20)
	});
	
	naver.maps.Event.addListener(marker, "click", function(e) {
	    if (infowindow.getMap()) {
	        infowindow.close();
	    } else {
	        infowindow.open(map, marker);
	    }
	});
    infowindow.open(map, marker);
	</script> -->
