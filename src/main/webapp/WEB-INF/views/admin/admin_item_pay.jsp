<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="${pageContext.request.contextPath }/resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="main">IMOVIE</a>
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
			
               <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
            <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">스토어 결제 관리</h3></div>
                                    <div class="card-body">
                                    <div class="tabs-cont">
										<div class="mb30">
											<div class="inp-box1">
												<form action="admin_item_pay">
													<select class="selectBoxCSS" name="searchType">
														<option value="pay_code" <c:if test="${param.searchType eq 'pay_code'}">selected</c:if>>결제코드</option>
														<option value="member_id" <c:if test="${param.searchType eq 'member_id'}">selected</c:if>>아이디</option>
														<option value="pay_date" <c:if test="${param.searchType eq 'pay_date'}">selected</c:if>>결제날짜</option>
													</select>
													<input type="text" name="searchKeyword" value="${param.searchKeyword }">
													<input type="submit" class="btn btn-primary btn-block" value="검색" />
												</form>
											</div>
										</div>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main><br><br>
                <br><br>
                <hr><br><br>
                <div class="datatable-container">
					<table id="datatablesSimple" class="datatable-table">
						<thead>
							<tr>
								<th data-sortable="true" style="width: 7%;"><a
									href="#" class="datatable-sorter">결제 코드</a></th>
								<th data-sortable="true" style="width: 10%;"><a
									href="#" class="datatable-sorter">회원 아이디</a></th>
								<th data-sortable="true" style="width: 10%;"><a
									href="#" class="datatable-sorter">상품 코드</a></th>
								<th data-sortable="true" style="width: 10%;"><a
									href="#" class="datatable-sorter">결제 타입</a></th>
								<th data-sortable="true" style="width: 10%;"><a
									href="#" class="datatable-sorter">결제 가격</a></th>
								<th data-sortable="true" style="width: 10%;"><a
									href="#" class="datatable-sorter">결제 날짜</a></th>
								<th data-sortable="true" style="width: 10%;"><a
									href="#" class="datatable-sorter">결제 취소 날짜</a></th>
								<th data-sortable="true" style="width: 10%;"><a
									href="#" class="datatable-sorter">결제 상태</a></th>
								<th data-sortable="true" style="width: 10%;"><a
									href="#" class="datatable-sorter"></a></th>
							</tr>
						</thead>
						<!-- 회원목록 -->
						<tbody>
							<c:forEach var="pay" items="${pay }">
							<tr data-index="0">
								<td>${pay.get('pay_code') }</td>
								<td>${pay.get('member_id') }</td>
								<td>${pay.get('item_code') }</td>
								<td>${pay.get('pay_type') }</td>
								<td>${pay.get('pay_price') }</td>
								<td>${pay.get('pay_date') }</td>
								<td>${pay.get('pay_cancel_date') }</td>
								<td>${pay.get('pay_status') }</td>
								<td>
									<input onclick="location.href='admin_item_payUpdate?pay_code=${pay.get('pay_code') }'"class="btn btn-primary btn-block" type="button" value="수정">
									<input onclick="location.href='admin_pay_delete?pay_code=${pay.get('pay_code') }'" class="btn btn-primary btn-block"  type="button" value="삭제">
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					
				</div>
            </div>
        </div>
			
			
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
