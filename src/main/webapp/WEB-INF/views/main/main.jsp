<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setInterval(function() {
			$.ajax({  
				type: "GET",  
			    url: "/getLocation.do",  
			  	data: {
			  		id: "almond"
			  	},  
			  	success: function(data) {
			  		console.log(data);
			  		var str =  "<hr />";
			  			str += "<div>lat : "+data.location.lat+"</div>";
			  			str += "<div>lon : "+data.location.lon+"</div>";
			  		$(".myLocation").append(str);
			  	},  
			  	dataType: "json"
			}); 
		},5000);
	});
</script>
</head>
<body>
위치정보
<br />
<div class="myLocation">
</div>
</body>
</html>