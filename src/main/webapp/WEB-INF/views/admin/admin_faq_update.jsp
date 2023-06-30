<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	// 	const textareaElement = document.querySelector("textarea");

	// 	textareaElement.addEventListener("keyup", (e) => {
	// 	  if (e.keyCode === 13) {
	// 	    if (!e.shiftKey) {
	// 	      sendMessage();
	// 	    }
	// 	  }
	// 	});

	function confirmUpdate() {
		return confirm("수정하시겠습니까?");
	}

	function faq_delete() {
		let delConfirm = confirm("삭제하시겠습니까?");
		if (delConfirm) {
			location.href = 'faq_delete_pro?faq_code=${faqBoard.faq_code }';
		}
	}

	function selectCinema() {

		$
				.ajax({
					type : "POST",
					url : "screenSelect",
					data : {
						cinema_code : $(".cinema_name option:selected").val(),
						cinema_name : $(".cinema_name option:selected").text()
					},
					success : function(result) { // 요청 처리 성공시 자동으로 호출되는 콜백함수

						$(".selectScreen_name option").remove();
						$(".selectScreen_name")
								.append(
										'<option value="none" selected="selected" disabled>상영관을 선택하세요</option>');
						$(".selectScreen_name")
								.append(
										'<option value="none" disabled>=======================</option>');
						for (var i = 0; i < result.length; i++) {
							$(".selectScreen_name").append(
									'<option value="' +result[i].screen_code + '">'
											+ result[i].screen_name
											+ '</option');
						}

					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);

					}
				});//ajax
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
				<div class="row justify-content-center">
					<div class="col-lg-7" style="width: 1000px">
						<div class="card border-1 mt-5">
							<div class="card-header">
								<button type="button" class="close-modal"
									onclick="history.back()" style="border: none;">닫기</button>
								<h3 class="text-center font-weight-light my-4">자주묻는 질문 수정</h3>
							</div>
							<div class="card-body">
								<form action="faq_update_pro" onsubmit="return confirmUpdate()">
									<input type="hidden" name="faq_code"
										value="${faqBoard.faq_code }">
									<div class="row mb-3">
										<div class="col-md-6 ">
											<div class="form-floating mb-3 mb-md-0 ">
												<input class="form-control" id="faq_question"
													name="faq_question" type="text"
													value="${faqBoard.faq_question }" /> <label
													for="faq_question">제목</label>
											</div>
										</div>
										<div class="col-md-6 ">
											<div class="dropdown bootstrap-select">
												<div class="form-floating mb-3 mb-md-0 selectbox">
													<div class="cinema_name">
														<label for="cinema_name">문의지점 : </label> <select
															name="faq_group" style="margin-top: 0px; !important">
															<option value="전체">전체</option>
															<option value="예매">예매</option>
															<option value="관람권">관람권</option>
															<option value="멤버십">멤버십</option>
															<option value="할인혜택">할인혜택</option>
															<option value="영화관이용">영화관이용</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<!-- 										<div class="col-md-6 "> -->
										<!-- 											<div class="form-floating mb-3 mb-md-0 selectbox"> -->
										<!-- 												<div class="cinema_name"> -->
										<!-- 													<label for="cinema_name">영화관명 : </label> <select -->
										<!-- 														name="sch_cinema_code" onchange="selectCinema()"> -->
										<!-- 														<option value="none" selected="selected" disabled>영화관을 -->
										<!-- 															선택하세요</option> -->
										<!-- 														<option value="none" disabled>=======================</option> -->
										<%-- 														<c:forEach var="cinema" items="${cinemaList }"> --%>
										<%-- 															<option value="${cinema.get('cinema_code') }">${cinema.get("cinema_name")}</option> --%>
										<%-- 														</c:forEach> --%>
										<!-- 													</select> -->
										<%-- 													<c:forEach var="cinema" items="${cinemaList }"> --%>
										<!-- 														<input type="hidden" name="location_code" -->
										<%-- 															value="${cinema.get('location_code') }"> --%>
										<%-- 													</c:forEach> --%>
										<!-- 												</div> -->
										<!-- 											</div> -->
										<!-- 										</div> -->
									</div>
									<div class="row mb-3">
										<div class="form-floating mb-3 mb-md-0 text">
											<div>
												<textarea name="faq_answer" class="form-control"
													id="faq_answer" placeholder="내용" rows="10">${faqBoard.faq_answer }</textarea>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="mt-4 mb-0 col-md-6">
											<div class="d-grid">
												<input class="btn btn-primary btn-block btn-update"
													type="submit" value="수정">
											</div>
										</div>
										<div class="mt-4 mb-0 col-md-6">
											<div class="d-grid">
												<!-- 													<a class="btn btn-primary btn-block btn-del" onclick="deleteMovie()">삭제</a> -->
												<input class="btn btn-primary btn-block btn-del"
													type="button" onclick="faq_delete()" value="삭제">
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