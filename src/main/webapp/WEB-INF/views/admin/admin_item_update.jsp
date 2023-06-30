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
                            <h3 class="text-center font-weight-light my-4">스토어 상품 수정</h3>
                            </div>
                            <div class="card-body">
								<form action="admin_item_updatePro">
									<div class="row mb-3">
										<div class="col-md-6">
											<div class="form-floating mb-3 mb-md-0">
												<input name="item_code" readonly="readonly" class="form-control info_movie_code" id="info_movie_code" type="text" value="${item.get('item_code') }" />
												<label for="item_code">상품코드</label>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-floating">
												<input name="item_type"  class="form-control info_movie_title" id="info_movie_title" type="text" value="${item.get('item_type') }"/> 
												<label for="item_type">상품타입</label>
											</div>
										</div>
									</div>
									<div class="row mb-3">
										<div class="col-md-6">
											<div class="form-floating">
												<input name="item_name" class="form-control info_year" id="info_year" type="text" value="${item.get('item_name') }"/>
												<label for="info_year">상품이름</label>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-floating mb-3 mb-md-0">
												<input name="item_price" class="form-control info_time" id="info_time" type="text" value="${item.get('item_price') }"/>
												<label for="info_time">상품가격</label>
											</div>
										</div>
							
									</div>
									<div class="row mb-3">
										<div class="col-md-6">
											<div class="form-floating mb-3 mb-md-0">
												<input name="item_detail" class="form-control info_movie_code" id="info_movie_code" type="text" value="${item.get('item_detail') }" />
												<label for="info_movie_code">상세설명</label>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-floating">
												<input name="item_image"  class="form-control info_movie_title" id="info_movie_title" type="text" value="${item.get('item_image') }"/> 
												<label for="info_movie_title">상품이미지</label>
											</div>
										</div>
										
									</div>
									<div class="row mb-3">
										<div class="col-md-6">
											<div class="form-floating mb-3 mb-md-0">
												<input name="item_status" class="form-control info_movie_code" id="info_movie_code" type="text" value="${item.get('item_status') }" />
												<label for="info_movie_code">상품상태(new,hot,event)</label>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="mt-4 mb-0 col-md-6">
											<div class="d-grid">
												<input onclick="location.href='admin_item_updatePro'" class="btn btn-primary btn-block" type="submit" value="수정">
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
