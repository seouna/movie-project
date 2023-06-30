<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>아이무비관리자페이지</title>
<link href="${pageContext.request.contextPath }/resources/css/styles.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"rel="stylesheet"  />
<link href="resources/css/styles.css" rel="stylesheet" />


<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script type="text/javascript">



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
                            <h3 class="text-center font-weight-light my-4">상영일정등록</h3>
                            </div>
                            <div class="card-body">
                                <form action="movieScheduleRegisterPro"> 
                                    <div class="row mb-3">
                                     	<div class="col-md-4">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input name="sch_movie_date" class="form-control" id="sch_movie_date" type="text" value=""/>
                                                <label for="res_date">날짜선택</label>
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
														 <input type="hidden" name="location_code" value="${cinema.get('location_code') }">
														</c:forEach>
                                                 </div>
                                             </div>
                                           </div>
                                           
                                           <div class="col-md-6">
                                               <div class="form-floating mb-3 mb-md-0 selectbox">
                                                   <div class="screen_name">
                                                   	<label for="screen_name">상영관 : </label>
														<select name="sch_screen_code" class="selectScreen_name" style="width: 300px">
														<option value="none" selected="selected" disabled>상영관을 선택하세요</option>
														<option value="none" disabled>=======================</option>
														</select>
                                                   </div>
                                               </div>
                                          	</div>
                                       </div>
                                       
                                        <div class="row mb-3">
                                       	<div class="col-md-6 " >
                                               <div class="form-floating mb-3 mb-md-0 selectbox" >
                                                   <div class="sch_movie_code">
                                                   	<label for="sch_movie_code">영화선택 : </label>
													<select name="sch_movie_code" id="sch_movie_code" style="width: 300px;">
													<option value="none" selected="selected" disabled >영화를 선택하세요</option>
													<option value="none" disabled>=======================</option>
													<c:forEach var="movie" items="${movieList }">
										   				 <option value="${movie.get('info_movie_code') }">${ movie.get("info_movie_title") }</option>
													</c:forEach>
													</select>
                                                   </div>
                                               </div>
                                          </div>
                                       </div>
                                       <hr>
                                       
                                       
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
                                </div>     
                                      
                                		<div class="row">
											<div class="mt-4 mb-0 ">
												<div class="d-grid">
													<input class="btn btn-primary btn-block" type="submit" value="등록">
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