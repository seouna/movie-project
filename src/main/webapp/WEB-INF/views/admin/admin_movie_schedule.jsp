<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>아이무비관리자페이지</title>
<link href="${pageContext.request.contextPath }/resources/css/styles.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<!-- <link href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"> -->
<link href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script type="text/javascript">
function selectCinema(){
	let register_date = $("#sch_register_date").val();
	if(register_date == "") {
		alert("날짜를 먼저 선택하세요");
		return; // 다음 작업이 진행되지 않도록 함수 종료
	}
	
	
	//지점 > 상영관
	$.ajax({
		type: "POST",
		url: "screenSelect",
		data: {
			cinema_code: $(".cinema_name option:selected").val(),
		  	cinema_name: $(".cinema_name option:selected").text(),
		  	movie_code: $(".sch_movie_name option:selected").val()
		},
		success: function(result){ // 요청 처리 성공시 자동으로 호출되는 콜백함수
			$(".selectScreen_name option").remove();
			$(".selectScreen_name").append( '<option value="none" selected="selected" disabled>상영관을 선택하세요</option>');
			$(".selectScreen_name").append('<option value="none" disabled>=======================</option>');
			for(var i=0; i<result.length; i++){
				$(".selectScreen_name").append('<option value="' +result[i].screen_code + '">' + result[i].screen_name + '</option>');
			}
		},
		error:function(request,status,error){
	     
		}
	});// 지점 > 상영관 ajax
}// selectCinema()

function selectSch(){
	
		$.ajax({
			type: "POST",
			url: "schCheckTime",
			data: {
				sch_date: $("#sch_register_date").val(),
				cinema_name: $(".cinema_name option:selected").text(),
				screen_name: $(".screen_name option:selected").text(),
				movie_code: $(".sch_movie_name option:selected").val()
			},
			success: function(result){
				let disabledValues = [];
				let infoTimes=[];
				let cinemaNames=[];
				$(".sch_start_time option").remove();
				$("select.sch_start_time").append('<option value="none" selected="selected" disabled style="background-color: #fff">영화시작시간을 선택하세요</option>');
				$("select.sch_start_time").append('<option value="none" disabled style="background-color: #fff">=======================</option>');
				
				
				for (var i = 0; i < result.length; i++) {
				let value = result[i].sch_start_time.slice(0, 5); // "시:분" 형식으로 변환
				disabledValues.push(value);
				infoTimes.push(result[i].info_time);
				cinemaNames.push(result[i].cinema_name);
			}	
// 			console.log(result.info_time);
			console.log(disabledValues);
// 			if(result==null||result =="")
			
			// 처음에 없을땐 선택이 되게 되야하는데 그걸 처리해줘야할듯 23.04.27
			// 처음부터 time 에맞춰서 disabled됨
			
// 			let time = "01:11"; //영화시간은 하나가아닌디..?
			let arr = new Array();
			
			//가져온 시간이 있으면 disabled 표시
			for (var i = 9; i <= 20; i++) {
				let value = i < 10 ? '0' + i + ':00' : i + ':00'; // '09:00', '10:00' 로가져오기
				let disabled = disabledValues.includes(value) ? 'disabled' : ''; // 있으면 disabled 없으면 '''
// 			  $("select.sch_start_time").append('<option value="' + value + '"' + disabled + ' ' + value + '>' + value + '</option>');
			
			  // 이미 예약된 시각 정보는 "disabled", 아니면 널스트링("") 값으로 배열 초기화
				console.log("disabled : " + disabled)
				arr[i - 9] = disabled;
			}
			
			for(let i = 0; i < arr.length; i++) {
				
				let value = (i + 9) + ':00';
				$("select.sch_start_time").append('<option value="' + value + '"' + arr[i] + ' ' + value + '>' + value + '</option>');
			}			
			console.log(" arr 시각 : "+arr);
			
			// 예약이 되잇는시간의 뒤에시간만 가려져야하는데 
			// 퐁당퐁당으로 가려짐
			// infotime에서 받아온 갯수가 그 상영의 일정이 등록된 갯수인데 
			// 그 횟수만큼 반복을 해야 하는게 아닌가요????? 9시부터 20시까지 
			console.log("infoTimes"+infoTimes);	
			
			
			
		
			
			// 배열 반복 
			for(let k = 0; k<infoTimes.length;k++){
				
				for(let i = 0; i < arr.length; i++) { // 9시~20시
					console.log("i = " + i + ", arr.length = " + arr.length);
				
				
					// 배열 내에 disabled 가 아닌 요소가 있을 경우
					if(arr[i] == "") {
						let targetStartHour = i + 9; // 16
						let runningHour =  Number(infoTimes[k].split(":")[0]); // 1
					
						
						let result = targetStartHour + runningHour; // 17
						
						// 만약, 예약시작시각 + 1부터 예약시작시각 + 상영시간(시)까지에 해당하는 배열 인덱스 값이 "disabled"가 존재하면
						// 예약시작시각(현재값)도 "disabled" 가 되어야함
						
						
					
						     						
						let isDisabled = false;
						for(let j = targetStartHour; j <= result; j++) {
							if(arr[j - 9] == "disabled") {
								isDisabled = true;
							}
						}
						
						if(isDisabled) { // 사이의 시간이 하나라도 예약 불가능(disabled)이면
							arr[i] = "disabled"; // 현재 시간도 disabled
						} else { // 아니면
							// 예약 시작 시각 다음 시간부터 예약 시작 시각 + 상영 시간(시) 값까지 반복하면서 "disabled" 표시
							// ex) 예약 시작 시각 = 16, 상영 시간(시) = 2 일 경우
							//     16:00 는 예약이 가능해야
							for(let j = targetStartHour + 1; j <= result; j++) {
								if(j - 9 < arr.length) {
									arr[j - 9] = "disabled";
								}
								
							}
						}
						
					}
				}
			
			}
// 			for(let i = 0; i < arr.length; i++) {
				
// 				let value = (i + 9) + ':00';
// 				$("select.sch_start_time").append('<option value="' + value + '"' + arr[i] + ' ' + value + '>' + value + '</option>');
// 			}
		
			
		 },
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});//ajax
		 
}


function dateDelete(){
   
   //dateDelete
    if(confirm("삭제하시겠습니까?")){
       
       $.ajax({
            type: "GET",
            url: "deleteDateSch",
            data: { 
               date: $('.sch_movie_date').val()
            },
            success: function(data) {
               if(data.deleteCount > 0){
            	   alert(data.deleteCount + "건 삭제되었습니다");
               }else{
            	   alert($('.sch_movie_date').val()+"<br>해당날짜에 상영일정이 없습니다")
               }
            },
            error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
    
    }
   
}



function doRegisterSch(){
	
 handle: ".modal-header";
   let dis = document.querySelector(".admin-modal-register");
   if (dis.style.display = "none") {
      dis.style.display = "block"
   } else {
      dis.style.display = "none";
   }
}


function doLatest() {
	
	
   handle: ".modal-header";
   let dis = document.querySelector(".admin-modal-remove");
   if (dis.style.display = "none") {
      dis.style.display = "block"
   } else {
      dis.style.display = "none";
   }
}
function modalClose() {
   let dis = document.querySelector(".admin-modal-remove");
   let dis2 = document.querySelector(".admin-modal-register");
   dis.style.display = "none";
   dis2.style.display = "none";
}

function modalReload() {
	  const form = document.querySelector('form[action="movieScheduleRegisterPro"]');
	  form.reset();
}
$(function () {
    $('.modal').draggable({
      handle: ".justify-content-center"
    });
  });


$(function() {
    $("#sch_remove_date,#sch_research_date").datepicker({
       dateFormat: 'yy-mm-dd' //달력 날짜 형태
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
            ,changeYear: true //option값 년 선택 가능
            ,changeMonth: true //option값  월 선택 가능                
            ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
            ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
            ,minDate: "0D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "+30D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
    });                           
});



$(function() {
    $(" #sch_register_date").datepicker({
       dateFormat: 'yy-mm-dd' //달력 날짜 형태
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
            ,changeYear: true //option값 년 선택 가능
            ,changeMonth: true //option값  월 선택 가능                
            ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
            ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
            ,minDate: "0D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "+30D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
    });                           
});

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
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
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
		
				<!-- 테이블 -->
				<div class="datatable-container">
					<h3 class="text-center font-weight-light my-4">영화상영 일정관리</h3>
					<h6>
						오늘의 상영일정 <b style="color: #673bd4">${todayCount }</b>건 / 총 상영일정 <b
							style="color: #673bd4">${pageInfo.listCount }</b>건
					</h6>
					<div class="">
						<input class="btn btn-block btn-more" type="button" value="일정등록" onclick="doRegisterSch()">
						<!-- 	               		<input class="btn btn-block btn-more" type="button" value="일정등록" onclick="location.href='movieScheduleUpdate'"> -->
						<input class="btn btn-block btn-more" type="button" value="지정날짜삭제" onclick="doLatest()">
						<input class="btn btn-block btn-more" type="button" value="현재상영목록" onclick="location.href='admin_schedule_register'">
						<input class="btn btn-block btn-more" type="button" value="상영종료목록" onclick="location.href='movieEndSchedule'">

						<div class="selectbox searchbox"
							style="display: inline-block; float: right; margin-bottom: 25px; margin-top: -19px; width: 520px; padding-left: 53px;">
							<form action="admin_schedule_register">
								<div class="sch_movie_code">
									<select name="sch_movie_code" id="sch_movie_code" style="width: 150px; height: 32px; border: 1px solid #aeaeae;" onchange="selectdd()">
										<option value="none" selected="selected" disabled>영화선택</option>
										<option value="none" disabled>=======================</option>
										<option value="" onchange="admin_schedule_register">전체선택</option>
										<c:forEach var="movie" items="${movieList }">
											<option value="${movie.get('info_movie_code') }" ${param.sch_movie_code eq movie.info_movie_code ? 'selected' : ''}>${ movie.get("info_movie_title") }</option>
										</c:forEach>
									</select> 
									<select name="sch_cinema_code" id="sch_cinema_code" style="width: 110px; height: 32px; border: 1px solid #aeaeae;">
										<option value="none" selected="selected" disabled>지점선택</option>
										<option value="none" disabled>=======================</option>
										<c:forEach var="cinema" items="${cinemaList }">
											<option value="${cinema.get('cinema_code') }" ${param.sch_cinema_code eq cinema.cinema_code ? 'selected' : ''}>${ cinema.get('cinema_name') }</option>
										</c:forEach>
									</select>
									<input value="${param.sch_research_date }" name="sch_research_date" class="sch_research_date" id="sch_research_date" type="text" placeholder="날짜검색" autocomplete='off' style="width: 100px; height: 32px; border: 1px solid #aeaeae;" />
									<input class="btn btn-block btn-more" type="submit" value="검색" style="height: 32px; line-height: 16px; margin-bottom: 5px; background-color: #ffffff;">
								</div>
							</form>
						</div>

					</div>
				
					<table id="datatablesSimple" class="datatable-table">
						<thead>
							<tr>
								<th data-sortable="true" style="width: 8%;"><a href="#"
									class="datatable-sorter">지점명</a></th>
								<th data-sortable="true" style="width: 8%;"><a href="#"
									class="datatable-sorter">상영관명</a></th>
								<th data-sortable="true" style="width: 10%;"><a href="#"
									class="datatable-sorter">영화제목</a></th>
								<th data-sortable="true" style="width: 8%;"><a href="#"
									class="datatable-sorter">상영날짜</a></th>
								<th data-sortable="true" style="width: 8%;"><a href="#"
									class="datatable-sorter">시작시간</a></th>
								<th data-sortable="true" style="width: 8%;"><a href="#"
									class="datatable-sorter">종료시간</a></th>
								<th data-sortable="true" style="width: 8%;">수정/삭제</th>
							</tr>
						</thead>
						<!-- 회원목록 -->
						<c:forEach var="schedule" items="${scheduleList }">
						
						<c:if test="${empty scheduleList  }">
						<h1>상영일정이존재하지않습니다.</h1>
						</c:if>
						
						
							<tbody>
								<tr data-index="0">
									<td>${schedule.get("cinema_name") }</td>
									<td>${schedule.get("screen_name") }</td>
									<td>${schedule.get("info_movie_title") }</td>
									<td>${schedule.get('sch_movie_date')}</td>
									<td>${schedule.get("sch_start_time") }</td>
									<td>${schedule.get("sch_last_time") }</td>
									<td class="modi"><a></a> <input
										onclick="location.href='selectSchedule?sch_code=${schedule.get('sch_code')}'"
										class="btn btn-block btn-more" type="button" value="M O R E">
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

							<c:choose>
							  <c:when test="${pageNum > 1}">
							    <li class="datatable-pagination-list-item datatable-hidden" onclick="location.href='admin_schedule_register?pageNum=${pageNum - 1}&sch_research_date=${param.sch_research_date}&sch_cinema_code=${param.sch_cinema_code}&sch_movie_code=${param.sch_movie_code}'">
							      <a data-page="${pageNum}" class="datatable-pagination-list-item-link">‹</a>
							    </li>
							  </c:when>
							  <c:otherwise>
							    <li class="datatable-pagination-list-item datatable-hidden">
							      <a data-page="${pageNum}" class="datatable-pagination-list-item-link">‹</a>
							    </li>
							  </c:otherwise>
							</c:choose>
							
							<c:forEach var="num" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
							  <c:choose>
							    <c:when test="${pageNum eq num}">
							      <%-- 현재 페이지 번호일 경우 --%>
							      <li class="datatable-pagination-list-item ">
							        <a class="datatable-pagination-list-item-link" style="font-weight: 800; background-color: #ececec">${num}</a>
							      </li>
							    </c:when>
							    <c:when test="${pageNum ne num}">
							      <li class="datatable-pagination-list-item">
							        <a href="admin_schedule_register?pageNum=${num}&sch_research_date=${param.sch_research_date}&sch_cinema_code=${param.sch_cinema_code}&sch_movie_code=${param.sch_movie_code}">${num}</a>
							      </li>
							    </c:when>
							  </c:choose>
							</c:forEach>
							
							<c:choose>
							  <c:when test="${pageNum < pageInfo.maxPage}">
							    <li class="datatable-pagination-list-item datatable-hidden" onclick="location.href='admin_schedule_register?pageNum=${pageNum + 1}&sch_research_date=${param.sch_research_date}&sch_cinema_code=${param.sch_cinema_code}&sch_movie_code=${param.sch_movie_code}'">
							      <a data-page="${pageNum}" class="datatable-pagination-list-item-link">›</a>
							    </li>
							  </c:when>
							  <c:otherwise>
							    <li class="datatable-pagination-list-item datatable-hidden">
							      <a data-page="${pageNum}" class="datatable-pagination-list-item-link">›</a>
							    </li>
							  </c:otherwise>
							</c:choose>
						</ul>
					</nav>
				</div>

			</main>
			<!-- 날짜선택해서 지울수있게 -->
			<div class="container modal admin-modal-remove"
				style="display: none; width: 530px;">
				<div class="row justify-content-center">
					<div class="col-lg-7">
						<div class="card border-1 mt-5">
							<div class="card-header">
								<button type="button" class="close-modal" onclick="modalClose()"
									style="border: none;">닫기</button>
								<h3 class="text-center font-weight-light my-4">삭제</h3>
							</div>
							<div class="card-body">
								<form>
									<h6>♥ 삭제할 날짜를 선택해주세요 ♥</h6>
									<input name="sch_remove_date" class="sch_remove_date"
										id="sch_remove_date" type="text" value="" />
									<div class="row">
										<div class="d-grid" style="margin-top: 20px">
											<input class="btn btn-primary btn-block" type="button"
												value="삭제" onclick="dateDelete()">
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 삭제모달 -->

			<!--  등록모달 -->
			<div class="container modal admin-modal-register" style="display: none;">
				<div class="row justify-content-center">
					<div class="col-lg-7" style="width: 1000px">
						<div class="card border-1 mt-5">
							<div class="card-header">
								<button type="button" class="close-modal" onclick="modalClose()" style="border: none;">닫기</button>
								<a href="#" onclick="modalReload()">새로고침</a>
								<h3 class="text-center font-weight-light my-4">상영일정등록</h3>
							</div>

							<form action="movieScheduleRegisterPro">
								<div class="card-body">
									<div class="row mb-3">
										<div class="col-md-6">
											<div class="form-floating mb-3 mb-md-0">
												<input name="sch_register_date" class="form-control"
													id="sch_register_date" autocomplete='off' /> <label for="res_date">날짜선택</label>
											</div>
										</div>
									</div>

									<div class="row mb-3">
										<div class="col-md-6 ">
											<div class="form-floating mb-3 mb-md-0 selectbox">
												<div class="cinema_name">
													<label for="cinema_name">영화관명 : </label> 
													<select name="sch_cinema_code" onchange="selectCinema()">
														<option value="none" selected="selected" disabled>영화관을 선택하세요</option>
														<option value="none" disabled>=======================</option>
														<c:forEach var="cinema" items="${cinemaList }">
															<option value="${cinema.get('cinema_code') }">${cinema.get("cinema_name")}</option>
														</c:forEach>
													</select>
													<c:forEach var="cinema" items="${cinemaList }">
														<input type="hidden" name="location_code"
															value="${cinema.get('location_code') }">
													</c:forEach>
												</div>
											</div>
										</div>

										<div class="col-md-6">
											<div class="form-floating mb-3 mb-md-0 selectbox">
												<div class="screen_name">
													<label for="screen_name">상영관 : </label> 
													<select name="sch_screen_code" class="selectScreen_name"style="width: 300px">
														<option value="none" selected="selected" disabled>상영관을 선택하세요</option>
														<option value="none" disabled>=======================</option>
														<c:forEach var="sch" items="${schList }">
															<option value="${sch.get('sch_start_time') }">${ movie.get("sch_start_time") }</option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
									</div>
									<hr>
									<div class="row mb-3">
											<div class="col-md-6 ">
												<div class="form-floating mb-3 mb-md-0 selectbox">
													<div class="sch_movie_name">
														<label for="sch_movie_name">영화선택 : </label>
														<select name="sch_movie_code" id="sch_movie_code"  onchange="selectSch()" style="width: 300px;">
															<option selected="selected" disabled>영화를 선택하세요</option>
															<option disabled>=======================</option>
															<c:forEach var="movie" items="${movieList }">
																<option value="${movie.get('info_movie_code') }" movieTime="${movie.get('info_time')}">${ movie.get("info_movie_title") }</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0 selectbox">
													<div class="sch_start_time">
														<label for="sch_start_time">시작시간 : </label>
														 <select name="sch_start_time" class="sch_start_time">
															<option value="" selected="selected"
																disabled="disabled">영화시작시간을 선택하세요</option>
															<option value="" disabled>=======================</option>
															<option value="" >09:00</option>
															<option value="" >10:00</option>
															<option value="" >11:00</option>
															<option value="" >12:00</option>
															<option value="" >13:00</option>
															<option value="" >14:00</option>
															<option value="" >15:00</option>
															<option value="" >16:00</option>
															<option value="" >17:00</option>
															<option value="" >18:00</option>
															<option value="" >19:00</option>
															<option value="" >20:00</option>
														</select>
													</div>
												</div>
											</div>
										</div>
								</div>
								
									
								<div class="row">
									<div class="mt-4 mb-0 ">
										<div class="d-grid">
											<input class="btn btn-primary btn-block" type="submit"
												value="등록" style="margin: 25px">
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
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