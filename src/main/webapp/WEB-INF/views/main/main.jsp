<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=3044199424b81e2522b9f9a2371b443d"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=3044199424b81e2522b9f9a2371b443d&libraries=services,clusterer"></script>
<script type="text/javascript">
	var defaultLat = "${location.lat}";
	var defaultLon = "${location.lon}";

	$(document).ready(function() {
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new daum.maps.LatLng(defaultLat, defaultLon), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
		var map = new daum.maps.Map(container, options);
		var zoomControl = new daum.maps.ZoomControl();

		var linePath = [];
		var markers = [];
		
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		
		function drawMarker(lat, lon) {
			var markerPosition  = new daum.maps.LatLng(lat, lon);
			var marker = new daum.maps.Marker({
			    position: markerPosition
			});
		
			marker.setMap(map);
			markers.push(marker);

			removeMarker();
		}
		
		function removeMarker() {
			if(markers.length > 1) {
				markers[markers.length-2].setMap(null);
			}
		}
		
		function drawLine(lat, lon) {
			linePath.push(new daum.maps.LatLng(lat, lon));
			
            // 지도에 표시할 선을 생성합니다
            var polyline = new daum.maps.Polyline({
                path: linePath, // 선을 구성하는 좌표배열 입니다
                strokeWeight: 5, // 선의 두께 입니다
                strokeColor: '#FFAE00', // 선의 색깔입니다
                strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                strokeStyle: 'solid' // 선의 스타일입니다
            });

            polyline.setMap(map);
		}
		
		/* 위치정보 가져오기 */
		setInterval(getLocation,5000);
		function getLocation() {
			$.ajax({  
				type: "GET",  
			    url: "/getLocation.do",  
			  	data: {
			  		id: "almond"
			  	},  
			  	success: function(data) {
			  		var lat = data.location.lat;
			  		var lon = data.location.lon;
			  		
			  		drawMarker(lat, lon);
			  		drawLine(lat, lon)
			  		
			  		var str =  "<hr />";
			  			str += "<div>lat : "+lat+"</div>";
			  			str += "<div>lon : "+lon+"</div>";
			  		$(".myLocation").append(str);
			  	},  
			  	dataType: "json"
			}); 
		}
	});
</script>
</head>
<body>
위치정보
<br />
<div class="myLocation" style="overflow-y: scroll; height: 100px;">
</div>

<div id="map" style="width:500px;height:400px;"></div>

</body>
</html>