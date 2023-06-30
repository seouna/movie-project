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
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="resources/js/jquery-3.6.4.js"></script>

<script type="text/javascript" src="resources/js/admin.js"></script>
<!-- 모달 -->
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
			<main>
				<!-- 수정/삭제 -->
                <div class="row justify-content-center">
                    <div class="col-lg-7" style="width: 1000px">
                        <div class="card border-1 mt-5">
                            <div class="card-header">
                            <h3 class="text-center font-weight-light my-4">스토어 결제 수정</h3>
                            </div>
                            <div class="card-body">
								<form action="admin_item_payUpdatePro">
									<div class="row mb-3">
										<div class="col-md-6">
											<div class="form-floating mb-3 mb-md-0">
												<input name="pay_code" readonly="readonly" class="form-control info_movie_code" id="info_movie_code" type="text" value="${pay.get('pay_code') }" />
												<label for="pay_code">결제 코드</label>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-floating">
												<input name="member_id" readonly="readonly" class="form-control info_movie_title" id="info_movie_title" type="text" value="${pay.get('member_id') }"/> 
												<label for="member_id">회원 아이디</label>
											</div>
										</div>
									</div>
									<div class="row mb-3">
										<div class="col-md-6">
											<div class="form-floating">
												<input name="item_code" class="form-control info_year" id="info_year" type="text" value="${pay.get('item_code') }"/>
												<label for="item_code">상품 코드</label>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-floating mb-3 mb-md-0">
												<input name="pay_type" class="form-control info_time" id="info_time" type="text" value="${pay.get('pay_type') }"/>
												<label for="pay_type">결제 타입</label>
											</div>
										</div>
							
									</div>
									<div class="row mb-3">
										<div class="col-md-6">
											<div class="form-floating mb-3 mb-md-0">
												<input name="pay_price" class="form-control info_movie_code" id="info_movie_code" type="text" value="${pay.get('pay_price') }" />
												<label for="pay_price">결제 가격</label>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-floating">
												<input name="pay_date"  class="form-control info_movie_title" id="info_movie_title" type="text" value="${pay.get('pay_date') }"/> 
												<label for="pay_date">결제 날짜</label>
											</div>
										</div>
										
									</div>
									<div class="row mb-3">
										<div class="col-md-6">
											<div class="form-floating mb-3 mb-md-0">
												<input name="pay_cancel_date" class="form-control info_movie_code" id="info_movie_code" type="text" value="${pay.get('pay_cancel_date') }" />
												<label for="pay_cancel_date">결제 취소날짜</label>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-floating mb-3 mb-md-0">
												<input name="pay_status" class="form-control info_movie_code" id="info_movie_code" type="text" value="${pay.get('pay_status') }" />
												<label for="pay_status">결제 상태</label>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="mt-4 mb-0 col-md-6">
											<div class="d-grid">
												<input class="btn btn-primary btn-block" type="submit" value="수정">
											</div>
										</div>
										<div class="mt-4 mb-0 col-md-6">
											<div class="d-grid">
												<input onclick="history.back()" class="btn btn-block btn-more" type="button" value="돌아가기">
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
</body>
</html>
