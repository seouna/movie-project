<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>아이무비관리자페이지</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
function confirmUpdate() {
	return confirm("수정하시겠습니까?");
}

function deleteSchedule(){
	let delConfirm = confirm("삭제하시겠습니까?");
	if (delConfirm) {
		location.href='deleteSchedule?sch_code=${selectSchedule.get('sch_code') }';
	}
}



function selectCinema(){
	alert("change");
	$.ajax({
		type: "POST",
		url: "screenSelect",
		data: {
			cinema_code: $(".cinema_name option:selected").val(),
		  	cinema_name: $(".cinema_name option:selected").text()
		},
		success: function(result){ // 요청 처리 성공시 자동으로 호출되는 콜백함수
			
			$('.selectScreen_name option').remove();
			$(".selectScreen_name").append( '<option value="none" selected="selected" disabled>상영관을 선택하세요</option>');
			$(".selectScreen_name").append('<option value="none" disabled>=======================</option>');
			for(var i=0; i<result.length; i++){
				$(".selectScreen_name").append('<option value="' +result[i].screen_code + '">' + result[i].screen_name + '</option');
			}
			
		},
		error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	     
		}
	});//ajax
}



$(function() {
    $("#sch_movie_date").datepicker({
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
            ,maxDate: "+100D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
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
		<form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					<i class="fas fa-user fa-fw"></i>
				</a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="main">홈</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="logout">Logout</a></li>
				</ul>
			</li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<!-- 고정  -->
		<jsp:include page="admin_nav.jsp"/>
		<!-- 고정 -->
		<div id="layoutSidenav_content">
			<!-- 들어갈내용 -->
			 <main>
                <div class="row justify-content-center">
                    <div class="col-lg-7" style="width: 1000px">
                        <div class="card border-1 mt-5">
                            <div class="card-header">
                            <h3 class="text-center font-weight-light my-4">상영일정수정</h3>
                            </div>
                            <div class="card-body">
                                <form action="updateSchedule" onsubmit="return confirmUpdate()"> 
                                    <div class="row mb-3">
                                     	<div class="col-md-4">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input name="sch_movie_date" class="form-control" id="sch_movie_date" type="text" value="${selectSchedule.get('sch_movie_date') }"/>
                                                <label for="res_date">날짜선택</label>
                                            </div>
                                        </div>
                                    </div>
                                       
                                    <div class="row mb-3">
                                       	<div class="col-md-6 " >
                                               <div class="form-floating mb-3 mb-md-0 selectbox" >
                                                   <div class="info_movie_title">
                                                   	<label for="info_movie_title">영화선택 : </label>
													<select name="info_movie_title" id="sch_movie_code"  style="width: 300px">
													<option value="${selectSchedule.get('info_movie_title') }">${selectSchedule.get('info_movie_title') }</option>
													</select>
                                                   </div>
                                                   <input type="hidden" name="sch_code" value="${selectSchedule.get('sch_code') }">
                                                   
                                               </div>
                                          </div>
                                       </div>
                                       <hr>
                                       <div class="row mb-3">
                                      	  <div class="col-md-6 ">
                                             <div class="form-floating mb-3 mb-md-0 selectbox">
                                                 <div class="cinema_name">
                                                 	<label for="cinema_name">지점명 : </label>
													<select name="sch_cinema_code" onchange="selectCinema()"  style="width: 300px">
														<option value="${selectSchedule.get('cinema_name')}">${selectSchedule.get("cinema_name")}</option>
													</select>
                                                 </div>
                                             </div>
                                           </div>
                                           <input type="hidden" name="sch_code" value="${selectSchedule.get('sch_code') }">
                                           <div class="col-md-6">
                                               <div class="form-floating mb-3 mb-md-0 selectbox">
                                                   <div class="screen_name">
                                                   	<label for="screen_name">상영관 : </label>
														<select name="sch_screen_code" class="selectScreen_name" style="width: 300px">
														<option value="${selectSchedule.get('screen_name')}">${selectSchedule.get("screen_name")}</option>
														</select>
                                                   </div>
                                               </div>
                                          	</div>
                                       </div>
                                       <div class="row mb-3">
                                      	  <div class="col-md-6">
                                      	  <div class="form-floating mb-3 mb-md-0 selectbox">
                                                   <div class="sch_start_time">
                                                   	<label for="sch_start_time">상영시작시간 : </label>
														<select name="sch_start_time">
														    <option value="09:00">오전 09:00</option>
														    <option value="10:00">오전 10:00</option>
														    <option value="11:00">오전 11:00</option>
														    <option value="12:00">오후 12:00</option>
														    <option value="13:00">오후 1:00</option>
														    <option value="14:00">오후 2:00</option>
														    <option value="15:00">오후 3:00</option>
														    <option value="16:00">오후 4:00</option>
														    <option value="17:00">오후 5:00</option>
														    <option value="18:00">오후 6:00</option>
														    <option value="19:00">오후 7:00</option>
														    <option value="20:00">오후 8:00</option>
														</select>
                                                   </div>
                                             </div>
                                       </div>
                                       
                                       
                                       <div class="col-md-6">
<!-- 	                                      	  <div class="form-floating mb-3 mb-md-0"> -->
<!-- 	                                                   <div class="sch_last_time"> -->
<!-- 	                                                   	<input name="sch_last_time"class="form-control" id="sch_last_time" type="text" value="" /> -->
<!-- 	                                                   	<label for="sch_last_time">상영종료시간 : </label> -->
<!-- 	                                                   	<div class="col-md-6"> -->
<!-- 	                                                   </div> -->
<!-- 	                                             </div> -->
<!-- 	                                       </div> -->
										<div class="form-floating">
										</div>
                               		 </div>     
                               			</div>
                                		<div class="row">
											<div class="mt-4 mb-0 col-md-6">
												<div class="d-grid">
													<input class="btn btn-primary btn-block btn-update" type="submit" value="수정" >
												</div>
											</div>
											<div class="mt-4 mb-0 col-md-6">
												<div class="d-grid">
													<input class="btn btn-primary btn-block btn-del" type="button" onclick="deleteSchedule()" value="삭제">
												</div>															
											</div>
										</div>
                                   </form>
                                </div>
                           </div>
                       </div>
                   </div>
                </main>
			 
			
			<!--들어갈내용 -->
			
			<!-- 푸터 -->
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; IMOVIE 2023</div>
						<div>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>