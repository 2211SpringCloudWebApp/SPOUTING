<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>지점 지도로 확인</title>
		<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=wzop7hd7a1"></script>
	</head>
	<body>
	<jsp:include page="../WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div id="map" style="width:100%;height:900px;"></div>
	
	<script>
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
	</script>
	
	<jsp:include page="../WEB-INF/views/common/footer.jsp"></jsp:include>
	</body>
</html>