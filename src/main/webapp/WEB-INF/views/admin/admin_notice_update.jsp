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

	function notice_delete() {
		let delConfirm = confirm("삭제하시겠습니까?");
		if (delConfirm) {
			location.href = 'notice_delete_pro?notice_code=${noticeBoard.notice_code }';
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
								<h3 class="text-center font-weight-light my-4">공지사항 수정</h3>
							</div>
							<div class="card-body">
								<form action="notice_update_pro"
									onsubmit="return confirmUpdate()">
									<input type="hidden" name="notice_code"
										value="${noticeBoard.notice_code }">
									<div class="row mb-3">
										<div class="col-md-6 ">
											<div class="form-floating mb-3 mb-md-0 ">
												<input class="form-control" id="notice_subject"
													name="notice_subject" type="text"
													value="${noticeBoard.notice_subject }" /> <label
													for="notice_subject">제목</label>
											</div>
										</div>
										<div class="col-md-6 ">
											<div class="dropdown bootstrap-select">
												<div class="form-floating mb-3 mb-md-0 selectbox">
													<div class="cinema_name">
														<label for="cinema_name">문의지점 : </label> <select
															name="cinema_name" onchange="selectCinema()"
															style="margin-top: 0px; !important">
															<option value="${noticeBoard.cinema_name }" selected="selected" >${noticeBoard.cinema_name }</option>
															<option value="none" disabled>극장
																선택</option>
															<option value="none" disabled>=======================</option>
															<option value="전체공지">전체공지</option>
															<c:forEach var="cinema" items="${cinemaList }">
																<option value="${cinema.get('cinema_name') }">${cinema.get("cinema_name")}</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row mb-3">
										<div class="form-floating mb-3 mb-md-0 text">
											<div>
												<textarea name="notice_content" class="form-control"
													id="notice_content" placeholder="내용" rows="10">${noticeBoard.notice_content }</textarea>
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
													type="button" onclick="notice_delete()" value="삭제">
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