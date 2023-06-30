<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>아이무비관리자페이지</title>
<link
	href="${pageContext.request.contextPath }/resources/css/styles.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

function confirmUpdate() {
	return confirm("수정하시겠습니까?");
}

$(function() {
    $("#res_date").datepicker({
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



function historyBack() {
	  history.back();
	}
function delRes(){
	
	let delConfirm = confirm("삭제하시겠습니까?");
	if (delConfirm) {
		location.href='deleteRes?res_code=${detailRes.get('res_code') }';
	}
	
}

</script>
</head>
<body class="sb-nav-fixed">
<c:if test="${sessionScope.sId neq 'admin' }">
	

</c:if>
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

				<!-- 				<div class="container modal admin-modal" style="display: none"> -->
				<div class="row justify-content-center">
					<div style="width: 1200px">
						<div class="card border-1 mt-5">
							<div class="card-header">
								<!-- 								<button type="button" class="close-modal" onclick="modalClose()" -->
								<!-- 									style="border: none;">닫기</button> -->
								<h3 class="text-center font-weight-light my-4">영화예매관리</h3>
							</div>
							<div class="card-body">
							<form action="updateRes" onsubmit="return confirmUpdate()">	
								<input type="hidden" id="res_code" name="res_code" value="${detailRes.get('res_code') }">
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
													type="text" value="${detailRes.get('res_title') }"
													readonly="readonly" /> <label for="info_movie_title">영화제목</label>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-floating mb-3 mb-md-0">
												<input class="form-control" id="res_date" name="res_date" type="text" value="${detailRes.get('res_date') }" style="background-color: #fff; border: 2px solid #afafaf"/> 
												<label for="res_date">관람일</label>
											</div>
										</div>
										<div class="col-md-4 ">
											<!-- 											<div class="form-floating mb-3 mb-md-0 selectbox"> -->
											<!-- 												<div class="sch_movie_code"> -->
											<!-- 													<label for="sch_movie_code">영화선택 : </label>  -->
											<!-- 													<select name="sch_movie_code" id="sch_movie_code" style="width: 250px;"> -->
											<%-- 														<option value="${detailRes.get('res_title') }" selected="selected">영화를 선택하세요</option> --%>
											<!-- 														<option value="none" disabled>=======================</option> -->
											<%-- 														<c:forEach var="movie" items="${movieList }"> --%>
											<%-- 															<option value="${movie.get('info_movie_code') }">${ movie.get("info_movie_title") }</option> --%>
											<%-- 														</c:forEach> --%>
											<!-- 													</select> -->
											<!-- 												</div> -->
											<!-- 											</div> -->
										</div>
									</div>
									<div class="row mb-3">

										<div class="col-md-4">
											<div class="form-floating mb-3 mb-md-0">
												<input class="form-control" id="info_movie_title"
													type="text"
													value="${detailRes.get('res_cinema') }/${detailRes.get('screen_name')}"
													readonly="readonly" /> <label for="info_movie_title">지점/상영관</label>
											</div>
										</div>
				



										<div class="col-md-4">
											<div class="form-floating mb-3 mb-md-0">
												<input class="form-control" id="res_seat" type="text"
													value="${detailRes.get('res_seat_name') }" /> <label
													for="res_seat">예매좌석</label>
											</div>
										</div>
										<div class="col-md-4 ">
											<div class=" form-floating mb-3 mb-md-0 selectbox" style="background-color:#fafafa">
												<div class="res_count">
													<label for="res_count">예매인원수 :
														${detailRes.get('res_count') }명</label>
												</div>
											</div>
										</div>
									</div>
									<hr>
									<div class="row mb-3">
<!-- 										<div class="col-md-4"> -->
<!-- 											<div class="form-floating mb-3 mb-md-0"> -->
<!-- 												<input class="form-control" id="res_card" type="text" -->
<%-- 													value="${detailRes.get('res_card') }" /> <label --%>
<!-- 													for="res_card">결제카드사</label> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 										<div class="col-md-4"> -->
<!-- 											<div class="form-floating mb-3 mb-md-0"> -->
<!-- 												<input class="form-control" id="res_cardnum" type="text" -->
<%-- 													value="${detailRes.get('res_cardnum') }" /> <label --%>
<!-- 													for="res_cardnum">카드번호</label> -->
<!-- 											</div> -->
<!-- 										</div> -->

									</div>
									<div class="row mb-3">
										<div class="col-md-4">
											<div class="form-floating mb-3 mb-md-0">
												<input class="form-control" id="res_pay" type="text"
													value="${detailRes.get('res_pay') }원" /> <label
													for="res_pay">결제금액</label>
											</div>
										</div>

										<div class="col-md-4">
											<div class="form-floating mb-3 mb-md-0">
												<input class="form-control" id="res_paydate" type="text" value="${detailRes.get('res_paydate') }" /> 
												<label for="res_paydate">결제일<label>
											</div>
										</div>
										<div class="col-md-4 ">
											<div class="form-floating mb-3 mb-md-0 selectbox" style="background-color:#fff; border: 2px solid #afafaf;" >
												<!--                                                         <input class="form-control" id="inputPassword" type="text" placeholder="결제유무" /> -->
												<div class="isPaid" >
													<label for="res_pay_done">결제유무 : </label> 
													<select name="res_pay_done">
														<option value="${detailRes.get('res_pay_done') }">${detailRes.get('res_pay_done') }</option>
													</select>
												</div>
											</div>
										</div>

									</div>


									
									<div class="row">
										<div class="mt-4 mb-0 col-md-4">
											<div class="d-grid">
												<button type="button" class="btn btn-primary btn-block" id="btnFind" onclick="historyBack()">뒤로가기</button>
											</div>
										</div>
										<div class="mt-4 mb-0 col-md-4">
											<div class="d-grid ">
<!-- 												<button type="button" class="btn btn-primary btn-block" onclick="updateRes()">수정</button> -->
												<input class="btn btn-primary btn-block btn-update" type="submit" value="수정" >
											</div>															
										</div>
										<div class="mt-4 mb-0 col-md-4">
											<div class="d-grid ">
												<button type="button" class="btn btn-primary btn-block" onclick="delRes()">삭제</button>
											</div>															
										</div>
									</div>
									
								</form>
								
							</div>
						</div>
					</div>
				</div>
				<!-- 				</div> -->

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