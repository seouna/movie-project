<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<title>아이무비</title>
</head>
<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/inc.css" rel="stylesheet">
<!-- 상단 -->
<link href="${pageContext.request.contextPath }/resources/css/sub.css" rel="stylesheet">
<!-- 본문 -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet">
<script type="text/javascript">
function search(idx) {
	idx = parseInt(idx);
	document.querySelector("input[name=pageNum]").value = (Number(idx)+1);
	document.querySelector("input[name=startNum]").value = Number(idx)*10;
	document.querySelector("input[name=endNum]").value = (Number(idx)+1)*10 - Number(idx)*10;
	let form = document.querySelector('#iForm');
	form.action = 'lost_board';
	form.method = 'post';
	form.submit();
}

function lost_form() {
	let form = document.querySelector('#iForm');
	form.action = 'lost_form';
	form.method = 'post';
	form.submit();
}

function goDetail(table_name, code) {
	document.querySelector("input[name=table_name]").value = table_name;
	document.querySelector("input[name=code]").value = code;
	let form = document.querySelector('#iForm');
	form.action = 'lost_detail';
	form.method = 'post';
	form.submit();
}

// 비밀번호 입력 모달창
function doDisplay(lost_code){
	document.querySelector("input[name=lost_code]").value = lost_code;
	let dis = document.querySelector(".modal-type2");
	if(dis.style.display="none"){
		dis.style.display="block"
	} else{
		dis.style.display="none";
	}
}
// 비밀번호 입력 모달창 닫기
function modalClose(){
	 $('.modal-type2').hide();
	 $("#resultArea").html("");
}

function chkPasswd(){
// 	alert("클릭");
// 	var lost_code = $("#lost_subject > a").attr("data-code");
	let lost_code = document.querySelector("input[name=lost_code]").value;
// var result;
// 	alert(lost_code);
// cosole.log($("#lost_subject"));

	$.ajax({
		url: 'lostDetailPro',
		type: 'POST',
// 		async : false,
// 		dataType: "json",
		dataType: "text",
		data: {
			lost_code : lost_code,
			lost_passwd : $("#passwd").val()
		},
		success : function(result) {
			console.log(result);
// 			return "location.href='lost_detail'";
			
			if(result == "true")		{
// 				alert(result);
				let url = 'lost_detail?lost_code=' + lost_code;
				location.replace(url);
			} else {
				console.log($(this).find("#resultArea"));
				$("#passwd").val("").focus();
				$("#resultArea").html("비밀번호가 틀렸습니다").css('color', 'red');
				
			}
		}
		
	})
	
}



</script>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="container has-lnb">
	<main>
	<div class="container modal admin-modal-register"
		style="display: none">
		<div class="row justify-content-center">
			<div class="col-lg-7">
				<div class="card border-1 mt-5">
					<div class="card-header">
						<button type="button" class="close-modal"
							onclick="modalClose()" style="border: none;">닫기</button>
						<h3 class="text-center font-weight-light my-4">공지사항 등록</h3>
					</div>
					<div class="row justify-content-center">
						<div class="col-lg-7" style="width: 700px">
							<div class="card-body">
								<form action="notice_register_pro">
									<div class="row mb-3">
										<div>
											<div class="form-floating mb-3 mb-md-0 ">
												<input class="form-control" id="notice_subject"
													name="notice_subject" type="text" value="" /> <label
													for="notice_subject">제목</label>
											</div>
										</div>
									</div>
									<div class="row mb-3">
										<div class="dropdown bootstrap-select">
											<div class="form-floating mb-3 mb-md-0 selectbox">
												<div class="cinema_name">
													<label for="cinema_name">문의지점 : </label> 
													<select name="cinema_name" onchange="selectCinema()"
														style="margin-top: 0px; !important">
														<option value="none" selected="selected" disabled>극장
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

									<hr>
									<div class="row mb-3">
										<div class="form-floating mb-3 mb-md-0 text">
											<div>
												<textarea name="notice_content" class="form-control"
													id="notice_content" placeholder="내용" rows="10"></textarea>
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
	
	
		<div class="inner-wrap">
			<jsp:include page="lnb-area.jsp" />
			<div id="contents">
			<form id="iForm">
				<h2 class="tit">분실물 문의</h2>

				<div class="clearfix">
					<ul class="dot-list">
						<li>IMOVIE에서 잃어버린 물건이 있다면 ‘분실물 문의/접수’를 통해 접수해주세요. 
							<button onclick="javascript:lost_form()" class="button" style="margin-left: 190px;">
							분실물 문의
							</button> 
<!-- 								<a href="lost_form" class="button float-r" title="분실물 문의 등록하기">분실물 문의</a> -->
						</li>
						<li>접수하신 글은 비밀글로 등록되어 작성자와 관리자만 확인 가능합니다.</li>
					</ul>
				</div>

				<div class="board-list-util">
					<p class="result-count">
						<strong>전체 <span id="totalCnt" class="font-gblue">${paramMap.totalCnt == null ? 0 : paramMap.totalCnt}</span>건
						</strong>
					</p>

					
					<div class="board-list-util">
						<div class="">
							<div>
								<div>
									<select name="cinema_name" onchange="">
										<option value="전체" selected="selected" >전체</option>
<!-- 										<option value="none" disabled>=======================</option> -->
										<c:forEach var="cinema" items="${cinemaList }">
<%-- 											<option value="${cinema.get('cinema_name') }">${cinema.get("cinema_name")}</option> --%>
											<option value="${cinema.cinema_name}" ${paramMap.cinema_name == cinema.cinema_name ? 'selected' : ''}>${cinema.cinema_name}</option>
										</c:forEach>
									</select>
									<select name="rep_board" onchange="" >
										<option value="전체" <c:if test="${paramMap.rep_board eq '전체'}">selected</c:if>>전체</option>
										<option value="답변완료" <c:if test="${paramMap.rep_board eq '답변완료'}">selected</c:if>>답변완료</option>
										<option value="미답변" <c:if test="${paramMap.rep_board eq '미답변'}">selected</c:if>>미답변</option>
									</select>
									<div class="board-search">
										<input type="text" id="searchTxt" name="searchKeyword" title="검색어를 입력해 주세요."
											placeholder="검색어를 입력해 주세요." class="input-text" value="${paramMap.searchKeyword}"
											maxlength="15">
										<button type="button" id="searchBtn" class="btn-search-input" onclick="search('0');">검색</button>
									</div>
								</div>
							</div>
							
							
						</div>
					</div>
					<div class="table-wrap">
						<table class="board-list">
							<caption>번호, 극장, 구분, 제목, 등록일이 들어간 공지사항 전체 리스트</caption>
							<colgroup>
								<col style="width: 72px;">
								<col style="width: 133px;">
								<col>
								<col style="width: 100px;">
								<col style="width: 116px;">
							</colgroup>
							<thead>
								<tr style="line-height: 38px; text-align: center;">
									<th scope="col">번호</th>
									<th scope="col">극장</th>
									<th scope="col">제목</th>
									<th scope="col">답변상태</th>
									<th scope="col">등록일</th>
								</tr>
							</thead>
							<tbody>
								<input type="hidden" name="memberName" value="${paramMap.memberName}">
								<input type="hidden" name="memberTel" value="${paramMap.memberTel}">
								<input type="hidden" name="memberEmail" value="${paramMap.memberEmail}">
								<input type="hidden" name="startNum" value="${paramMap.startNum}">
								<input type="hidden" name="endNum" value="${paramMap.endNum}">
								<input type="hidden" name="pageNum" value="${paramMap.pageNum}">
								<input type="hidden" name="lost_board" value="">
								<input type="hidden" name="lost_code" value="">
								<c:forEach var="lostBoard" items="${lostBoardList }">
									<tr>
										<td>${lostBoard.rownum }</td>
										<td>${lostBoard.cinema_name }</td>
										<td id="lost_subject"><a
<%-- 											href="lost_detail?lost_code=${lostBoard.lost_code }">${lostBoard.lost_subject }</a> --%>
											href="javascript:doDisplay('${lostBoard.lost_code}');" >${lostBoard.lost_subject }</a>
<%-- 											href="javascript:doDisplay();" class="chkPasswd" data-code="${lostBoard.lost_code}">${lostBoard.lost_subject }</a> --%>
<%-- 											href="javascript:doDisplay();" class="lost_code"  data-code="${lostBoard.lost_code}">${lostBoard.lost_subject }</a> --%>
										</td>
										<td>${lostBoard.lost_board_rep }</td>
										<td>${lostBoard.lost_write_date }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					
					<!-- 글 조회 비밀번호 입력 모달창 -->
					<div class="modal modal-type2" id="chkPasswd" tabindex="-1" style="display: none;" align="left">
						<div class="modal-dialog" style="max-width: 400px; margin-top: 322.5px;">
							<div class="modal-content">
								<div class="modal-header">
									<h3 class="tit">
										비밀번호 입력
									</h3>
									<button type="button" class="close-modal"  onclick="modalClose()">닫기</button>
								</div>
								<div class="modal-body">
<!-- 									<p>글 작성시 입력한 비밀번호를 입력해주세요.</p> -->
<!-- 									<input type="password" id="passwd" title="비밀번호 입력" class="input-text w250px"> -->
<!-- 									<p class="font-red mt10 mb0" style="display: none;">비밀번호가 일치하지 않습니다. 다시 입력해주세요.</p> -->
									<h3 class="h3-member">글 작성시 입력한 비밀번호를 입력해주세요.</h3>
									<div class="inp-box1 mb20">
										<input type="password" id="passwd" name="passwd" class="inp-member onlyNumber" placeholder="비밀번호를 입력해주세요">
									</div>
									<div id="resultArea"></div>
								</div>
								<div class="modal-bottom flex">
									<button type="button" class="btn-modal1" onclick="modalClose()">취소</button>
									<button type="button" class="btn-modal2" onclick="chkPasswd()">확인</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 글 조회 비밀번호 입력 모달창 -->

<!-- 					<section id="layer-01" class="layer-popup" -->
<!-- 						style="top: 31px; left: 304.5px; width: 500px; height: 300px; opacity: 1; display: none;"> -->
<!-- 						<div class="wrap"> -->
<!-- 							<header class="layer-header"> -->
<!-- 								<h3 class="tit">비밀번호 입력</h3> -->
<!-- 							</header> -->
<!-- 							<div class="layer-con"> -->
<!-- 								<p>글 작성시 입력한 비밀번호를 입력해주세요.</p> -->
<!-- 								<div class="box-gray a-c"> -->
<!-- 									<input type="password" id="password" title="비밀번호 입력" -->
<!-- 										class="input-text w250px"> -->
<!-- 									<p class="font-red mt10 mb0">비밀번호가 일치하지 않습니다. 다시 입력해주세요.</p> -->
<!-- 								</div> -->
<!-- 								<div class="btn-group"> -->
<!-- 									<a href="#" class="button small lyclose" id="cancelBtn" -->
<!-- 										title="취소">취소</a> <a href="#" class="button small purple" -->
<!-- 										id="chkBtn" title="확인">확인</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<button type="button" class="btn-layer-close">레이어 닫기</button> -->
<!-- 						</div> -->
<!-- 					</section> -->
					
<!-- 					<section id="layer-01" class="layer-popup"  -->
<!-- 					style="top: 334.5px; left: 394.5px; width: 350px; height: 300px; opacity: 1; display: block;"> -->
<!-- 						<div class="wrap"> -->
<!-- 							<header class="layer-header"> -->
<!-- 								<h3 class="tit"> -->
<!-- 									비밀번호 입력 -->
<!-- 								</h3> -->
<!-- 							</header> -->
				
<!-- 							<div class="layer-con" style="height: 300px;"> -->
<!-- 								<p>글 작성시 입력한 비밀번호를 입력해주세요.</p> -->
<!-- 								<div class="box-gray a-c"> -->
<!-- 									<input type="password" id="password" title="비밀번호 입력" class="input-text w250px"> -->
<!-- 									<p class="font-red mt10 mb0" style="display: none;">비밀번호가 일치하지 않습니다. 다시 입력해주세요.</p> -->
<!-- 								</div> -->
<!-- 								<div class="btn-group"> -->
<!-- 									<a href="#" class="button small lyclose" id="cancelBtn" title="취소">취소</a> -->
<!-- 									<a href="#" class="button small purple" id="chkBtn" title="확인">확인</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
				
<!-- 							<button type="button" class="btn-layer-close">레이어 닫기</button> -->
<!-- 						</div> -->
<!-- 					</section> -->
					
					

					<!-- pagination -->
					<nav class="pagination">
						<c:if test="${1 < paramMap.pageNum }">
							<a title="처음 페이지 보기" href="javascript:search('0')" class="control first" pagenum="1">first</a>
							<a title="이전 페이지 보기" href="javascript:search('${paramMap.pageNum-2}')" class="control prev" pagenum="1">prev</a>
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
							<a title="이후 페이지 보기" href="javascript:search('${paramMap.pageNum}')" class="control next" pagenum="11">next</a> 
							<a title="마지막 페이지 보기" href="javascript:search('${paramMap.totalCnt/10 + (paramMap.totalCnt%10> 0 ? 1 : 0) -1}')" class="control last" pagenum="586">last</a>
						</c:if>
					</nav>
					<!--// pagination -->
				</div>
				</form>
			</div>
		</div>
		</main>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>