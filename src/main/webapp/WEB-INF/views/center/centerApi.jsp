<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<!-- 지도 API 로드 -->
		<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=wzop7hd7a1&submodules=geocoder"></script>
		
		<!-- jQuery 라이브러리 로드 -->
		<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
				height:90vh;
				position:absolute;
 				overflow:hidden;
				margin: 0 auto;
			}
			.menu_warp {
				position: absolute;
				z-index: 1;
			}
			
			.search_tbl {
				width: 350px;
				height: 80%;
				border-radius: 15px;
				background-color: white;
				margin : 20px;
				padding : 20px;
				
			}
			
			
			hr {
				margin: 10px 0px 10px;
			}
			
			.cLocal {
				padding: 10px;
				margin-bottom: 15px;
			}
			
			tr span {
				border: 1px solid #444;
				border-radius: 3px;
				font-size: 13px;
				padding: 1.05px;
				color: #444;
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
									<td class="searchKeyword">
<!-- 										<label for="searchKeyword"></label> -->
										<!-- 검색어 입력 및 유지 -->
										<input type="text" name="centerName" value="${param.centerName }" class="cLocal" placeholder="지점명을 검색해보세요">
										<input type="submit" class="cLocal" value="검색" >
									</td>
								</tr>
								
								<!-- 검색결과 존재하지 않을 경우 -->
								<c:if test="${empty searchResult }">
									<tr><td>해당 지점이 존재하지 않습니다.</td></tr>
								</c:if>
								<!-- 검색 결과 존재할 경우 -->
								<c:if test="${!empty searchResult }">
									<c:forEach items="${searchResult }" var="center" varStatus="i">
										<input type="hidden" id="centerNo" value="${center.centerNo }">
										<input type="hidden" id="centerLat" value="${center.centerLat }">
										<input type="hidden" id="centerLng" value="${center.centerLng }">
										<!-- item의 index 불러오기 -->
										<tr id="clickName" onclick="clickName(${i.index});" style="color: #003cc7; font-weight:600;">
										    <td><img src="../../../resources/images/center/marker.png" width=15 height=15>  스파우팅 ${center.centerName }</td>
									    </tr>
										<tr><td style="color: #444;"><span>지번</span> ${center.centerAddr }</td></tr>
										<tr><td style="color: #444;"><span>도로명</span> ${center.centerSnaddr }</td></tr>
										<tr><td style="color: #003cc7;">${center.centerTel }</td></tr>
										<tr><td><hr></td></tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</form>
			</div>
			
			<!-- 지도 출력 -->
			<div id="map"></div>
			
		</div>
		
		
		<jsp:include page="../../../WEB-INF/views/common/footer.jsp"></jsp:include>
	</body>
	
	
	
	
	
	<script type="text/javascript">
	
		let areaMap = null;
		let areaArr = new Array();  // 지점 정보를 담는 배열 ( 지점정보 + 위도/경도 )
			<c:forEach var="area" items="${searchResult }"> 
			
				areaMap = new Object();
				areaMap.centerNo = "${area.centerNo}";
				areaMap.centerName = "${area.centerName}";
				areaMap.centerAddr = "${area.centerAddr}";
				areaMap.centerSnaddr = "${area.centerSnaddr}";
				areaMap.centerTel = "${area.centerTel}";
				areaMap.centerFilename1 = "${area.centerFilename1}";
				areaMap.centerFilename2 = "${area.centerFilename2}";
				areaMap.centerLat = "${area.centerLat}";
				areaMap.centerLng = "${area.centerLng}";

				areaArr.push(areaMap);
				
			</c:forEach>
		
		
		
		/* ======================= 지도 API ========================= */

		$(function() {
			let map = null;
			let markers = null;
			let infoWindows = null;
			
			// 지도 표출
			initMap();
		});
		
		
		
		function initMap() {
			
			// 지도 생성 함수
			map = new naver.maps.Map('map', {
				// 지도 시작 지점
		        center: new naver.maps.LatLng(37.530235, 126.952262),
		        zoom: 13
		    });
			
			
			markers = new Array(); 		// 마커 정보를 담는 배열
			infoWindows = new Array(); 	// 정보윈도우을 담는 배열
			
			
			// 지점을 담은 배열의 길이만큼 for문으로 마커와 정보윈도우의 정보를 반복
			for (let i = 0; i < areaArr.length; i++) {
				
				/* ============================ 마커 생성 ============================ */
					
				// 지점정보를 담은 배열을 각각 부여
			    let marker = new naver.maps.Marker({
			        map: map,
			        
					centernumber : areaArr[i].centerNo,
			        centerphoto: areaArr[i].centerFilename1,	// 센터 사진
			        title: areaArr[i].centerName, 	// 센터 지점명
			        address : areaArr[i].centerAddr,	// 지점 주소
			        position: new naver.maps.LatLng(areaArr[i].centerLat , areaArr[i].centerLng), // 지점의 위도와 경도
			        streetname : areaArr[i].centerSnaddr,	// 지점 도로명주소
			        telephone : areaArr[i].centerTel,	// 지점 전화번호
			        
			        
			        // 마커 아이콘
			        icon: {
			            url: '../../../resources/images/center/marker1.png',	// 이미지의 경로
			            size: new naver.maps.Size(50, 50),				// 이미지 크기 지정
			            origin: new naver.maps.Point(0, 0),				// 이미지 파일의 최상단 좌표 지정
			            anchor: new naver.maps.Point(15, 15),		// 마커의 어느 지점을 기준으로 지도상에 표시할지
			            scaledSize: new naver.maps.Size(25, 25),	// 이미지 크기 조절
			            scale: 0.5	// 이미지 크기 비율 조절
			        }
			    
			    });
				
				// 마커의 위치 및 이동 위치
				areaArr[i].marker = marker;
			    let setLatLng = new naver.maps.LatLng(areaArr[i].centerLat , areaArr[i].centerLng);
				
				
			    
			    
			    /* ============================ 정보 윈도우 생성 ============================ */
				
				// 정보윈도우 내용
				let contentString = [
					'<div style="width:200px;text-align:center;padding:11px;color:black;">',
					'	<div style="width:97%; height:100px; margin: 0 auto;">',
					'		<img src="../../../resources/images/centeruploadFiles/' + areaArr[i].centerFilename1 + '" style="width:100%; height:100%;">',
					'	</div>',
					'	<br>',
					'	<input type="hidden" id="centerNo" value="' + areaArr[i].centerNo + '">',
					'	<h3>' + areaArr[i].centerName + '</h3>',
					'	<br>',
					'	<div style="text-align:left;">',
					'		<span style="border:1px solid black; border-radius:3px; padding:1px; margin-right:6px; color:black; font-size:small; float:left;">지번</span><p style="font-size:small;">' + areaArr[i].centerAddr + '</p>',
					'		<span style="border:1px solid black; border-radius:3px; padding:1px; margin-right:6px; color:black; font-size:small; float:left;">도로명</span><p style="font-size:small;">' + areaArr[i].centerSnaddr + '</p>',
					'		<p style="font-size:medium; margin:7px 0px 4px 5px;">' + '☎ ' + areaArr[i].centerTel + '</p>',
					'	</div>',
					'</div>',
					'<div style="width:200px;text-align:center;padding-bottom:10px;">',
					'	<a href="/book/bookView" style="color: white; background-color: brown; font-size:medium;">예약하기</a>',
					'	<a href="/center/detail/'+ areaArr[i].centerNo +'" style="color: white; background-color: brown; font-size:medium;">자세히보기</a>',
					'</div>',
					'<br>'
				].join('');
			    
			    
				// 정보윈도우 CSS
				let infoWindow = new naver.maps.InfoWindow({
					 
				     content: contentString,
				     
				     maxWidth: 250,
					 backgroundColor: "white",
					 borderColor: "brown",
					 borderWidth: 1,
					 anchorSize: new naver.maps.Size(30, 30),
					 anchorSkew: true,
					 anchorColor: "white",
					 pixelOffset: new naver.maps.Point(20, -20),
				 });
				 
				
				 markers.push(marker); // 생성한 마커를 배열에 담는다
				 infoWindows.push(infoWindow); // 생성한 정보윈도우을 배열에 담는다
				 
			}
			
			
			
			
			
			/* 마커 클릭 시 정보 윈도우 띄우기 */
		    function getClickHandler(seq, item) {
				
	            return function(e) {  // 마커를 클릭하는 부분
	            	
	            	// 리스트 클릭 시 이동할 위도, 경도
	            	const mapLatLng = new naver.maps.LatLng(
	         	        Number(item.position.y),
	         	        Number(item.position.x));
	            	
	            	// panTo() : 리스트 클릭 시 지도 이동
	            	map.panTo(mapLatLng, e.coord);
	            	
	                marker = markers[seq], // 클릭한 마커의 시퀀스로 찾는다
	                infoWindow = infoWindows[seq]; // 클릭한 마커의 시퀀스로 찾는다
					
	                // 지도에 정보윈도우가 표시되고 있는 경우
	                if (infoWindow.getMap()) {
	                    infoWindow.close();	// 정보윈도우 닫기
	                } else {
	                    infoWindow.open(map, marker); // 정보윈도우 열기
	                }
	    		}
	    	}
		    
		    for (let i=0, ii=markers.length; i<ii; i++) {
		    	console.log(markers[i] , getClickHandler(i));
		        naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i, markers[i]))	// 클릭한 마커 핸들러
		    }
		    
		    
		}
		
		/* 리스트 검색 결과 클릭 시 해당 지점 정보윈도우 띄우기 */
	    function clickName(index) {
			console.log(centerLat , centerLng);
			// trigger 사용하여 'click' 이벤트 실행
			areaArr[index].marker.trigger("click");
		}
	
	
	
	
	</script>
	

</html>
