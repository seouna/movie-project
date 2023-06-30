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
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/css/styles.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script type="text/javascript">

	function search(idx) {
		idx = parseInt(idx);
		document.querySelector("input[name=pageNum]").value = (Number(idx)+1);
		document.querySelector("input[name=startNum]").value = Number(idx)*10;
		document.querySelector("input[name=endNum]").value = (Number(idx)+1)*10 - Number(idx)*10;
		let form = document.querySelector('#iForm');
		form.action = 'admin_faq';
		form.method = 'post';
		form.submit();
	}

	function modalClose() {
		let dis = document.querySelector(".modal");
		let dis2 = document.querySelector(".admin-modal-update");
		dis.style.display = "none";
		dis2.style.display = "none";
	}

	function doDisplay() {

		let dis2 = document.querySelector(".admin-modal-update");

		if (dis2.style.display = "none") {
			dis2.style.display = "block"

		} else {
			dis2.style.display = "none";
		}
	}

	function doFaqRegister() {

		let dis = document.querySelector(".admin-modal-register");

		if (dis.style.display = "none") {
			dis.style.display = "block"

		} else {
			dis.style.display = "none";
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
				
				$('.selectScreen_name option').remove();
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
				<!-- 등록 모달 -->
				<div class="container modal admin-modal-register"
					style="display: none">
					<div class="row justify-content-center">
						<div class="col-lg-7">
							<div class="card border-1 mt-5">
								<div class="card-header">
									<button type="button" class="close-modal"
										onclick="modalClose()" style="border: none;">닫기</button>
									<h3 class="text-center font-weight-light my-4">자주묻는 질문 등록</h3>
								</div>
								<div class="row justify-content-center">
									<div class="col-lg-7" style="width: 700px">
										<div class="card-body">
											<form action="faq_register_pro">
												<div class="row mb-3">
													<div>
														<div class="form-floating mb-3 mb-md-0 ">
															<input class="form-control" id="faq_question"
																name="faq_question" type="text" value="" /> <label
																for="faq_question">질문</label>
														</div>
													</div>
												</div>
												<div class="row mb-3">
													<div class="dropdown bootstrap-select">
														<div class="form-floating mb-3 mb-md-0 selectbox">
															<div class="cinema_name">
																<label for="faq_group">문의유형 : </label> <select
																	name="faq_group" 
																	style="margin-top: 0px; !important">
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
												<hr>
												<div class="row mb-3">
													<div class="form-floating mb-3 mb-md-0 text">
														<div>
															<textarea name="faq_answer" class="form-control"
																id="faq_answer" placeholder="내용" rows="10"></textarea>
														</div>
													</div>
												</div>

												<div class="row">
													<div class="mt-4 mb-0 ">
														<div class="d-grid">
															<input class="btn btn-primary btn-block" type="submit"
																value="등록">
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- ================================================================= -->
				
				<!-- 테이블 -->
				<div class="datatable-container">
					<h3 class="text-center font-weight-light my-4">자주묻는 질문</h3>
					<form id="iForm">
					<div class="">
						<div class="selectbox searchbox"
							style="display: inline-block; float: right; margin-bottom: 25px; margin-top: -19px; width: 475px; padding-left: 11px;">
							
								<div class="sch_movie_code">
									<select class="faq-category" name="faq_group" onchange="search('0');"
									style="width: 150px; height: 32px; border: 1px solid #aeaeae;">
										<option value="전체" <c:if test="${paramMap.faq_group eq '전체'}">selected</c:if>>전체</option>
										<option value="예매" <c:if test="${paramMap.faq_group eq '예매'}">selected</c:if>>예매</option>
										<option value="관람권" <c:if test="${paramMap.faq_group eq '관람권'}">selected</c:if>>관람권</option>
										<option value="멤버십" <c:if test="${paramMap.faq_group eq '멤버십'}">selected</c:if>>멤버십</option>
										<option value="할인혜택" <c:if test="${paramMap.faq_group eq '할인혜택'}">selected</c:if>>할인혜택</option>
										<option value="영화관이용" <c:if test="${paramMap.faq_group eq '영화관이용'}">selected</c:if>>영화관이용</option>
									</select>
									<input class="datatable-input" value="${param.searchKeyword }" name="searchKeyword" type="search" 
									placeholder="검색어를 입력해 주세요." aria-controls="datatablesSimple" style="width: 210px;">
									<input class="btn btn-block btn-more" type="button" value="검색" onclick="search('0');"
										style="height: 32px; line-height: 16px; margin-bottom: 5px; background-color: #ffffff;">
<!-- 									<input type="search" id="searchTxt" name="searchKeyword" title="검색어를 입력해 주세요." -->
<!-- 										placeholder="검색어를 입력해 주세요." class="input-text" maxlength="15" -->
<%-- 										value="${param.searchKeyword }"> --%>
<!-- 									<button type="button" id="searchBtn" class="btn-search-input" onclick="search('0');" -->
<!-- 									style="height: 32px; line-height: 16px; margin-bottom: 5px; background-color: #ffffff;">검색</button> -->
								</div>
							
						</div>
					</div>
					
					<input class="btn btn-block btn-more" type="button" value="자주묻는 질문 등록" onclick="doFaqRegister()">
					<div>
						<strong>전체 <em class="font-gblue">${paramMap.totalCnt == null ? 0 : paramMap.totalCnt}</em>건</strong>
					</div>
					<table id="datatablesSimple" class="datatable-table">
						<thead>
							<tr>
								<th data-sortable="true" style="width: 5%;"><a href="#"
									class="datatable-sorter">질문번호</a></th>
								<th data-sortable="true" style="width: 10%;"><a href="#"
									class="datatable-sorter">문의유형</a></th>
								<th data-sortable="true" style="width: 13%;"><a href="#"
									class="datatable-sorter">제목</a></th>
								<!-- 								<th data-sortable="true" style="width: 10%;"><a href="#" -->
								<!-- 									class="datatable-sorter">내용</a></th> -->
								<th data-sortable="true" style="width: 7%;"><a href="#"
									class="datatable-sorter">작성일</a></th>
								<th data-sortable="true" style="width: 7%;"><a href="#"
									class="datatable-sorter">수정/삭제</a></th>
								<!-- 								<th data-sortable="true" style="width: 20%;"><a href="#" -->
								<!-- 									class="datatable-sorter">줄거리</a></th> -->
								<!-- 								<th data-sortable="true" style="width: 20%;"><a href="#" -->
								<!-- 									class="datatable-sorter">수정</a></th> -->
							</tr>
						</thead>
						<!-- 목록 -->
						<tbody>
							<input type="hidden" name="memberName" value="${paramMap.memberName}">
							<input type="hidden" name="memberTel" value="${paramMap.memberTel}">
							<input type="hidden" name="memberEmail" value="${paramMap.memberEmail}">
							<input type="hidden" name="startNum" value="${paramMap.startNum}">
							<input type="hidden" name="endNum" value="${paramMap.endNum}">
							<input type="hidden" name="pageNum" value="${paramMap.pageNum}">
							<input type="hidden" name="table_name" value="">
							<input type="hidden" name="code" value="">
							<c:forEach var="faqBoard" items="${faqBoardList }">
								<tr data-index="0">
									<td>${faqBoard.rownum }</td>
									<td>${faqBoard.faq_group }</td>
									<td>${faqBoard.faq_question }</td>
									<td>${faqBoard.faq_write_date }</td>
									<td class="modi"><input class="btn btn-block btn-more"
										type="button" value="M O R E" onclick="location.href='admin_faq_update?faq_code=${faqBoard.faq_code }'"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
						<!-- pagination 1 -->
						<div class="datatable-bottom">
						<nav class="datatable-pagination">
						<ul class="datatable-pagination-list">
							<c:if test="${1 < paramMap.pageNum }">
									<li class="datatable-pagination-list-item datatable-hidden"
										onclick="location.href='admin_schedule_register?pageNum=${pageNum - 1}'">
										<a href="javascript:search('${paramMap.pageNum-2}')" class="datatable-pagination-list-item-link" pagenum="1">‹</a>
									</li>
							</c:if>
							<c:forEach begin="${paramMap.pageNum-paramMap.pageNum%10}" end="${(paramMap.totalCnt == null ? 1 : paramMap.totalCnt/10) + (paramMap.totalCnt%10> 0 ? 1 : 0) -1}" varStatus="status">
								<c:choose>
									<c:when test="${paramMap.pageNum eq status.index+1}">
										<strong class="active">${status.index+1}</strong>
									</c:when>
									<c:otherwise>
										<a title="${status.index+1}페이지보기" href="javascript:search('${status.index}')" pageNum="${status.index+1}">${status.index+1}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${paramMap.totalCnt > 10*paramMap.pageNum }">
<%-- 								<a title="이후 페이지 보기" href="javascript:search('${paramMap.pageNum}')" class="control next" pagenum="11">next</a>  --%>
<%-- 								<a title="마지막 페이지 보기" href="javascript:search('${paramMap.totalCnt/10 + (paramMap.totalCnt%10> 0 ? 1 : 0) -1}')" class="control last" pagenum="586">last</a> --%>
								<li class="datatable-pagination-list-item datatable-hidden"
									onclick="location.href='admin_schedule_register?pageNum=${pageNum + 1}'">
									<a href="javascript:search('${paramMap.pageNum}')" class="datatable-pagination-list-item-link">›</a>
								</li>
							</c:if>
						</ul>
						</nav>
						</div>
					</form>
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
