<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>아이무비관리자페이지</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${path }resources/css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="${path }/resources/js/jquery-3.6.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="${path }/resources/js/admin.js"></script>
<script type="text/javascript">

$(function () {
    $('.modal').draggable({
      handle: ".justify-content-center"
    });
 });

function doLatest() {
	let dis = document.querySelector(".admin-modal-latest");
	if (dis.style.display = "none") {
		dis.style.display = "block"
	} else {
		dis.style.display = "none";
	}
}

function doMovieRegister(){
	let dis = document.querySelector(".admin-modal-register");
	if (dis.style.display = "none") {
		dis.style.display = "block"
	} else {
		dis.style.display = "none";
	}
}

function modalClose() {
	$("form")[0].reset();
	let dis = document.querySelector(".admin-modal-register");
	let dis2 = document.querySelector(".admin-modal-latest");
// 	let dis3 = document.querySelector(".admin-modal-modify");
	dis.style.display = "none";
	dis2.style.display = "none";
// 	dis3.style.display = "none";
	
	
}

$(function(){
	$("form").submit(function(){
		
		if($("#info_movie_code").val() == null || $("#info_movie_code").val() == ""){
			alert("영화 코드를 확인해주세요.")
			return false;
		}
		
		if($("#info_rating").val() == null || $("#info_rating").val() == ""){
			console.log("관람등급을 확인해주세요.")
			return false;
		}
		
	});	
})


//이미지올리기
function previewImage(targetObj, View_area) {
	var preview = document.getElementById(View_area); //div id
	var ua = window.navigator.userAgent;

 
		var files = targetObj.files;
		
		
		for ( var i = 0; i < files.length; i++) {
			var file = files[i];
			
			var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
			if (!file.type.match(imageType))
				continue;
			
			var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
			alert(prevImg);
			if (prevImg) {
				preview.removeChild(prevImg);
			}
			var img = document.createElement("img"); 
			img.id = "prev_" + View_area;
			img.classList.add("obj");
			img.file = file;
			img.style.width = '170px'; 
			img.style.height = '210px';
			preview.appendChild(img);
			
			alert(targetObj.files.name);
			if (window.FileReader) { // FireFox, Chrome, Opera 확인.
				var reader = new FileReader();
				reader.onloadend = (function(aImg) {
					return function(e) {
						aImg.src = e.target.result;
					};
				})(img);
				reader.readAsDataURL(file);
			}
		}
}

</script>


</head>
<body class="sb-nav-fixed">
		
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="admin">IMOVIE</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"> <i
					class="fas fa-user fa-fw"></i>
			</a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="main">홈</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="logout">Logout</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<!-- 고정  -->
		<jsp:include page="admin_nav.jsp" />
		<!-- 고정 -->

		<div id="layoutSidenav_content">
			<!-- 들어갈내용 -->
			<main>
				<!-- 영화등록모달 -->
				<div class="container modal admin-modal-register" style="display: none">
					<div class="row justify-content-center">
						<div class="col-lg-7">
							<div class="card border-1 mt-5">
								<div class="card-header">
									<button type="button" class="close-modal" onclick="modalClose()" style="border: none;">닫기</button>
									<h3 class="text-center font-weight-light my-4">영화코드로 조회</h3>
									<input type="text" name="movieCdSearch" id="movieCdSearch">
								 <input onclick="movieCdSearch()"type="button" value="검색">
								</div>
								<div class="card-body">
									<form action="registMoviePro">
									<div class="row mb-4">
                                   		<div class="col-md-3 moviePoster">
                                       		<div id='View_area' style='position:relative; height: 210px; dispaly: inline;'></div>
                                        </div>
                                        
                                        <div class="col-md-8">
											<div class="filebox">
										    <input type="file" name="profile_pt" id="profile_pt" class="upload-name" onchange="previewImage(this,'View_area')">
											</div>
											
                                        </div>
                                        
                                        	
                                     </div>
									
										
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input name="info_movie_code"class="form-control" id="info_movie_code" type="text" value="" />
													<label for="info_movie_code">영화코드</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-floating">
													<input name="info_movie_title" class="form-control" id="info_movie_title" type="text" /> 
													<label for="info_movie_title">영화제목</label>
												</div>
											</div>
										</div>
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating">
													<input name="info_year" class="form-control" id="info_year" type="text"/>
													<label for="info_year">제작년도</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input name="info_time" class="form-control" id="info_time" type="" />
													<label for="info_time">상영시간</label>
												</div>
											</div>
										</div>
										<!-- 04.22 추가 -->
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating">
													<input class="form-control" id="info_rating" name="info_rating" type="text" value=""/>
													<label for="info_rating">관람등급</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" id="info_genre" name="info_genre" type="text" value="" />
													<label for="info_genre">장르</label>
												</div>
											</div>
										</div>
										<!--  -->
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input name="info_showdate" class="form-control" id="info_showdate" type="date"/>
													<label for="info_showdate">상영일</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input name="info_enddate" class="form-control" id="info_enddate" type="date" />
													 <label for="info_enddate">종영일</label>
												</div>
											</div>
										</div>
										<div class="row mb-3">
											<div class="col-md">
												<div class="form-floating mb-3 mb-md-0">
													<input name="info_story" class="form-control" id="info_story" type="text" style="max-width: 100%"/>
													<label for="inputFirstName">줄거리</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="d-grid">
												<input class="btn btn-primary btn-block" type="submit" value="등록"> 
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 등록 -->
<script>
		$(function(){
			
			var targetDay = new Date()
			
			$.ajax({
				url : 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f2a15704bc55c5e4e93c1f9bd3949e89&targetDt=20190900',
				type : 'GET',
				success : function(data) {
					var html = '';
					html += '<option selected>영화를 고르시오</option>';
					for (var i = 0; i < data.boxOfficeResult.dailyBoxOfficeList.length; i++) {
						html += '<option value="'+ data.boxOfficeResult.dailyBoxOfficeList[i].movieNm
									 +'"movieCd="'+ data.boxOfficeResult.dailyBoxOfficeList[i].movieCd
									 +'"openDt= "'+data.boxOfficeResult.dailyBoxOfficeList[i].openDt
									 		+'">'+ data.boxOfficeResult.dailyBoxOfficeList[i].movieNm + '</option>';
						
						$('#api').html(html);
						
					}
				}
			});
		});
			
			// 선택버튼 눌렀을 때 
		function apibutton(){
			var info_movie_title = $('#api').val();
			var info_movie_code = $("#api > option:selected").attr('movieCd')
			var info_showdate = $("#api > option:selected").attr('openDt')
			if($(".posterList")){
				$(".posterlist").remove();
			}
			
			$.ajax({
			url : 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=N6BL7Q77SG0M41244297&sort=prodYear,1&title='+info_movie_title,
			type : 'GET',
			dataType: 'json',
			success : function(Data) {
				
				// 수정 후 23.04.10
				// 문제됐던점 : 정렬 추가 
				/*줄거리*/
				let info_story = Data.Data[0].Result[0].plots.plot[0].plotText;
				/*스틸컷*/
				/*국가*/
				let info_nation = Data.Data[0].Result[0].nation;
				/*포스터*/
				let info_movie_poster = Data.Data[0].Result[0].posters.split('|')[0];
				/*관람등급*/
				let info_rating = Data.Data[0].Result[0].rating;
				/*제작년도*/
				let info_year = Data.Data[0].Result[0].prodYear;
				
				/*감독*/
				let info_director = Data.Data[0].Result[0].directors.director[0].directorNm;
				/*배우*/
				let info_actors = Data.Data[0].Result[0].actors.actor[0].actorNm
						  + ", " + Data.Data[0].Result[0].actors.actor[1].actorNm
						  + ", " + Data.Data[0].Result[0].actors.actor[2].actorNm;
				/*상영시간 */
				let info_time = Data.Data[0].Result[0].runtime;
				/*장르*/
				let info_genre = Data.Data[0].Result[0].genre;
				
				/* 23.04.12*/
				/*상영시간 00:00타입으로 변환  */
				let strNum = info_time;
				let num = parseInt(strNum);
				let date = new Date(0, 0, 0, Math.floor(num / 60), num % 60);
				let options = { hour12: false, hour: "2-digit", minute: "2-digit" };
				let runningTime = date.toLocaleTimeString("en-US", options);
				
				/*상영일*/
// 				let str = Data.Data[0].Result[0].repRlsDate;
// 				console.log(str)
// 				var info_showdate = str.substring(0,4) + "-" + str.substring(4,6) + "-"; 
// 				if(str.substring(6,8) == "00"){
// 					info_showdate +=  "01"; 
// 				}else{
// 					info_showdate +=  str.substring(6,8); 
// 				}
				console.log(info_showdate)
				//상영일 > 종영일 계산하기
				var info_enddate = new Date(info_showdate);
				info_enddate.setDate(info_enddate.getDate() + 100);
			    var dateObject = new Date(info_enddate);
			    var isoDateString = dateObject.toISOString();				/// 리바운드 영화 넣었을때 오류 나는 부분 
			    var formattedDateString = isoDateString.slice(0, 10);
			   	info_enddate = formattedDateString;
				   	
			   	$(".poster").append("<img src='"+info_movie_poster+"' name='info_movie_poster' alt='포스터' class='poster posterlist'>");
			    
			    
			    // 지금 무비 포스터가 input hidden으로 넣어둔 상태 
			    $('input[name=info_movie_poster]').attr('value',info_movie_poster);	//포스터		
				$('input[name=info_movie_code]').prop('value',info_movie_code);		//영화코드
				$('input[name=info_movie_title]').attr('value',info_movie_title);		//영화제목
				$('input[name=info_year]').attr('value',info_year);		//제작년도
				$('input[name=info_time]').attr('value',runningTime);		//상영시간
				$('input[name=info_showdate]').attr('value',info_showdate);		//상영일
				$('input[name=info_enddate]').attr('value',info_enddate);		//종영일
				$('input[name=info_story]').attr('value',info_story);			//줄거리
				$('input[name=info_director]').attr('value',info_director);			//감독
				$('input[name=info_nation]').attr('value',info_nation);			//제작국가
				$('input[name=info_rating]').attr('value',info_rating);			//관람등급
				$('input[name=info_genre]').attr('value',info_genre);			//장르
			},
			error:function(){
				alert("상영 정보가 확실하지 않습니다.")	
			}
			

		});
			
		}
</script>	

			<!-- 최신영화불러오기 -->
			<div class="container modal admin-modal-latest" style="display: none">
				<div class="row justify-content-center">
					<div class="col-lg-7">
						<div class="card border-1 mt-5">
							<div class="card-header" style="text-align: center">
								<button type="button" class="close-modal" onclick="modalClose()" style="border: none;">닫기</button>
								<h3 class="text-center font-weight-light my-4">최신영화등록</h3>
								<span>최신개봉 영화 목록 고르기</span><br>
								<br>
								<select id="api" name="api">
								</select>
								<input onclick="apibutton()" type="button" value="검색">
							</div>
							<div class="card-body">
								<div class="container">
									<div class="content">
										<div class="subscribe">
											<div class="motto">
												<form action="registMoviePro">
													<div class="row mb-4">
														<h6 style="text-align:left"></h6>
														<div class="col-md-3 moviePoster">
															<div id='View_area' class="poster" style='position:relative; height: 210px; dispaly: inline;'>
															</div>
														</div>
														<div class="col-md-8">
															<div class="filebox">
																<input type="file" name="profile_pt" id="profile_pt" class="upload-name" onchange="previewImage(this,'View_area')">
															</div>
														</div>
													</div>
													<div class="row mb-3">
														<div class="col-md-6">
															<div class="form-floating mb-3 mb-md-0">
																<input class="form-control" id="info_movie_code" name="info_movie_code" type="text" value=""/>
																<label for="info_movie_code">영화코드</label>
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-floating">
																<input class="form-control" id="info_movie_title" name="info_movie_title" type="text" value=""/>
																<label for="info_movie_title">영화제목</label>
															</div>
														</div>
													</div>
													<div class="row mb-3">
														<div class="col-md-6">
															<div class="form-floating">
																<input class="form-control" id="info_year" name="info_year" type="text" value=""/>
																<label for="info_year">제작년도</label>
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-floating mb-3 mb-md-0">
																<input class="form-control" id="info_time" name="info_time" type="text" value=""/>
																<label for="info_time">상영시간</label>
															</div>
														</div>
													</div>
													<!-- 04.22 추가 -->
													<div class="row mb-3">
														<div class="col-md-6">
															<div class="form-floating">
																<input class="form-control" id="info_rating" name="info_rating" type="text" value=""/>
																<label for="info_rating">관람등급</label>
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-floating mb-3 mb-md-0">
																<input class="form-control" id="info_genre" name="info_genre" type="text" value=""/>
																<label for="info_genre">장르</label>
															</div>
														</div>
													</div>
													<!--  -->
													<div class="row mb-3">
														<div class="col-md-6">
															<div class="form-floating mb-3 mb-md-0">
																<input class="form-control" id="info_showdate" name="info_showdate" type="date" value="2023-02-23"/>
																<label for="info_showdate">상영일</label>
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-floating mb-3 mb-md-0">
																<input class="form-control" id="info_enddate" name="info_enddate" type="date" value=""/>
																<label for="info_enddate">종영일</label>
															</div>
														</div>
													</div>
													<div class="row mb-3">
														<div class="col-md">
															<div class="form-floating mb-3 mb-md-0">
																<input class="form-control" id="info_story" name="info_story" type="text" style="max-width: 100%"/>
																<label for="info_story">줄거리</label>
															</div>
														</div>
													</div>
													<div class="row mb-3">
														<div class="col-md">
															<div class="form-floating mb-3 mb-md-0">
																<select class="form-control" id="info_status" name="info_status" style="max-width: 100%">
																	<option value="screening">현재상영중</option>
																	<option value="comming">상영예정</option>
																	<option value="end">상영종료</option>
																	<option value="reScreening">재상영</option>
																</select>
																<label for="info_status">상영상태</label>
															</div>
														</div>
													</div>
													<!-- hidden 영역 -->
													<input type="hidden" name="info_director">
													<input type="hidden" name="info_nation">
													<input type="hidden" name="info_movie_poster">
													<!-- hidden 영역 -->
													<div class="row">
														<div class="d-grid">
															<input class="btn btn-primary btn-block" type="submit" value="등록">
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


				<!-- 테이블 -->
				<div class="datatable-container">
					<h3 class="text-center font-weight-light my-4">🎬 상영중인 영화 🎬</h3>
					<input class="btn btn-block btn-more" type="button" value="상영예정작 등록하기" onclick="doMovieRegister()"> 
					<input class="btn btn-block btn-more" type="button" value="박스오피스 영화 등록하기" onclick="doLatest()">
<!-- 					<input class="btn btn-block btn-more" type="button" value="상영중인영화" onclick="location.href='admin_movie_register'"> -->
<!-- 					<input class="btn btn-block btn-more" type="button" value="상영종료된영화" onclick="location.href='admin_movie_register_end'"> -->
<!-- 					<input class="btn btn-block btn-more" type="button" value="재상영중인영화" onclick="location.href='admin_movie_register_reScreening'"> -->
					<select class="movie_status" onchange="location.href=this.value;">
					  <option value="admin_movie_register">상영중인 영화</option>
					  <option value="admin_movie_register_end">상영종료된 영화</option>
					  <option value="admin_movie_register_reScreening">재개봉 영화</option>
					</select>
									
					
					<table id="datatablesSimple" class="datatable-table">
						<thead>
							<tr>
<!-- 								<th data-sortable="true" style="width: 8%;"><a href="infoMovieCodeSort" class="datatable-sorter">영화코드</a></th> -->
								<th data-sortable="true" style="width: 14%;"><a href="infoMovieNameSort" class="datatable-sorter">영화제목</a></th>
								<th data-sortable="true" style="width: 8%;"><a href="#" class="datatable-sorter">상영상태</a></th>
								<th data-sortable="true" style="width: 15%;"><a href="infoStorySort" class="datatable-sorter">줄거리</a></th>
<!-- 								<th data-sortable="true" style="width: 8%;"><a href="infoYearSort"	class="datatable-sorter">제작년도</a></th> -->
								<th data-sortable="true" style="width: 10%;"><a href="infoTimeSort"	class="datatable-sorter">상영시간</a></th>
								<th data-sortable="true" style="width: 8%;"><a href="infoShowDateSort"	class="datatable-sorter">상영일</a></th>
								<th data-sortable="true" style="width: 8%;"><a href="infoEndDateSort"	class="datatable-sorter">종영일</a></th>
								<th data-sortable="true" style="width: 10%;"><a href="#" class="">수정/삭제</a></th>
							</tr>
						</thead>
						<!-- 영화목록 -->
						<c:forEach var="movie" items="${movieList }">
						<tbody>
							<tr style="text-align: center;" data-index="0">
<%-- 								<td>${movie.get("info_movie_code") }</td> --%>
								<td id="info_name">${movie.get("info_movie_title") }</td>
								<td>${movie.get("info_status") }</td>
								<td id="info_story">${movie.get("info_story") }</td>
<%-- 								<td>${movie.get("info_year") }</td> --%>
<%-- 								<td>${movie.get("info_time") }</td> --%>
								<c:set var="infoTime" value="${movie.get('info_time')}" />
								<td>
								  <c:set var="hours" value="${fn:substring(infoTime, 0, 2)}" />
								  <c:set var="minutes" value="${fn:substringAfter(infoTime, ':')}" />
								  ${hours}시간 ${minutes}분
								</td>
								<td>${movie.get("info_showdate") }</td>
								<td>${movie.get("info_enddate") }</td>
<%-- 								<td><img alt="" src="${movie.get('info_movie_poster') }"></td> --%>
								<td class="modi">
										 			 
								<input onclick="location.href='selectMovie?info_movie_code=${movie.get('info_movie_code')}'" class="btn btn-block btn-more" type="button" value="M O R E">
<!-- 								</a> -->
								</td>
							</tr>
						</tbody>
						</c:forEach>
	
					</table>
				</div>
				<!-- 테이블 -->
				
				
					<!-- 페이징처리 -->
				<div class="datatable-bottom">
					<nav class="datatable-pagination">
						<ul class="datatable-pagination-list">
							<c:choose>
								<c:when test="${empty param.pageNum }">
									<c:set var="pageNum" value="1" />
								</c:when>
								<c:otherwise>
									<c:set var="pageNum" value="${param.pageNum }"></c:set>
								</c:otherwise>
							</c:choose>

							<!-- 							 datatable-disabled -->
							<c:choose>
								<c:when test="${pageNum > 1 }">
									<li class="datatable-pagination-list-item datatable-hidden"
										onclick="location.href='admin_movie_register?pageNum=${pageNum - 1}'">
										<a data-page="${pageNum } class="datatable-pagination-list-item-link">‹</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="datatable-pagination-list-item datatable-hidden">
										<a data-page="${pageNum } class="datatable-pagination-list-item-link">‹</a>
									</li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="num" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
								<c:choose>
									<c:when test="${pageNum eq num }">
										<%-- 현재 페이지 번호일 경우 --%>
										<li class="datatable-pagination-list-item ">
										<a class="datatable-pagination-list-item-link" style="font-weight: 800; background-color: #ececec">${num }</a>
									</c:when>

									<%--페이지번호 --%>
									<c:otherwise>
										<li class="datatable-pagination-list-item ">
										<a class="datatable-pagination-list-item-link" href="admin_movie_register?pageNum=${num }">${num }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${pageNum < pageInfo.maxPage }">
									<li class="datatable-pagination-list-item datatable-hidden" onclick="location.href='admin_movie_register?pageNum=${pageNum + 1}'">
										<a data-page="${pageNum } class="datatable-pagination-list-item-link">›</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="datatable-pagination-list-item datatable-hidden">
										<a data-page="${pageNum } class="datatable-pagination-list-item-link">›</a>
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</nav>
				</div>
				




			</main>

			<!--들어갈내용 -->

			<!-- 푸터 -->
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; IMOVIE 2023</div>
						<div></div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>
