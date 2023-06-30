<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>영화예매</title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/rsv/res_test.png" type="image/x-icon"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/rsv/rsv.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/rsv/rsv2.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/rsv/rsv3.css">
	<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.number.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.cookie.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/scrollbar.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/swiper.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/front.js?v=1680673895731"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/app.js?v=1680673895731"></script>
	<style type="text/css">
		.reservation-pc .body .cinema-list .list .step2 {
			overflow: auto;
		}
		.movieListDiv {
			height : 200px;
			display : flex;
			justify-content : center;
			align-items : center;
		}
	
		.mvTimeLineDiv {
			height : 200px;
			display : flex;
			justify-content : center;
			align-items : center;
		}
		.list {
			overflow : auto;
		}
	</style>
</head>
<body>
<jsp:include page="../nav.jsp"></jsp:include>

	<div class="content">
		<div class="inner2">
			<form id="dataForm" method="post" action="seat">

				<input type="hidden" id="CinemaCd" name="CinemaCd" value="all">
				<input type="hidden" id="MovieCd" name="MovieCd" value="all">
				<input type="hidden" id="ScreenTime" name="ScreenTime" value="all">
				<input type="hidden" id="ScreenCd" name="ScreenCd" value="">
				<input type="hidden" id="MovieNm" name="MovieNm" value="">
				<input type="hidden" id="CinemaNm" name="CinemaNm" value="">
				<input type="hidden" id="HidMovieUrl" name="HidMovieUrl" value="">
				<input type="hidden" id="HidRating" name="HidRating" value="">
				<input type="hidden" id="schCd" name="schCd" value="">
				<input type="hidden" id="genre" name="genre" value="">
				<input type="hidden" id="ScreenNm" name="ScreenNm" value="">
				<input type="hidden" id="MovieDate" name="MovieDate" value="">
				<input type="hidden" id="seatCnt" name="seatCnt" value="0">
				<input type="hidden" id="CnItemCd" name="CnItemCd" value="">
				<input type="hidden" id="Discount" name="Discount" value="">
				
				<div class="reservation-pc page-type">
					<div class="in-wrap">
						<div class="in-box">
							<div class="in w1200">
								<div class="head">
									<h4 class="r-h4">영화예매</h4>
									<div class="right">
										<!-- 예매다시하기 클릭시 현재페이지 새로고침 -->
										<a href="javascript:location.reload(true);" class="btn-refresh">예매다시하기</a>
									</div>
								</div>
								<!-- // head -->

								<div class="body">
									<!-- 극장 -->
									<div class="cinema-list">
										<div class="list-head">
											<h5 class="r-h5">극장</h5>
										</div>
										<div class="list">
											<!--1. 지역 선택 -->
											<div class="step1">
												<div class="scroll-wrapper scrollbar-inner" style="position: relative;">
													<div class="scrollbar-inner scroll-content scroll-scrolly_visible" style="height: auto; margin-bottom: 0px; margin-right: 0px; max-height: 533px;">
														<ul id="regionList">
<!-- 															<li> -->
<!-- 															<button type="button" class="btnTheater" title="즐겨찾는 극장" data-cd="favorite"> 즐겨찾는 극장</button></li> -->
															<li class="active"><button type="button" class="btnTheater" title="전체" data-cd="all">전체</button></li>
															<c:forEach var="location" items="${location }">
															<li><button type="button" class="btnTheater" title="${location.location_name }" data-cd="${location.location_code }">${location.location_name }</button></li>
															</c:forEach>
														</ul>
													</div>
												</div>
											</div>
											<!--2. 극장 선택 -->
											<div class="step2">
												<div class="scroll-wrapper scrollbar-inner" style="position: relative;">
													<div id="cinemaList" class="scrollbar-inner scroll-content" style="height: 533px; margin-bottom: 0px; margin-right: 0px; max-height: none;">
														<!-- 즐겨찾는 극장 클릭시 나타나는 탭 -->
														<ul class="subTheater" data-cd="favorite" style="display: none"></ul>
															
														<!-- 전체 -->
														<ul class="subTheater" data-cd="all" style="display: block;">
															<c:forEach var="cinema" items="${cinema }">
																<li>
																	<button type="button" class="btnCnItem" id="cinema_code" data-cd="${cinema.cinema_code }" title="${cinema.cinema_name }">${cinema.cinema_name }</button> 
																</li>
															</c:forEach>
														</ul>
														
														<!-- 지역 -->
														<c:forEach var="cinema" items="${cinema }">
															<ul class="subTheater" data-cd="${cinema.location_code }" style="display: none;">
																<li>
																	<button type="button" class="btnCnItem" data-cd="${cinema.cinema_code }" title="${cinema.cinema_name }">${cinema.cinema_name }</button> 
																</li>
															</ul>
														</c:forEach>
														
													</div>
													<div class="scroll-element scroll-x">
														<div class="scroll-element_outer">
															<div class="scroll-element_size"></div>
															<div class="scroll-element_track"></div>
															<div class="scroll-bar" style="width: 100px;"></div>
														</div>
													</div>
													<div class="scroll-element scroll-y">
														<div class="scroll-element_outer">
															<div class="scroll-element_size"></div>
															<div class="scroll-element_track"></div>
															<div class="scroll-bar" style="height: 100px; top: 0px;"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- // 극장 -->
									
									<!-- 영화리스트 -->
									<div class="mv-list">
										<div class="list-head">
											<h5 class="r-h5">영화</h5>
										</div>
										<div class="tab2">
											<a href="#" class="btnMovieTab" data-tab="prefer" id="btnMovieTabPrefer">선호장르</a> 
											<a href="#" class="btnMovieTab active" data-tab="all" id="btnMovieTabAll">전체</a>
										</div>
										<div class="list">
											<div class="scrollbar-inner">
												<ul id="movieList">
													
												</ul>
											</div>
										</div>
									</div>
									<!-- // 영화리스트 -->

									<!-- 날짜 -->
									<div class="date-list">
										<div class="list">
											<div class="scrollbar-inner">
												<div class="reserve-date"></div>
											</div>
										</div>
									</div>
									<!-- // 날짜 -->

									<!-- 상영시간 -->
									<div class="time">
										<div class="list-head">
											<h5 class="r-h5" style="display: inline;">상영시간</h5>
											&nbsp;
											<small style="color: red; font-size: revert;">상영임박 영화 50% 할인</small>
										</div>
										<div class="list-body">
											<div class="scroll-wrapper scrollbar-inner" style="position: relative; overflow: auto;">
												<div class="scrollbar-inner scroll-content" style="height: 305px; margin-bottom: 0px; margin-right: 0px; max-height: none;">
													<div id="timeList">
														<div class="list-type">
															<ul class="mvTimeLine">
															</ul>
														</div>
													</div>
												</div>
												<div class="scroll-element scroll-x">
													<div class="scroll-element_outer">
														<div class="scroll-element_size"></div>
														<div class="scroll-element_track"></div>
														<div class="scroll-bar" style="width: 100px;"></div>
													</div>
												</div>
												<div class="scroll-element scroll-y">
													<div class="scroll-element_outer">
														<div class="scroll-element_size"></div>
														<div class="scroll-element_track"></div>
														<div class="scroll-bar" style="height: 100px;"></div>
													</div>
												</div>
											</div>

									<div class="info-box">
											<div class="info">
												<!-- 선택후 -->
												<div class="img"></div>
												<div class="text">
													<strong><span class="mvNm"></span></strong>
													<dl>
														<dt>극장</dt>
														<dd class="cnNm"></dd>
													</dl>
													<dl>
														<dt>상영관</dt>
														<dd class="scNm"></dd>
													</dl>
													<dl>
														<dt>상영등급</dt>
														<dd class="rtNm"></dd>
													</dl>
													<dl>
														<dt>날짜</dt>
														<dd class="plDt"></dd>
													</dl>
													<dl>
														<dt>상영시간</dt>
														<dd class="tiNm"></dd>
													</dl>
												</div>
											</div>
											<div class="next">
												<button type="button" id="btnNext">인원/좌석 선택</button>
											</div>
										</div>
									</div>

								</div>
							</div>
								<!-- // 상영시간 -->
						</div>
							<!-- // body -->
					</div>
				</div>
			</div>
		</form>
	</div>
</div>


<!-- // 즐겨찾는 극장 비회원으로 클릭 했을 때 -->
	<div class="modal" id="login">
		<div class="modal-dialog" style="max-width:350px">
			<div class="modal-content">
				<div class="modal-header">
					<h4>로그인</h4>
					<button type="button" class="close-modal" data-dismiss="modal">닫기</button>
				</div>
				<div class="modal-body">
					<div class="modal-txt mb35">로그인 후 이용해 주세요.</div>
					<div class="modal-bottom flex">
						<button type="button" class="btn-modal1" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
<!-- // 관람등급안내창 -->
	<div class="modal" id="viewGrade" tabindex="-1" style="display: none;">
		<div class="modal-dialog" style="max-width: 470px; margin-top: 276px;">
			<div class="modal-content">
				<div class="modal-header">
					<h4>관람등급 안내</h4>
					<button class="close-modal btnNext"><img src="${pageContext.request.contextPath }/resources/images/rsv/x_icon.png"></button>
				</div>
				<div class="modal-body">
					<div class="thReservWrap mb30">
						<div class="thBox">
							<h3><span class="cnNm"></span> <span class="scNm"></span></h3>
							<p><span class="plDt"></span> <span class="tiNm"></span></p>
							<div class="item">
								<p class="tit"></p>
								<div class="txt"><p class="HidRatingMsg"></p></div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-bottom ">
					<button class="btn-modal2 btnNext" id="HidRatingBtn" style="width:100%">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	
<script type="text/javascript" >
var CnItemCd = ""; 	// 극장코드
var MvItemCd = ""; 	// 영화코드
var dateCd = ""; 	// 날짜 일 코드

var schCd = "";		// 영화일정코드
var screenCd = ""; 	// 상영관코드
var screenName = ""; // 상영관명
var mvTime = "";	// 상영시간
var mvDay = "";		// 상영일

	// 영화 리스트
	function moviesList() {
		$(".btnMvItem").hide();
		$.ajax({													
 			type: "GET",
 			url: "moviesList",
 			data: { 
 				CnItemCd : CnItemCd
 			},
 			dataType: "json",
 			success: function(response) { 
 				console.log("moviesList : 요청처리성공");
 				console.log(response);
 				for(let movie of response) {
 					let movieTitle = movie.info_movie_title;
 					let movieCode = movie.info_movie_code;
 					let movieImg = movie.info_movie_poster;
 					let movieRating = movie.info_rating;
 					let genre = movie.info_genre;
 					
 					var str = "";
 					str += "<li>";
 					str += "<button type=" + "'button'" + " class=" + "'btnMvItem'" + " data-cd='" + movieCode;
 					str += "' data-rat='" + movieRating;
 					str += "' data-url='" + movieImg;
 					str += "' data-genre='" + genre;
 					str += "' title='" + movieTitle + "'>";
 					str += movieTitle + "</button>";
 					str += "</li>";
 					$("#movieList").append(str);
 				}
 			},
 			error: function(xhr, textStatus, errorThrown) {
 				console.log("btnCnItem : 요청처리실패");
 			}
 		});
	}

	// 선호 영화 리스트
	function preferMoviesList() {
		$(".btnMvItem").hide();
		$.ajax({													
 			type: "GET",
 			url: "preferMoviesList",
 			data: { 
 				CnItemCd : CnItemCd
 			},
 			dataType: "json",
 			success: function(response) { 
 				console.log("preferMoviesList : 요청처리성공");
 				for(let movie of response) {
 					let movieTitle = movie.info_movie_title;
 					let movieCode = movie.info_movie_code;
 					let movieImg = movie.info_movie_poster;
 					let movieRating = movie.info_rating;
 					let genre = movie.info_genre;
 					
 					var str = "";
 					str += "<li>";
 					str += "<button type=" + "'button'" + " class=" + "'btnMvItem'" + " data-cd='" + movieCode;
 					str += "' data-rat='" + movieRating;
 					str += "' data-url='" + movieImg;
 					str += "' data-genre='" + genre;
 					str += "' title='" + movieTitle + "'>";
 					str += movieTitle + "</button>";
 					str += "</li>";
 					$("#movieList").append(str);
 				}
 			},
 			error: function(xhr, textStatus, errorThrown) {
 				console.log("preferMoviesList : 요청처리실패");
 			}
 		});
	}



	// 상영시간
	function getTimeList() {
		$(".mvTimeLineDiv").hide();
		$.ajax({
			type: "GET",
			url: "movieTimeList",
			data: {
				CnItemCd : CnItemCd,
				MvItemCd : MvItemCd,
				dateCd : dateCd
			},
			dataType: "json",
			success: function(response) {
				console.log("getTimeList : 요청처리성공");
			 	for(let movie of response) {
		 			let schCode = movie.sch_code;
		 			let screenCode = movie.screen_code;
		 			let screenName = movie.screen_name;
		 			let startTime = movie.sch_start_time;
		 			let lastTime = movie.sch_last_time;
		 			let movieDate = movie.sch_movie_date;
		 			mvDay = movie.sch_movie_date;
		 			let seatCnt = movie.seatCnt;
		 			$("#ScreenCd").val(screenCode);
		 			$("#ScreenNm").val(screenName);
		 			$("#MovieDate").val(movieDate);
		 			var str = "";
		 			str += "<li>";
		 			str += "<button type=" + "'button'" + " class=" + "'btnTime'" + " data-cd='" + schCode;
		 			str += "' data-seq='" + screenCode;
		 			str += "' data-sn='" + screenName;
		 			str += "' data-st='" + startTime;
		 			str += "' data-lt='" + lastTime;
		 			str += "'>";
		 			str += "<div class='loc'>" + screenName + "</div>";
		 			str += "<div class='info'>";
		 			str += "<p class='time'>" + startTime + "<span>~" + lastTime + "</span></p>";
		 			str += "<p class='num'>";
		 			str += seatCnt;
		 			str += "/<span>45석</span></p>";
		 			str += "</div>";
		 			str += "</button>";
		 			str += "</li>";
					$(".mvTimeLine").append(str);
					setDay();
	 				}
				},
			error: function(xhr, textStatus, errorThrown) {
				console.log("getTimeList : 요청처리실패");
			}
		});
	}
	
	
	// 할인 가능한 영화인지 확인
	function discount() {
		console.log($("#schCd").val());
		
		$.ajax({
			type: "GET",
			url: "discount",
			data: { 
				schCd : $("#schCd").val()
			},
			dataType: "text",
			success: function(response) {
				console.log("discount : 요청처리성공");
				console.log(response);
				if(response != "") {
					console.log("null이 아님");
					$("#Discount").val("0.5");
					console.log($("#Discount").val());
				} else {
					console.log("null");
				}
			},
			error: function(xhr, textStatus, errorThrown) {
				console.log("discount : 요청처리실패");
// 			    alert("code:"+xhr.status+"\n"+"message:"+textStatus.responseText+"\n"+"error:"+errorThrown);
			}
		});
	}
	
	
	// 최종 선택 미리보기 (우측 상영시간 하단)
	// 영화
	function setMovie() {
		var cd = $("#MovieCd").val();
		if (cd == "all") {
			$(".info .img img").remove();
			$(".info .mvNm").html("&nbsp;");
			$(".info .rtNm").text(""); // 상영등급
			
			$("#HidRating").val("");
			$("#HidMovieUrl").val("");
			
		} else {
			var obj = $('.btnMvItem[data-cd="' + cd + '"]');
			console.log(obj);
			$(".info .img img").remove();
			$(".info .img").append('<img src="' + obj.data("url") + '">');
			$(".info .mvNm").text(obj.attr("title"));
			$(".info .rtNm").text(obj.data("rat"));

			$("#HidRating").val(obj.data("rat"));
			$("#HidMovieUrl").val(obj.data('url'));
			$("#MovieNm").val(obj.attr("title"));
		}
	}
	
	// 극장
	function setCinema() {
		var cd = $("#CinemaCd").val(); ;
		if (cd == "all") {
			$(".cnNm").text("");
		} else {
			var obj = $('.btnCnItem[data-cd="' + cd + '"]');
			$(".cnNm").text(obj.attr('title'));
		}
	}
	
	// 상영관명, 상영시간
	function setTime() {
		$(".scNm").text(screenName); 	// 상영관명
		$(".tiNm").text(mvTime); 		// 상영시간
	}
	
	
	// 날짜
	function setDay() {
		$(".plDt").text(mvDay); 
	}
	
	// 최종 선택 미리보기 end
	
	
	// 날짜 선택
	const date = new Date();
	const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
	const reserveDate = document.querySelector(".reserve-date");
	
    const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"]
    const year = date.getFullYear();
    const month = date.getMonth() + 1;
    
    // i = 일
    for (i = date.getDate(); i <= lastDay.getDate(); i++) {
		
        const dateButton = document.createElement("button");
        dateButton.setAttribute('type', 'button');    // submit 막기
        const spanWeekOfDay = document.createElement("span");
        const spanDay = document.createElement("span");

        
        
        //class넣기
        dateButton.classList = "movie-date-wrapper"
        spanWeekOfDay.classList = "movie-week-of-day";
        spanDay.classList = "movie-day";

        //weekOfDay[new Date(2023-04-00)]
        const dayOfWeek = weekOfDay[new Date(year + "-" + month + "-" + i).getDay()];
        
        //요일 넣기
        if (dayOfWeek == "토") {
            spanWeekOfDay.classList.add("saturday");
            spanDay.classList.add("saturday");
        } else if (dayOfWeek == "일") {
            spanWeekOfDay.classList.add("sunday");
            spanDay.classList.add("sunday");
        }
        spanWeekOfDay.innerHTML = dayOfWeek;
        dateButton.append(spanWeekOfDay);
        
        //날짜 넣기
        spanDay.innerHTML = i;
        spanDay.setAttribute("data-cd", i);	// span 태그 안 : 각 버튼 data-cd 날짜 데이터 저장 (1,2,3,4,5...30)
        dateButton.append(spanDay);
        reserveDate.append(dateButton);

        dayClickEvent(dateButton);
    }

        

	function dayClickEvent(dateButton) {
		dateButton.addEventListener("click", function() {
		const movieDateWrapperActive = document.querySelectorAll(".movie-date-wrapper-active");
		movieDateWrapperActive.forEach((list) => {
		list.classList.remove("movie-date-wrapper-active");
			})
		dateButton.classList.add("movie-date-wrapper-active");
		})
	}
	
	
	
	
	$(function() {
		if ($("#MovieCd").val() != "all" && $("#CinemaCd").val() != "all" && $("#ScreenTime").val() != "all") {
			getTimeList();
		}
		
		
		if ($("#CinemaNm").val() == "") {
			var str = "<div class='movieListDiv'>극장을 먼저 선택해주세요.</div>";
			$("#movieList").append(str);
		}
		if ($("#MovieNm").val() == "" && $("#MovieDate").val() == "") {
			var str = "<div class='mvTimeLineDiv'>예매할 영화와 날짜를 선택후 <br>";
			str += "상영시간 조회가 가능합니다</div>";
			$(".mvTimeLine").append(str);
		}
 	

		// 지역 클릭시 극장 출력
		$(".btnTheater").on("click", function(e){
			var cd = $(this).data("cd");
			
			// 클릭한 지역 배경색 전환
			$(".btnTheater").parent().removeClass("active");
			$(this).parent().addClass("active");
			
			
			$(".subTheater").hide();
			$('.subTheater[data-cd="' + cd + '"]').show();
			
			
		});
		// 극장 클릭시 영화리스트 출력
		$(".btnCnItem").on("click", function(e){
			$(".btnMovieTab").removeClass("active");
			$("#btnMovieTabAll").addClass("active");
			$(".btnTime").hide();
			$(".movie-date-wrapper-active").removeClass("movie-date-wrapper-active");
			$(".movieListDiv").hide();
			CnItemCd = $(this).data("cd");
			var cinemaNm = $(this).attr("title");
			$("#CnItemCd").val(CnItemCd);
			$("#CinemaNm").val(cinemaNm);
			$(".btnMvItem").hide();
			
			moviesList();
			
			$(".btnCnItem").parent().removeClass("check");
			if ($("#CinemaCd").val() == $(this).data("cd")) {
				$("#CinemaCd").val("all");
			} else {
				$("#CinemaCd").val($(this).data("cd"));
				$('.btnCnItem[data-cd="' + $(this).data("cd") + '"]').parent().addClass("check"); // 극장 클릭시 테두리
			}
			setCinema();
			
		});
	
		// 선호장르 | 전체(default) 클릭
		$(".btnMovieTab").on("click", function(e) { 
			e.preventDefault();
			$(".btnMovieTab").removeClass("active");
			$(this).addClass("active");
			var movieTab = $(this).data("tab");
			var CnItemCd = $("#CnItemCd").val()
			
			if (movieTab == "all") {
				moviesList();
			}
			if (movieTab == "prefer") {
				preferMoviesList();
			}
		});
		
		// 영화리스트 클릭
		$(document).on("click", ".btnMvItem", function(e) {
			$(".btnTime").hide();
			$(".movie-date-wrapper-active").removeClass("movie-date-wrapper-active");
			MvItemCd = $(this).data("cd");
			var genre = $(this).data("genre");
			$("#genre").val(genre);
			e.preventDefault();
			$("#movieList li").removeClass("check");
			if ($("#MovieCd").val() == $(this).data("cd")) {
				$("#MovieCd").val("all");
			} else {
				$("#MovieCd").val($(this).data("cd"));
				$(this).parent().addClass("check");
			}
			setMovie();
			setTime();
		});
	
		// 날짜 클릭
		$(".movie-day").on("click", function(e){
			dateCd = $(this).data("cd");
			$(".btnTime").hide();
			getTimeList();
		});
		
		
		// 상영시간 클릭
		$(document).on("click", ".btnTime", function(){
			var startTime = $(this).data("st");
			var lastTime = $(this).data("lt");
			mvTime = startTime + "~" + lastTime;
			screenName = $(this).data("sn");

			$(".btnTime").parent().removeClass("check");
			
			$("#ScreenTime").val(mvTime);
			$("#schCd").val($(this).data("cd"));
			$('.btnTime[data-cd="' + $(this).data("cd") + '"]').parent().addClass("check"); // 클릭시 테두리
			setTime();
			$("#Discount").val("");
			discount();
			
		});
		
		
		
		$(document).on("click", "#btnNext", function() {
			console.log($("#Discount").val());
			$(".tit").empty();
			var CinemaCd = $("#CinemaCd").val();
			var MovieCd = $("#MovieCd").val();
			var ScreenTime = $("#ScreenTime").val();
			var HidRating = $("#HidRating").val();
			var age = "전체"; 
			if ((CinemaCd != "all") && (MovieCd != "all") && (ScreenTime != "all")) {
				$(".tit").append(HidRating);
				// 관람 등급 별 메시지
				switch(HidRating) {
					case "12세관람가": {
						age = 12; break;
					}
					case "15세관람가": {
						age = 15; break;
					}
					case "18세관람가(청소년관람불가)": {
						age = 18; break;
					}
					default: 
				}
				if(age != "전체") {
					$(".HidRatingMsg").append("본 영화는 만 " + age + "세 이상 관람 가능한 영화입니다. </p><p> 만 " + age + "세 미만 고객은 부모님 또는 만 19세 이상 보호자 동반 시 관람이 가능합니다. </p><p> 연령 확인 불가 시 입장이 제한 될 수 있습니다. </p><p> ※ 보호자란? : 만 19세 이상의 성인 보호자 (고등학교 재학생 불가) ");
				}
				$("#viewGrade").show();
				} else {
					alert("영화와 상영시간을 모두 선택시 좌석 선택이 가능합니다.")
				}
		});
		
		// 관람등급창
		$(document).on("click", "#HidRatingBtn", function() {
			$("#dataForm").submit();
		});
		
		// 모달창 닫기
		$(document).on("click", ".close-modal", function() {
			$(".modal").hide();
		});
		
}); //function end	

		
</script> 
<!-- // footer -->
<jsp:include page="../footer.jsp"></jsp:include>
		
</body>
</html>