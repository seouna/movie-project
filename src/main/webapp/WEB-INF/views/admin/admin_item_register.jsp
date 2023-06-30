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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">스토어 상품 등록</h3></div>
                                    <div class="card-body">
                                        <form action="admin_item_registerPro">
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input name="item_code" class="form-control" id="inputFirstName" type="text" placeholder="Enter your first name" />
                                                        <label for="inputFirstName">상품 코드</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input name="item_type" class="form-control" id="inputLastName" type="text" placeholder="Enter your last name" />
                                                        <label for="inputLastName">상품 타입</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input name="item_name" class="form-control" id="inputFirstName" type="text" placeholder="Enter your first name" />
                                                        <label for="inputFirstName">상품 이름</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input name="item_price" class="form-control" id="inputLastName" type="text" placeholder="Enter your last name" />
                                                        <label for="inputLastName">상품 가격</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input name="item_detail" class="form-control" id="inputPassword" type="text" placeholder="Create a password" />
                                                        <label for="inputPassword">상세 설명</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input name="item_image" class="form-control" id="inputPasswordConfirm" type="text" placeholder="Confirm password" />
                                                        <label for="inputPasswordConfirm">상품 이미지</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input name="item_status" class="form-control" id="inputPasswordConfirm" type="text" placeholder="Confirm password" />
                                                        <label for="inputPasswordConfirm">상품 상태(new, hot, event)</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><input class="btn btn-primary btn-block" type="submit" value="등록하기"></div>
                                            </div>
                                        </form>
                                     </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main><br><br>
                <hr><br><br>
                <div class="datatable-container">
	                <form action="admin_item_register">
	                	<div align="center">
						<select class="selectBoxCSS" name="searchType">
							<option value="item_type" <c:if test="${param.searchType eq 'item_type'}">selected</c:if>>상품타입</option>
							<option value="item_name" <c:if test="${param.searchType eq 'item_name'}">selected</c:if>>상품이름</option>
							<option value="item_status" <c:if test="${param.searchType eq 'item_status'}">selected</c:if>>상품상태</option>
						</select>
						<input type="text" name="searchKeyword" value="${param.searchKeyword }">
						<input type="submit" class="btn btn-primary btn-block" value="검색" />
						</div>
					</form><br><br>
					<table id="datatablesSimple" class="datatable-table">
						<thead>
							<tr>
								<th data-sortable="true" style="width: 7%;"><a
									href="#" class="datatable-sorter">상품 코드</a></th>
								<th data-sortable="true" style="width: 7%;"><a
									href="#" class="datatable-sorter">상품 타입</a></th>
								<th data-sortable="true" style="width: 15%;"><a
									href="#" class="datatable-sorter">상품 이름</a></th>
								<th data-sortable="true" style="width: 7%;"><a
									href="#" class="datatable-sorter">상품 가격</a></th>
								<th data-sortable="true" style="width: 15%;"><a
									href="#" class="datatable-sorter">상세 설명</a></th>
								<th data-sortable="true" style="width: 10%;"><a
									href="#" class="datatable-sorter">상품 이미지</a></th>
								<th data-sortable="true" style="width: 15%;"><a
									href="#" class="datatable-sorter">상품 상태(new, hot, event)</a></th>
								<th data-sortable="true" style="width: 10%;"><a
									href="#" class="datatable-sorter"></a></th>
							</tr>
						</thead>
						<!-- 회원목록 -->
						<c:forEach var="item" items="${itemList }">
						<tbody>
							<tr style="text-align: center;" data-index="0">
								<td>${item.get("item_code") }</td>
								<td>${item.get("item_type") }</td>
								<td>${item.get("item_name") }</td>
								<td>${item.get("item_price") }</td>
								<td>${item.get("item_detail") }</td>
								<td><img alt="" src="${item.get('item_image') }"></td>
								<td>${item.get("item_status") }</td>
								<td>
									<input onclick="location.href='admin_item_update?item_code=${item.get('item_code')}'" class="btn btn-primary btn-block" type="button" value="수정">
									<input onclick="location.href='admin_item_delete?item_code=${item.get('item_code')}'" class="btn btn-primary btn-block" type="button" value="삭제">
								</td>
							</tr>
						</tbody>
						</c:forEach>
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
