<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>아이무비관리자페이지</title>
<link href="${pageContext.request.contextPath }/resources/css/styles.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
function doDisplay(){
	alert("dddd");
	let dis = document.querySelector(".admin-modal");
	if(dis.style.display="none"){
		dis.style.display="block"
	} else{
		dis.style.display="none";
	}
}


function selectCinema(){
	
	$.ajax({
		type: "POST",
		url: "screenSelect",
		data: {
			cinema_code: $(".cinema_name option:selected").val(),
		  	cinema_name: $(".cinema_name option:selected").text()
		},
		success: function(result){ // 요청 처리 성공시 자동으로 호출되는 콜백함수
			
			
			$(".selectScreen_name option").remove();
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



$(function () {
    $('.modal').draggable({
      handle: ".justify-content-center"
    });
  });


function modalClose(){
	let dis = document.querySelector(".admin-modal");
	dis.style.display="none";
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
					<h3 class="text-center font-weight-light my-4">영화예매관리</h3>
						<h6>오늘의 예매건수 : <b style="color: #673bd4">${resCount }</b>건</h6>	
					<table id="datatablesSimple" class="datatable-table">
						<thead>
							<tr>
								<th data-sortable="true" style="width: 5%;"><a href="#"
									class="datatable-sorter">결제번호</a></th>
								<th data-sortable="true" style="width: 8%;"><a href="#"
									class="datatable-sorter">회원ID</a></th>
								<th data-sortable="true" style="width: 10%;"><a href="#"
									class="datatable-sorter">영화제목</a></th>
								<th data-sortable="true" style="width: 8%;"><a href="#"
									class="datatable-sorter">영화관명</a></th>
<!-- 								<th data-sortable="true" style="width: 8%;"><a href="#" -->
<!-- 									class="datatable-sorter">상영관명</a></th> -->
								<th data-sortable="true" style="width: 8%;"><a href="#"
									class="datatable-sorter">관람날짜</a></th>
								<th data-sortable="true" style="width: 7%;"><a href="#"
									class="datatable-sorter">좌석</a></th>
								<th data-sortable="true" style="width: 8%;"><a href="#"
									class="datatable-sorter">결제금액</a></th>
								<th data-sortable="true" style="width: 10%;">
									<a href="#" class="datatable-sorter">결제일</a>
								</th>
								<th data-sortable="true" style="width: 8%;">
									<a href="#" class="datatable-sorter">결제유무</a>
								</th>
								<th data-sortable="true" style="width: 5%;">
									<a href="#" class="datatable-sorter">수정</a>
								</th>
							</tr>
						</thead>
						<!-- 회원목록 -->
						<c:forEach var="resList" items="${resList }">
						<tbody>
							<tr data-index="0">
								<td>${resList.get("res_code") }</td>
								<td>${resList.get("res_id") }</td>
								<td>${resList.get("res_title") }</td>
								<td>${resList.get("res_cinema") }</td>
								<td>${resList.get("res_date") }</td>
								<td>${resList.get("res_seat_name") }</td>
								<td>${resList.get("res_pay") }</td>
								<td>${resList.get("res_paydate") }</td>
								<td>${resList.get("res_pay_done") }</td>
								<td class="modi">
									<input class="btn btn-block btn-more" type="button" value="M O R E" onclick="location.href='selectRes?res_code=${resList.get('res_code')}'">
<!-- 									<input class="btn btn-block btn-more" type="button" value="M O R E" onclick="doDisplay()"> -->
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
										onclick="location.href='resList?pageNum=${pageNum - 1}'">
										<a data-page="${pageNum } class="datatable-pagination-list-item-link">‹</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="datatable-pagination-list-item datatable-hidden">
										<a data-page="${pageNum } class="datatable-pagination-list-item-link">‹</a>
									</li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="num" begin="${pageInfo.startPage }"
								end="${pageInfo.endPage }">
								<c:choose>
									<c:when test="${pageNum eq num }">
										<%-- 현재 페이지 번호일 경우 --%>
										<li class="datatable-pagination-list-item "><a
											class="datatable-pagination-list-item-link"
											style="font-weight: 800; background-color: #ececec">${num }</a>
									</c:when>

									<%--페이지번호 --%>
									<c:otherwise>
										<li class="datatable-pagination-list-item "><a
											class="datatable-pagination-list-item-link"
											href="resList?pageNum=${num }">${num }</a></li>

									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${pageNum < pageInfo.maxPage }">
									<li class="datatable-pagination-list-item datatable-hidden"
										onclick="location.href='resList?pageNum=${pageNum + 1}'">
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

				<!-- 모달 -->
				<div class="container modal admin-modal" style="display: none">
					<div class="row justify-content-center">
						<div class="col-lg-7">
							<div class="card border-1 mt-5">
								<div class="card-header">
									<button type="button" class="close-modal"
										onclick="modalClose()" style="border: none;">닫기</button>
									<h3 class="text-center font-weight-light my-4">영화예매관리</h3>
								</div>
								<div class="card-body">
									<form>
										<div class="row mb-3">
											<div class="col-md-4">
												<div class="form-floating">
													<input class="form-control" id="member_id" type="text"
														value="admin1234" readonly="readonly" /> <label
														for="inputLastName">회원ID</label>
												</div>
											</div>

										</div>
										<hr>
										<div class="row mb-3">

											<div class="col-md-4">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" id="info_movie_title"
														type="text" value="스즈메의문단속" readonly="readonly" /> <label
														for="info_movie_title">영화제목</label>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" id="res_date" type="text"
														value="2023-04-07" placeholder="2023-04-07" /> <label
														for="res_date">관람일</label>
												</div>
											</div>
											<div class="col-md-4 ">
												<div class="form-floating mb-3 mb-md-0 selectbox">
													<div class="sch_movie_code">
														<label for="sch_movie_code">영화선택 : </label> <select
															name="sch_movie_code" id="sch_movie_code"
															style="width: 300px;">
															<option value="none" selected="selected" disabled>영화를
																선택하세요</option>
															<option value="none" disabled>=======================</option>
															<c:forEach var="movie" items="${movieList }">
																<option value="${movie.get('info_movie_code') }">${ movie.get("info_movie_title") }</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>



										</div>




										<div class="row mb-3">

											<div class="col-md-4">
												<div class="form-floating mb-3 mb-md-0 selectbox">
													<div class="screen_name">
														<label for="screen_name">상영관 : </label> <select
															name="screen_name">
															<option value="1">1관</option>
															<option value="2">2관</option>
															<option value="3">3관</option>
														</select>
													</div>
												</div>
											</div>

											<div class="col-md-4">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" id="res_seat" type="text"
														value="A1,A2" /> <label for="res_seat">예매좌석</label>

													<!-- 누르면 선택창 나오게끔 -->

												</div>
											</div>
											<div class="col-md-4 ">
												<div class=" form-floating mb-3 mb-md-0 selectbox">
													<!--                                                         <input class="form-control" id="inputPassword" type="text" placeholder="결제유무" /> -->
													<div class="res_count">
														<label for="res_count">예매인원수 : </label> <select
															name="res_count">
															<option value="1">1명</option>
															<option value="2">2명</option>
															<option value="3">3명</option>
															<option value="4">4명</option>
															<option value="5">5명</option>
															<option value="6">6명</option>
															<option value="7">7명</option>
															<option value="8">8명</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<hr>
										<div class="row mb-3">
											<div class="col-md-4">
												<div class="form-floating mb-3 mb-md-0 selectbox">
													<div class="res_card">
														<label for="res_card">결제카드사 : </label> <select
															name=res_card>
															<option value="samsung">삼성카드</option>
															<option value="hyundae">현대카드</option>
															<option value="etc">등등</option>
														</select>
													</div>
												</div>
											</div>





											<div class="col-md-4">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" id="res_cardnum" type="text"
														value="105-12-4819-1222" /> <label for="res_cardnum">카드번호</label>
												</div>
											</div>

										</div>
										<div class="row mb-3">
											<div class="col-md-4">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" id="res_pay" type="text"
														value="20,000원" /> <label for="res_pay">결제금액</label>
												</div>
											</div>

											<div class="col-md-4">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" id="res_paydate" type="text"
														value="2023-03-23" /> <label for="res_paydate">결제일<label>
												</div>
											</div>
											<div class="col-md-4 ">
												<div class="form-floating mb-3 mb-md-0 selectbox">
													<!--                                                         <input class="form-control" id="inputPassword" type="text" placeholder="결제유무" /> -->
													<div class="isPaid">
														<label for="res_pay_done">결제유무 : </label> <select
															name="res_pay_done">
															<option value="done">결제완료</option>
															<option value="ing">결제진행중</option>
															<option value="none">결제미완료</option>
														</select>
													</div>
												</div>
											</div>

										</div>


										<div class="modal-bottom flex">
											<button type="button" class="btn-modal2" id="btnFind">확인</button>
											<button type="button" class="btn-modal1"
												onclick="modalClose()">취소</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				
				
				
				

			</main>
			<!-- 모달 -->






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