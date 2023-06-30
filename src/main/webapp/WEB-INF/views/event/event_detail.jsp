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
		<div id="content">


			<div class="section group section-event">

				<div class="wrap-event-box">
					<table class="bbs-view bbs-view-event">
						<tbody>
							<tr>
								<th>이벤트명</th>
								<th>이벤트기간</th>
								<th>상태</th>
							</tr>
							<tr>
								<td class="title">무비0원딜! &lt;무명&gt;</td>
								<td class="date">2023.04.24~2023.05.07</td>
								<td class="status ing">진행중</td>
							</tr>
							<tr>
								<td colspan="3" class="content">
								<img src="${path }/resources/images/event/event1.png">
								</td>
							</tr>

							<tr>
								<td colspan="3" class="share">
									<ul>
										<li><a href="#" class="ks" id="kakao-share-btn">카카오스토리</a></li>
										<li><a href="#" class="bd" id="band-share-btn">밴드</a></li>
										<li><a href="#" class="fb" id="facebook-share-btn">페이스북</a></li>
									</ul>
								</td>
							</tr>
							<tr>
								<td colspan="3" class="nav"><span class="next">이전 :</span>
									<a href="Info?eventId=2066&amp;eventSort=-1">무비0원딜!
										&lt;피기&gt;</a></td>
							</tr>
						</tbody>
					</table>
					<a href="/Event/List" class="btn-bbs-list">목록</a>
				</div>

			</div>

		</div>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>