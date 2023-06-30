<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="path" value="${pageContext.request.contextPath}" />
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>아이무비관리자페이지</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${path }/resources/css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="${path }/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript" src="${path }/resources/js/admin.js"></script>
<script type="text/javascript">

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
	$(".registPro").submit(function(){
		
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

			<!-- 		<a href="javascript:doDisplay();">dddd</a> -->
			<!-- 들어갈내용 -->
			<main>
				<!-- 영화등록모달 -->
				<div class="container modal admin-modal-register" style="display: none">
					<div class="row justify-content-center">
						<div class="col-lg-7">
							<div class="card border-1 mt-5">
								<div class="card-header">
									<button type="button" class="close-modal"
										onclick="modalClose()" style="border: none;">닫기</button>
									<h3 class="text-center font-weight-light my-4">직접영화등록</h3>
								</div>
								<div class="card-body">
									<form action="registMoviePro" class= "registPro">
									<div class="row mb-4">
                                      	<h5 style="text-align:left">포스터등록</h5>
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
													<input name="info_movie_code"class="form-control" id="info_movie_code" type="text" />
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
var data;	// ajax return을 호출 받기 위한 전역 변수 선언
//ajax에서 날짜를 보내기 위해 만든 부분
var date = new Date();
var year = date.getFullYear();
var month = ("0" + (1 + date.getMonth())).slice(-2);
var day = ("0" + date.getDate()).slice(-2);

var targetDay = year + month + day;
console.log("검색 날짜 : " + targetDay);
//	    
	$(function(){
		
	    
		$.ajax({
			url : 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?&collection=kmdb_new2',
			data :{
				ServiceKey : 'N6BL7Q77SG0M41244297',	// 서비스 키 값을 여기 표시하면 안될 것 같은데.. 어떻게 처리해야할지 모름
				releaseDts :targetDay,
				deailt : 'N',
				listCount : '200'
			},
			type : 'GET',
			dataType: 'json',
			async : false,
			success : function(result) {
				console.log(result);
				for(var i = 0; i<result.Data[0].Result.length ; i++ ){
					if(result.Data[0].Result[i].runtime == ""
						 || result.Data[0].Result[i].CommCodes.CommCode[0].CodeNo == ""
				 		 || result.Data[0].Result[i].posters == ""
						)
					{
						continue;
					}
						
					$("#api").append('<option num ="' + i + '"value="'+ result.Data[0].Result[i].title + '">' + result.Data[0].Result[i].title + '</option>'
							
					);
				}
				data = result;
			}
		});
		return data;
	});
			
// 선택버튼 눌렀을 때 
	function apibutton(){
		// 진짜 저한테 왜그러시는거에요 
 		// 에러 나올 수 있는 상황 :
 		// 1) 상영시작일이 00일 경우
	 	// 2) 상영시간이 ""인 경우
	 	// 3) 영화코드가 없는 경우
	 	// 4) 포스터가 없는 경우
	 	// 진짜 ...ㅠㅠ
	 	
		// 이미 선택되어 있는 이미지 삭제
		if($(".posterList")){
			$(".posterlist").remove();
		}
		let i = $("#api > option:selected").attr('num')
		
		console.log(data.Data[0].Result[i]);
		let info_movie_code  =data.Data[0].Result[i].CommCodes.CommCode[0].CodeNo ;
		let info_movie_title =data.Data[0].Result[i].title.trim();																					// kmdbAPI에서 title 앞에 공백이 붙어서 trim 처리
		/*줄거리*/
		let info_story = data.Data[0].Result[i].plots.plot[0].plotText;
		/*스틸컷*/
		let info_still = data.Data[0].Result[i].stlls;
		/*국가*/
		let info_nation = data.Data[0].Result[i].nation;
		/*포스터*/
		let info_movie_poster = data.Data[0].Result[i].posters.split('|')[0];
		/*관람등급*/
		let info_rating = data.Data[0].Result[i].rating;
		/*제작년도*/
		let info_year = data.Data[0].Result[i].prodYear;
		
		/*감독*/
		let info_director = data.Data[0].Result[i].directors.director[0].directorNm;
		/*배우*/
		/*상영시간 */
		let info_time = data.Data[0].Result[i].runtime;
		
		/* 23.04.12*/
		/*상영시간 00:00타입으로 변환  */
		let strNum = info_time;
		let num = parseInt(strNum);
		let date = new Date(0, 0, 0, Math.floor(num / 60), num % 60);
		let options = { hour12: false, hour: "2-digit", minute: "2-digit" };
		let runningTime = date.toLocaleTimeString("en-US", options);
		
		

		
		/*장르*/
		let info_genre = data.Data[0].Result[i].genre;
		
		
		/*상영일*/
		/* !!!! 상영예정작이 yy-MM-00인 경우에 Date에 들어가지 못해서 안받을게요...*/
		// 해결완료
		let str = data.Data[0].Result[i].repRlsDate;
		var info_showdate = str.substring(0,4) + "-" + str.substring(4,6) + "-"
		if(str.substring(6,8) == "00"){
			info_showdate +=  "01"; 
		}else{
			info_showdate +=  str.substring(6,8); 
		}
		//상영일 > 종영일 계산하기
		var info_enddate = new Date(info_showdate);
		info_enddate.setDate(info_enddate.getDate() + 100);
		console.log("info_showdate : " + info_showdate); 
	    var dateObject = new Date(info_enddate);
	    var isoDateString = dateObject.toISOString();
	    var formattedDateString = isoDateString.slice(0, 10);
	   	info_enddate = formattedDateString;
	   	
	   	$(".poster").append("<img src='"+info_movie_poster+"' name='info_movie_poster' alt='포스터' class='poster posterlist'>");
	    $('input[name=info_movie_poster]').attr('value',info_movie_poster);	//포스터		
		$('input[name=info_movie_code]').attr('value',info_movie_code);		//영화코드
		$('input[name=info_movie_title]').attr('value',info_movie_title);		//영화제목
		$('input[name=info_year]').attr('value',info_year);		//제작년도
		$('input[name=info_time]').attr('value',runningTime);		//상영시간
		$('input[name=info_showdate]').attr('value',info_showdate); //상영일
		$('input[name=info_enddate]').attr('value',info_enddate);		//종영일
		$('input[name=info_story]').attr('value',info_story);			//줄거리
		$('input[name=info_director]').attr('value',info_director);			//감독
		$('input[name=info_nation]').attr('value',info_nation);			//제작국가
		$('input[name=info_rating]').attr('value',info_rating);			//관람등급
		$('input[name=info_genre]').attr('value',info_genre);			//장르
		<!-- status DB 작업 -->
	}

</script>	

				<!-- 최신영화불러오기 -->
				<div class="container modal admin-modal-latest"
					style="display: none">
					<div class="row justify-content-center">
						<div class="col-lg-7">
							<div class="card border-1 mt-5">
								<div class="card-header" style="text-align: center">
									<button type="button" class="close-modal" onclick="modalClose()" style="border: none;">닫기</button>
									<h3 class="text-center font-weight-light my-4">상영 예정작 등록</h3>
									<span>영화목록</span><br><br>
									<select id="api" name="api" >
										<option value="none" selected="selected" disabled >상영 예정작 등록</option>
									</select>
								 <input onclick="apibutton()"type="button" value="검색">	
								</div>
								<div class="card-body">
									<div class="container">
										<div class="content">
											<div class="subscribe">
												<div class="motto">
													<form action="registMoviePro" >
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
																	<input class="form-control" id="info_movie_code" name="info_movie_code" type="text"  value="" />
																	<label for="info_movie_code">영화코드</label>
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-floating">
																	<input class="form-control" id="info_movie_title" name="info_movie_title" type="text"/> 
																	<label for="info_movie_title">영화제목</label>
																</div>
															</div>
														</div>
														<div class="row mb-3">
															<div class="col-md-6">
																<div class="form-floating">
																	<input class="form-control" id="info_year" name="info_year" type="text" />
																	<label for="info_year">제작년도</label>
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-floating mb-3 mb-md-0">
																	<input class="form-control" id="info_time" name="info_time" type="text"  />
																	<label for="info_time">상영시간</label>
																</div>
															</div>
														</div>
														<!-- 04.22 추가 -->
														<div class="row mb-3">
															<div class="col-md-6">
																<div class="form-floating">
																	<input class="form-control" id="info_rating" name="info_rating" type="text"/>
																	<label for="info_rating">관람등급</label>
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-floating mb-3 mb-md-0">
																	<input class="form-control" id="info_genre" name="info_genre" type="text"  />
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
																	<input class="form-control" id="info_enddate" name="info_enddate" type="date" value="" />
																	 <label for="info_enddate">종영일</label>
																</div>
															</div>
														</div>
														<div class="row mb-3">
															<div class="col-md">
																<div class="form-floating mb-3 mb-md-0">
																	<select class="form-control" id="info_status" name="info_status"  style="max-width: 100%">
																		<option value="screening">현재상영중</option>
																		<option value="comming">상영예정</option>
																		<option value="end">상영종료</option>
																		<option value="reScreening">재상영</option>
																	</select>
																	<label for="info_status">상영상태</label>
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
														<!-- hidden 영역 -->
														<input type="hidden" name = "info_director">
														<input type="hidden" name = "info_nation">
														<input type="hidden" name = "info_movie_poster">
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
					<h3 class="text-center font-weight-light my-4">상영예정작등록</h3>
					<input class="btn btn-block btn-more" type="button" value="영화불러오기" onclick="doLatest()">
					<table id="datatablesSimple" class="datatable-table">
						<thead>
							<tr>
								<th data-sortable="true" style="width: 8%;"><a href="#"
									class="datatable-sorter">영화코드</a></th>
								<th data-sortable="true" style="width: 10%;"><a href="#"
									class="datatable-sorter">영화제목</a></th>
									<th data-sortable="true" style="width: 8%;"><a href="#"
									 class="datatable-sorter">상영상태</a></th>
								<th data-sortable="true" style="width: 8%;"><a href="#"
									class="datatable-sorter">제작년도</a></th>
								<th data-sortable="true" style="width: 8%;"><a href="#"
									class="datatable-sorter">상영시간</a></th>
								<th data-sortable="true" style="width: 8%;"><a href="#"
									class="datatable-sorter">상영일</a></th>
								<th data-sortable="true" style="width: 8%;"><a href="#"
									class="datatable-sorter">종영일</a></th>
								<th data-sortable="true" style="width: 15%;"><a href="#"
									class="datatable-sorter">줄거리</a></th>
								<th data-sortable="true" style="width: 10%;"><a href="#"
									class="">수정/삭제</a></th>
							</tr>
						</thead>
						<!-- 회원목록 -->
						<c:forEach var="movie" items="${movieList }">
						<tbody>
							<tr style="text-align: center;" data-index="0">
								<td>${movie.get("info_movie_code") }</td>
								<td>${movie.get("info_movie_title") }</td>
								<td>${movie.get("info_status") }</td>
								<td>${movie.get("info_year") }</td>
								<td>${movie.get("info_time") }</td>
								<td>${movie.get("info_showdate") }</td>
								<td>${movie.get("info_enddate") }</td>
								<td id="info_story">${movie.get("info_story") }</td>
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
