<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path }/resources/css/cinema.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script type="text/javascript" src="${path}/js/main.js"></script>

</head>
<body>
	<jsp:include page="../nav.jsp" />
	<c:forEach var="cinema" items="${cinemaDetail }">
		<div id="container">
			<div id="content">
				<div class="section group section-theater-head"
					style="background: url('${path}/resources/images/cinema/${cinema.get('cinema_photo')}') center center no-repeat;">
					<div class="wrap">
						<span class="name-2"><span
							style="background: rgba(0, 0, 0, 0.4); padding-right: 5px; padding-left: 5px;"><span>${cinema.get('cinema_name') }</span></span></span>
						<span class="name-3"><span
							style="background: rgba(0, 0, 0, 0.4); padding: 5px; padding-right: 5px;"><span>${cinema.get('cinema_address') }</span></span></span>
					</div>
				</div>


				<div class="section group section-theater-body">
					<!-- 랩 -->
					<div class="wrap wrap-map">
						<ul class="selector">
							<li class=""
								onclick="location.href='cinemaDetail?cinema_code=${cinema.get('cinema_code')}'">상영시간표</li>
							<li class=""
								onclick="location.href='cinemaLocation?cinema_code=${cinema.get('cinema_code')}'">약도/교통</li>
							<li class=""
								onclick="location.href ='cinemaEvent?cinema_code=${cinema.get('cinema_code')}'">이벤트</li>
							<li class=""
								onclick="location.href ='cinemaPrice?cinema_code=${cinema.get('cinema_code')}'">관람료</li>
						</ul>
						<div class="title">약도·교통</div>
					
					<!-- 랩 -->

					<div class="addr">${cinema.get('cinema_address')}</div>
					
					<div id="map" style="width: 1000px;height: 500px; margin-bottom:50px;"></div>

					<script>
					   function myMap(){
						  let cinemaLoc = JSON.parse('${cinemaDetailJson}');
						  let cinemaX = cinemaLoc[0].cinema_x;
						  let cinemaY = cinemaLoc[0].cinema_y;
						  let cinemaName = cinemaLoc[0].cinema_name;
							
						   
					      let mapOptions = { 
					            center:new google.maps.LatLng(cinemaX, cinemaY),
					            zoom:18
					      };
					      
					      let infoWindow = new google.maps.InfoWindow({
					    	  content: cinemaName // 마커를 클릭했을 때 표시될 내용
				    	   });
					 
					      let map = new google.maps.Map(
					    		 
					    		  document.getElementById("map")
					    		  , mapOptions );
					      
					      let marker = new google.maps.Marker({
					    	  position: new google.maps.LatLng(cinemaX, cinemaY),
					    	  map: map,
					    	  draggable: true,
					    	  title: cinemaName
				    	   });
					      
					      
					      var infowindow = new google.maps.InfoWindow({
					    	  content: "아이무비 "+cinemaName
					    	  });
					    	 
					    	google.maps.event.addListener(marker,'mouseover', function() {
					    	  infowindow.open(map,marker);
					    	  });
					    	
					   }
					</script> 
					<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC2lJNuYhH3ECNOPIwPDpXYMzKVXgjlWl4&callback=myMap"></script>
					
					
				</div>
				<!--.wrap-->
		

			<div class="section group section-theater-location">
				<div class="wrap">
					<h2 class="location-title">오시는길</h2>
					<table class="table-location">
						<caption>자가용</caption>
						<tr>
							<th class="car">자가용</th>
							<td>
								<ul>
									<li>[주차안내]</li>
									<li>${cinema.get('cinema_address')}</li>
									<li>지하 1층</li>
								</ul>
							</td>
						</tr>
						<tr>
							<th class="parking">주차</th>
							<td><span class="notice">주차요금 안내</span>
								<ul>
									<li>
									<li>주차요금은 무료입니다.</li>
								</ul></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
	</c:forEach>


	<jsp:include page="../footer.jsp" />
</body>
</html>