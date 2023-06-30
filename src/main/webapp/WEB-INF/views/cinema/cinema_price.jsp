<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script type="text/javascript">
$(function(){
	
	$(".selector li").click(function () {
	    $(".selector li").parent().find("a").removeClass("selected");
	    $(this).addClass("selected");
	    selectedListType = $(this).data("listtype");
	    loadMovie();
	    return false;
	});
});


</script>

</head>
<body>
<jsp:include page="../nav.jsp" />
	<c:forEach var="cinema" items="${cinemaDetail }">
	<div id="container">
		<div id="content">
			<div class="section group section-theater-head"
				style="background: url('${path}/resources/images/cinema/${cinema.get('cinema_photo')}') center center no-repeat;">
				<div class="wrap">
					<span class="name-2"><span style="background: rgba(0, 0, 0, 0.4); padding-right: 5px; padding-left: 5px;"><span>${cinema.get('cinema_name') }</span></span></span>
					<span class="name-3"><span	style="background: rgba(0, 0, 0, 0.4); padding: 5px; padding-right: 5px;"><span>${cinema.get('cinema_address') }</span></span></span> 
				</div>
			</div>
			
			
		<div class="section group section-theater-body">
			<!-- 랩 -->
			<div class="wrap"> 
				<ul class="selector">
					<li class="" onclick="location.href='cinemaDetail?cinema_code=${cinema.get('cinema_code')}'">상영시간표</li>
					<li class="" onclick="location.href='cinemaLocation?cinema_code=${cinema.get('cinema_code')}'">약도/교통</li>
					<li class="" onclick="location.href ='cinemaEvent?cinema_code=${cinema.get('cinema_code')}'">이벤트</li>
					<li class="" onclick="location.href ='cinemaPrice?cinema_code=${cinema.get('cinema_code')}'">관람료</li>
				</ul>
			</div>
			<div class="title">관람료</div>
			<!-- 랩 -->
			
			<!-- 내용 -->
			<div class="wrap-event-box">
            <p style="margin:20px 0 10px 0; color:darkblue">일반</p>
	            <table class="bbs-list bbs-list-theater-price">
	                <tbody><tr>
	                    <th >구분</th>
	                    <th>성인</th>
	                    <th>경로우대</th>
	                    <th>청소년</th>
	                </tr>
	                <tr>
	                    <td class="kind1" rowspan="2">2D</td>
	                    
	                </tr>
	                <tr>
	                    <td class="price">10,000 원</td>
	                    <td class="price">5,000 원</td>
	                    <td class="price">7,000 원</td>
	                </tr>
	                <tr>
	                    <td class="kind1" rowspan="2">3D</td>
	                    
	                </tr>
	                <tr>
	                    <td class="price">15,000 원</td>
	                    <td class="price">8,000 원</td>
	                    <td class="price">10,000 원</td>
	                </tr>
	            </tbody></table>


   			 </div>

			<!-- 내용 -->
		</div>
	</div>	
</div>
</c:forEach>
<jsp:include page="../footer.jsp" />
</body>
</html>