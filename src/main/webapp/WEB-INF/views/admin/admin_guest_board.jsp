<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>아이무비관리자페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	function doDisplay() {

		let dis = document.querySelector(".admin-modal");

		if (dis.style.display = "none") {
			dis.style.display = "block"

		} else {
			dis.style.display = "none";
		}
	}

	function modalClose() {
		let dis = document.querySelector(".admin-modal");
		dis.style.display = "none";
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

			<!-- 		<a href="javascript:doDisplay();">dddd</a> -->
			<!-- 들어갈내용 -->
			<main>
				<!-- 모달 -->
				<div class="container modal admin-modal" style="display: none">
					<div class="row justify-content-center">
						<div class="col-lg-7">
							<div class="card border-1 mt-5">
								<div class="card-header">
									<button type="button" class="close-modal"
										onclick="modalClose()" style="border: none;">닫기</button>
									<h3 class="text-center font-weight-light my-4">비회원문의 내역</h3>
								</div>
								<div class="card-body">
									<form>
<!-- 										<div class="row mb-4"> -->
<!-- 											<h5 style="text-align: left">이미지수정</h5> -->
<!-- 											<div class="col-md-3 moviePoster"> -->
<!-- 												<div> -->
<!-- 													<img class="" -->
<!-- 														src="/movie-project/resources/images/movies/poster/m1.jpg"> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="col-md-8"> -->
<!-- 												<div class="filebox"> -->
<!-- 													<input class="upload-name" value="첨부파일" placeholder="첨부파일"> -->
<!-- 													<label for="file">파일올리기</label> <input type="file" -->
<!-- 														id="file"> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" id="inputFirstName" type="text"
														placeholder="Enter your first name" /> <label
														for="inputFirstName">작성자명</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-floating">
													<input class="form-control" id="inputLastName" type="text"
														placeholder="Enter your last name" /> <label
														for="inputLastName">작성일</label>
												</div>
											</div>
										</div>
<!-- 										<div class="row mb-3"> -->
<!-- 											<div class="col-md-6"> -->
<!-- 												<div class="form-floating"> -->
<!-- 													<input class="form-control" id="inputLastName" type="text" -->
<!-- 														placeholder="Enter your last name" /> <label -->
<!-- 														for="inputLastName">이메일</label> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="col-md-6"> -->
<!-- 												<div class="form-floating mb-3 mb-md-0"> -->
<!-- 													<input class="form-control" id="inputPassword" -->
<!-- 														type="password" placeholder="Create a password" /> <label -->
<!-- 														for="inputPassword">작성일</label> -->
<!-- 												</div> -->
<!-- 											</div> -->

<!-- 										</div> -->
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" id="inputPassword"
														type="password" placeholder="Create a password" /> <label
														for="inputPassword">제목</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" id="inputPasswordConfirm"
														type="password" placeholder="Confirm password" /> <label
														for="inputPasswordConfirm">답글유무</label>
												</div>
											</div>
										</div>
										<div class="row mb-3">
											<div class="col-md">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" id="inputFirstName" type="text"
														placeholder="Enter your first name" /> <label
														for="inputFirstName">내용</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="mt-4 mb-0 col-md-6">
												<div class="d-grid">
													<a class="btn btn-primary btn-block" href="">수정</a>
												</div>
											</div>
											<div class="mt-4 mb-0 col-md-6">
												<div class="d-grid">
													<a class="btn btn-primary btn-block" href="">삭제</a>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 테이블 -->
				<div class="datatable-container">
					<h3 class="text-center font-weight-light my-4">비회원문의내역</h3>
					<table id="datatablesSimple" class="datatable-table">
						<thead>
							<tr>
								<th data-sortable="true" style="width: 7%;"><a href="#"
									class="datatable-sorter">작성자</a></th>
								<th data-sortable="true" style="width: 10%;"><a href="#"
									class="datatable-sorter">극장위치</a></th>
								<th data-sortable="true" style="width: 13%;"><a href="#"
									class="datatable-sorter">제목</a></th>
<!-- 								<th data-sortable="true" style="width: 10%;"><a href="#" -->
<!-- 									class="datatable-sorter">내용</a></th> -->
								<th data-sortable="true" style="width: 7%;"><a href="#"
									class="datatable-sorter">작성일</a></th>
								<th data-sortable="true" style="width: 10%;"><a href="#"
									class="datatable-sorter">수정</a></th>
<!-- 								<th data-sortable="true" style="width: 20%;"><a href="#" -->
<!-- 									class="datatable-sorter">줄거리</a></th> -->
<!-- 								<th data-sortable="true" style="width: 20%;"><a href="#" -->
<!-- 									class="datatable-sorter">수정</a></th> -->
							</tr>
						</thead>
						<!-- 회원목록 -->
						<tbody>
							<tr data-index="0">
								<td>작성자</td>
								<td>극장위치</td>
								<td>제목</td>
<!-- 								<td>120분</td> -->
<!-- 								<td>2023-04-05</td> -->
<!-- 								<td>2099-04-05</td> -->
								<td>작성일</td>
								<td class="modi"><input class="btn btn-block btn-more"
									type="button" value="M O R E" onclick="doDisplay()"></td>
							</tr>
						</tbody>
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
