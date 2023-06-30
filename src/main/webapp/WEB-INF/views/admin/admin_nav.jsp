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
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body>
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
					
					<!-- 무비 -->
					<div class="sb-sidenav-menu-heading">MOVIE</div>
						
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#movie" aria-expanded="false" aria-controls="movie">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 영화관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="movie" aria-labelledby="" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="admin_movie_register">최신영화등록</a>
								<a class="nav-link" href="admin_movie_comming_register">상영예정작등록</a>
							</nav>
						</div>
						
						
						
						<a class="nav-link" href="admin_schedule_register">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 상영일정관리
						</a>
						<a class="nav-link" href="resList">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 영화예매 관리
						</a>
						
						<!-- board -->
						<div class="sb-sidenav-menu-heading">BOARD</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#boardMgm" aria-expanded="false" aria-controls="boardMgm">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> 게시판 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="boardMgm" aria-labelledby="" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
								<a class="nav-link" href="admin_notice_board"> 공지사항</a>
								<a class="nav-link" href="admin_oneOnOne">1:1문의게시판</a>
<!-- 								<a class="nav-link" href="admin_guest_board">비회원문의내역</a> 겹쳐서 삭제 -->
								<a class="nav-link" href="admin_lost_board">분실물게시판</a>
								<a class="nav-link" href="admin_faq">자주하는질문</a>
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">STORE</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#storeMgm" aria-expanded="false" aria-controls="storeMgm">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 스토어관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="storeMgm" aria-labelledby="" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="admin_item_pay">결제관리</a>
								<a class="nav-link" href="admin_item_register">상품관리</a>
							</nav>
						</div>
						<!-- lnb -->
					</div>
				</div>
			</nav>
		</div>
</body>
</html>