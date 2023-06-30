<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path }/resources/css/event.css" rel="stylesheet">
<link href="${path }/resources/css/common.css" rel="stylesheet">
<link href="${path }/resources/css/inc.css" rel="stylesheet">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="${path}/js/main.js"></script>
<script type="text/javascript">
	var eventId = 0;

	$(window).ready(function() {
		load_event_list();
		$(".section-event-list .btn-more").click(function() {
			load_event_list();
			return false;
		});
	});

	function load_event_list() {
		$.ajax({
			url : "eventMoreList",
			dataType : "json",
			data : {
				eventId : eventId,
				eventSort : -1
			},
			method : "POST",
			success : function(data) {
				var events = data;
				if (events.length == 0) {
					$(".section-event-list .btn-more").hide();
				} else {
					$("#template-event-list").tmpl(events).appendTo(
							".section-event-list ul");
					eventId = events[events.length - 1].EventId;
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
			}
		});
	}
</script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div id="container">
		<div id="content" style="background-color: #f9f9f9">

			
			<div class="section group section-event-list">
				<h2 class="tit">EVENT</h2>  
				<ul>
					<li>
						<a href="eventDetail">
						 <img src="https://file.cineq.co.kr/j.aspx?guid=3f9d5ccbfdd94b08aa0559b16614571c">
								<span class="desc-box"> 
									<span class="desc">&lt;더 퍼스트 슬램덩크&gt; 15주차 현장 이벤트</span>
									<span class="date">2023.04.15~2023.04.18</span>
								</span>
						</a>
					</li>
					<li>
						<a href="">
						 <img src="https://file.cineq.co.kr/j.aspx?guid=72cb2b6c2f444316ab37aad75d4fe46b">
						 <span class="desc-box"> 
							<span class="desc">무비0원딜! &lt;슈퍼 마리오 브라더스&gt;</span>
							<span class="date">2023.04.12~2023.05.14</span>
						</span>
						</a>
					</li>
					
					<li>
						<a href="">
						<img src="${path }/resources/images/event/j.png" style="height: 319px">
							<span class="desc-box">
								<span class="desc">&lt;사랑의 고고학&gt;현장 이벤트</span>
								<span class="date">2023.04.12~2023.04.18</span>
							</span>
						</a>
					</li>
					<li>
						<a href="">
							 <img src="https://file.cineq.co.kr/j.aspx?guid=f3e2192843324b2393c8d116bca68993">
							 <span class="desc-box">
								<span class="desc">무비0원딜!&lt;렌필드&gt;</span>
								<span class="date">2023.04.11~2023.04.30</span>
							</span>
						</a>
					</li>
					
				</ul>
				<a href="#" class="btn-more">더보기 +</a>
			</div>
		</div>
	</div>


	<jsp:include page="../footer.jsp" />
</body>
</html>