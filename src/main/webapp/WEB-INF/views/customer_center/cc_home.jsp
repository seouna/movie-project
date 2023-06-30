<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이무비</title>
</head>
<link
	href="${pageContext.request.contextPath }/resources/css/common.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/inc.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/sub.css"
	rel="stylesheet">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/main.css"
	rel="stylesheet">
<script type="text/javascript">

function search(idx) {
	idx = parseInt(idx);
	document.querySelector("input[name=startNum]").value = 0;
	document.querySelector("input[name=endNum]").value = 5;
	let form = document.querySelector('#iForm');
	form.action = 'faq';
	form.method = 'post';
	form.submit();
}
</script>
<body>
	<jsp:include page="../nav.jsp" />

	<div class="container has-lnb">

		<div class="inner-wrap">
			<jsp:include page="lnb-area.jsp" />
			<div id="contents" class="">
				<h2 class="tit">고객센터 홈</h2>

				<!-- input-search-area -->
				<div class="input-search-area mb30">
					<div class="input-area">
						<label for="search01" class="label">빠른검색</label>

						<div class="board-search w460px">
<!-- 							<input type="search" id="searchTxt" title="검색어를 입력해 주세요." -->
<!-- 								placeholder="검색어를 입력해 주세요." class="input-text" maxlength="15"> -->
<!-- 							<button type="button" class="btn-search-input" id="searchBtn">검색</button> -->
							<%-- 검색타입목록, 검색창 추가 --%>
							<form action="faq">
							<input type="search" id="searchTxt" name="searchKeyword" title="검색어를 입력해 주세요."
								placeholder="검색어를 입력해 주세요." class="input-text" maxlength="15"
								value="${param.searchKeyword }">
							<button type="submit" class="btn-search-input" id="searchBtn">검색</button>
							</form>
						</div>
					</div>

					<div class="btn-area"></div>
				</div>
				<!--// input-search-area -->

				<div class="custo-main">
					<div class="main-block">
						<div class="block-content">
							<a href="lost_board" title="분실물 문의 페이지로 이동">
								<p>
									<strong>분실물 문의</strong> 잃어버린 물건을 접수해 주시면<br>신속히 찾아드리겠습니다.
								</p>
							</a>
						</div>
						<div class="block-content">
							<a href="oneOnOne" title="1:1 문의 페이지로 이동">
								<p>
									<strong>1:1 문의</strong> 해결되지않은 문제가 있나요?<br>1:1문의로 문의주세요
								</p>
							</a>
						</div>
						<div class="block-content">
							<a href="faq" title="자주 묻는 질문 페이지로 이동">
								<p>
									<strong>자주 묻는 질문</strong> 자주 묻는 질문<br>빠르고 간편하게 검색하세요.
								</p>
							</a>
						</div>
					</div>
<!-- <form id="iForm"> -->
<%-- 							<input type="hidden" name="startNum" value="${paramMap.startNum}"> --%>
<%-- 							<input type="hidden" name="endNum" value="${paramMap.endNum}"> --%>
					<div class="notice-wrap">
						<div class="block left">
							<div class="tit-area">
								<h3 class="tit small">자주 묻는 질문 BEST5</h3>

								<a href="faq" class="more" title="더보기">더보기 <i
									class="iconset ico-arr-right-gray ml07"></i></a>
							</div>
							<div class="">
								<c:forEach var="faqBoard" items="${faqBoardList }">
								<ol class="decimal-list">
									<li><a href="faq_detail?faq_code=${faqBoard.faq_code }" class="faqBtn" data-idx="1" title="질문 상세보기">
											<span class="font-roboto"></span> 
											<span class="font-gblue">${faqBoard.faq_group }</span> ${faqBoard.faq_question } 
											<span class="date">${faqBoard.faq_write_date }</span>
									</a></li>
								</ol>
								</c:forEach>
							</div>
						</div>

						<div class="block right">
							<div class="tit-area">
								<h3 class="tit small">공지사항</h3>

								<a href="notice_board" class="more" title="더보기">더보기 <i
									class="iconset ico-arr-right-gray ml07"></i></a>
							</div>

							<div class="decimal-list">
								<c:forEach var="noticeBoard" items="${noticeBoardList }">
									<ol>
										<li><a href="notice_detail?notice_code=${noticeBoard.notice_code }" class="moveBtn" data-no="10813" title="공지사항 상세보기"> <span class="font-purple">
											<i class="iconset ico-marker"></i> ${noticeBoard.cinema_name }</span> 
											${noticeBoard.notice_subject } <span class="date">${noticeBoard.notice_write_date }</span>
										</a></li>
									</ol>
								</c:forEach>
							</div>
						</div>
					</div>
<!-- </form> -->
				</div>

			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>