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
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
						<span class="name-2"><span
							style="background: rgba(0, 0, 0, 0.4); padding-right: 5px; padding-left: 5px;"><span>${cinema.get('cinema_name') }</span></span></span>
						<span class="name-3"><span
							style="background: rgba(0, 0, 0, 0.4); padding: 5px; padding-right: 5px;"><span>${cinema.get('cinema_address') }</span></span></span>
					</div>
				</div>



				<div class="section group section-theater-body">
					<div class="wrap">

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
						<div class="title">이벤트</div>
					</div>
					<div class="wrap-event-box">
						<table class="bbs-list">
							<tbody>
								<tr>
									<!--<th>번호</th>-->
									<th>이벤트명</th>
									<th>이벤트기간</th>
									<th>상태</th>
								</tr>

								<tr class="__event_data">
									<td class="title" style="width: 60%; text-indent: 20px;">
										•&nbsp;&nbsp;&nbsp;<a
										href="/Event/Info?eventId=2050&amp;eventSort=-1">&lt;65&gt;
											개봉 기념 포스터 증정 이벤트</a>
									</td>
									<td class="period">2023.04.20~2023.04.25</td>
									<td class="status ing">진행중</td>
								</tr>
								<tr class="__event_data">
									<!--<td _tmplitem="2"  class="no">2051</td>-->
									<td class="title" style="width: 60%; text-indent: 20px;">
										•&nbsp;&nbsp;&nbsp;<a
										href="/Event/Info?eventId=2051&amp;eventSort=-1">&lt;존
											윅4&gt; 개봉 2주차 현장 이벤트</a>
									</td>
									<td class="period">2023.04.19~2023.04.25</td>
									<td class="status ing">진행중</td>
								</tr>
								<tr class="__event_data">
									<!--<td _tmplitem="3"  class="no">2047</td>-->
									<td class="title" style="width: 60%; text-indent: 20px;">
										•&nbsp;&nbsp;&nbsp;<a
										href="/Event/Info?eventId=2047&amp;eventSort=-1">&lt;렌필드&gt;
											개봉 기념 포스터 증정 이벤트</a>
									</td>
									<td class="period">2023.04.19~2023.04.25</td>
									<td class="status ing">진행중</td>
								</tr>
								<tr class="__event_data">
									<!--<td _tmplitem="4"  class="no">2049</td>-->
									<td class="title" style="width: 60%; text-indent: 20px;">
										•&nbsp;&nbsp;&nbsp;<a
										href="/Event/Info?eventId=2049&amp;eventSort=-1">SPECIAL
											TICKET 84</a>
									</td>
									<td class="period">2023.04.19~2023.04.25</td>
									<td class="status ing">진행중</td>
								</tr>
								<tr class="__event_data">
									<!--<td _tmplitem="5"  class="no">2044</td>-->
									<td class="title" style="width: 60%; text-indent: 20px;">
										•&nbsp;&nbsp;&nbsp;<a
										href="/Event/Info?eventId=2044&amp;eventSort=-1">&lt;더 퍼스트
											슬램덩크&gt; 15주차 현장 이벤트</a>
									</td>
									<td class="period">2023.04.15~2023.04.18</td>
									<td class="status ing">진행중</td>
								</tr>
								<tr class="__event_data">
									<!--<td _tmplitem="6"  class="no">2045</td>-->
									<td class="title" style="width: 60%; text-indent: 20px;">
										•&nbsp;&nbsp;&nbsp;<a
										href="/Event/Info?eventId=2045&amp;eventSort=-1">&lt;소울메이트&gt;
											5주차 현장 이벤트</a>
									</td>
									<td class="period">2023.04.15~2023.04.18</td>
									<td class="status ing">진행중</td>
								</tr>
								<tr class="__event_data">
									<!--<td _tmplitem="7"  class="no">2046</td>-->
									<td class="title" style="width: 60%; text-indent: 20px;">
										•&nbsp;&nbsp;&nbsp;<a
										href="/Event/Info?eventId=2046&amp;eventSort=-1">&lt;킬링
											로맨스&gt; 관람 인증 이벤트</a>
									</td>
									<td class="period">2023.04.14~2023.04.23</td>
									<td class="status ing">진행중</td>
								</tr>
								<tr class="__event_data">
									<!--<td _tmplitem="8"  class="no">2036</td>-->
									<td class="title" style="width: 60%; text-indent: 20px;">
										•&nbsp;&nbsp;&nbsp;<a
										href="/Event/Info?eventId=2036&amp;eventSort=-1">SPECIAL
											TICKET 83</a>
									</td>
									<td class="period">2023.04.14~2023.04.20</td>
									<td class="status ing">진행중</td>
								</tr>
								<tr class="__event_data">
									<!--<td _tmplitem="9"  class="no">2043</td>-->
									<td class="title" style="width: 60%; text-indent: 20px;">
										•&nbsp;&nbsp;&nbsp;<a
										href="/Event/Info?eventId=2043&amp;eventSort=-1">무비0원딜!
											&lt;슈퍼 마리오 브라더스&gt;</a>
									</td>
									<td class="period">2023.04.12~2023.05.14</td>
									<td class="status ing">진행중</td>
								</tr>
								<tr class="__event_data">
									<!--<td _tmplitem="10"  class="no">2030</td>-->
									<td class="title" style="width: 60%; text-indent: 20px;">
										•&nbsp;&nbsp;&nbsp;<a
										href="/Event/Info?eventId=2030&amp;eventSort=-1">SPECIAL
											TICKET 82</a>
									</td>
									<td class="period">2023.04.12~2023.04.18</td>
									<td class="status ing">진행중</td>
								</tr>
								<tr class="__event_data">
									<!--<td _tmplitem="11"  class="no">2032</td>-->
									<td class="title" style="width: 60%; text-indent: 20px;">
										•&nbsp;&nbsp;&nbsp;<a
										href="/Event/Info?eventId=2032&amp;eventSort=-1">SERIES
											TICKET 39</a>
									</td>
									<td class="period">2023.04.12~2023.04.18</td>
									<td class="status ing">진행중</td>
								</tr>
								<tr class="__event_data">
									<!--<td _tmplitem="12"  class="no">2033</td>-->
									<td class="title" style="width: 60%; text-indent: 20px;">
										•&nbsp;&nbsp;&nbsp;<a
										href="/Event/Info?eventId=2033&amp;eventSort=-1">&lt;거울 속
											외딴 성&gt; 관람 인증 이벤트</a>
									</td>
									<td class="period">2023.04.12~2023.04.18</td>
									<td class="status ing">진행중</td>
								</tr>
								<tr class="__event_data">
									<!--<td _tmplitem="13"  class="no">2041</td>-->
									<td class="title" style="width: 60%; text-indent: 20px;">
										•&nbsp;&nbsp;&nbsp;<a
										href="/Event/Info?eventId=2041&amp;eventSort=-1">무비0원딜!
											&lt;렌필드&gt;</a>
									</td>
									<td class="period">2023.04.11~2023.04.30</td>
									<td class="status ing">진행중</td>
								</tr>
								<tr class="__event_data">
									<!--<td _tmplitem="14"  class="no">2029</td>-->
									<td class="title" style="width: 60%; text-indent: 20px;">
										•&nbsp;&nbsp;&nbsp;<a
										href="/Event/Info?eventId=2029&amp;eventSort=-1">[씨네QX대한적십자사]
											헌혈 인증 할인!</a>
									</td>
									<td class="period">2023.04.06~2023.12.31</td>
									<td class="status ing">진행중</td>
								</tr>
								<tr class="__event_data">
									<!--<td _tmplitem="15"  class="no">2023</td>-->
									<td class="title" style="width: 60%; text-indent: 20px;">
										•&nbsp;&nbsp;&nbsp;<a
										href="/Event/Info?eventId=2023&amp;eventSort=-1">&lt;리바운드&gt;
											관람 인증 이벤트</a>
									</td>
									<td class="period">2023.04.05~2023.04.16</td>
									<td class="status ing">진행중</td>
								</tr>
								<tr class="__event_data">
									<!--<td _tmplitem="16"  class="no">1965</td>-->
									<td class="title" style="width: 60%; text-indent: 20px;">
										•&nbsp;&nbsp;&nbsp;<a
										href="/Event/Info?eventId=1965&amp;eventSort=-1">SPRING
											EDITION！ &lt;봄딸기콤보&gt; 출시</a>
									</td>
									<td class="period">2023.03.08~2023.05.31</td>
									<td class="status ing">진행중</td>
								</tr>
								<tr class="__event_data">
									<!--<td _tmplitem="17"  class="no">1934</td>-->
									<td class="title" style="width: 60%; text-indent: 20px;">
										•&nbsp;&nbsp;&nbsp;<a
										href="">카카오톡
											선물하기로 씨네Q를 만나보세요!</a>
									</td>
									<td class="period">2023.02.22~2030.12.31</td>
									<td class="status ing">진행중</td>
								</tr>
								<tr class="__event_data">
									<!--<td _tmplitem="18"  class="no">1853</td>-->
									<td class="title" style="width: 60%; text-indent: 20px;">
										•&nbsp;&nbsp;&nbsp;<a
										href="/Event/Info?eventId=1853&amp;eventSort=-1">2023 VIP
											혜택 발표</a>
									</td>
									<td class="period">2023.02.02~2024.02.01</td>
									<td class="status ing">진행중</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
	</c:forEach>


	<jsp:include page="../footer.jsp" />
</body>
</html>