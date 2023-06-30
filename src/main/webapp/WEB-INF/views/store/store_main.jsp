<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/common.css" rel="stylesheet">
<link href="resources/css/inc.css" rel="stylesheet">
<link href="resources/css/sub.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/main.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$('ul.tab li').click(function() {
		var activeTab = $(this).attr('data-tab');
		$('ul.tab li').removeClass('current');
		$('.tabcontent').removeClass('current');
		$(this).addClass('current');
		$('#' + activeTab).addClass('current');
	})
});
</script>

</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div id="container">
	<div id="contents" class="">
		
		<!-- inner-wrap -->
		<div class="inner-wrap">

			<h2 class="tit">스토어</h2>
			<!--  탭메뉴 -->
			<div class="tab-list fixed">
				<ul class="tab">
					<li class="current" data-tab="tab1"><a href="#">기프트카드</a></li>
					<li data-tab="tab2"><a href="#">팝콘/음료/굿즈</a></li>
					<li data-tab="tab3"><a href="#">메가티켓</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabcontent current">
				<div class="store-list mt30">
					<ul class="list">
					<c:forEach var="gift" items="${gift }">
						<li class="func"><a href="store_detail?item_code=${gift.get('item_code') }" title="${gift.get('item_name') } 상세보기">
								<div class="soldout">SOLD OUT</div>
								<div class="label ${gift.get('item_status') }"> ${gift.get('item_status') }</div>
								<div class="img">
									<img
										id="img"
										src="${gift.get('item_image') }"
										alt="" onerror="noImg(this);">
								</div>
								<div class="info">
									<div class="tit">
										<p class="name">${gift.get('item_name') }</p>
										<p class="bundle">${gift.get('item_detail') }</p>
									</div>
									<div class="price">
										<p class="original"></p>
										<p class="sale">
											<em>${gift.get('item_price') }</em> <span>원</span>
										</p>
										<p class="ea"></p>
									</div>
								</div>
						</a></li>
					</c:forEach>
					</ul>
				</div>
			</div>
			<!-- store-list -->
			<div id="tab2" class="tabcontent">
				<div class="store-list mt30">
					<ul class="list">
						<c:forEach var="food" items="${food }">
						<li class="func"><a href="store_detail?item_code=${food.get('item_code') }" title="${food.get('item_name') } 상세보기">
								<div class="soldout">SOLD OUT</div>
								<div class="label ${food.get('item_status') }"> ${food.get('item_status') }</div>
								<div class="img">
									<img
										id="img"
										src="${food.get('item_image') }"
										alt="" onerror="noImg(this);">
								</div>
								<div class="info">
									<div class="tit">
										<p class="name">${food.get('item_name') }</p>
										<p class="bundle">${food.get('item_detail') }</p>
									</div>
									<div class="price">
										<p class="original"></p>
										<p class="sale">
											<em>${food.get('item_price') }</em> <span>원</span>
										</p>
										<p class="ea"></p>
									</div>
								</div>
						</a></li>
					</c:forEach>
					</ul>
				</div>
				<!--// store-list -->
			</div>
			<div id="tab3" class="tabcontent">
				<div class="store-list mt30">
					<ul class="list">
					<c:forEach var="ticket" items="${ticket }">
						<li class="func"><a href="store_detail?item_code=${ticket.get('item_code') }" title="${ticket.get('item_name') } 상세보기">
								<div class="soldout">SOLD OUT</div>
								<div class="label ${ticket.get('item_status') }"> ${ticket.get('item_status') }</div>
								<div class="img">
									<img
										id="img"
										src="${ticket.get('item_image') }"
										alt="" onerror="noImg(this);">
								</div>
								<div class="info">
									<div class="tit">
										<p class="name">${ticket.get('item_name') }</p>
										<p class="bundle">${ticket.get('item_detail') }</p>
									</div>
									<div class="price">
										<p class="original"></p>
										<p class="sale">
											<em>${ticket.get('item_price') }</em> <span>원</span>
										</p>
										<p class="ea"></p>
									</div>
								</div>
						</a></li>
					</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"/>
</body>
</html>