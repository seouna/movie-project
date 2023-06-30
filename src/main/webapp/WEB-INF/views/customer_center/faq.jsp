<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>아이무비</title>
</head>
<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/inc.css" rel="stylesheet">
<!-- 상단 -->
<link href="${pageContext.request.contextPath }/resources/css/sub.css" rel="stylesheet">
<!-- 본문 -->
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<!-- <link href="resources/css/main.css" rel="stylesheet"> -->
<script type="text/javascript">

function search(idx) {
	idx = parseInt(idx);
	document.querySelector("input[name=pageNum]").value = (Number(idx)+1);
	document.querySelector("input[name=startNum]").value = Number(idx)*10;
	document.querySelector("input[name=endNum]").value = (Number(idx)+1)*10 - Number(idx)*10;
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
			<form id="iForm">
				<h2 class="tit">자주 묻는 질문</h2>
				
				<!-- input-search-area -->
				<div class="input-search-area mb30">
					<div class="input-area">
						<label for="search01" class="label">빠른검색</label>

						<div class="board-search w460px">
							<%-- 검색타입목록, 검색창 추가 --%>
							<input type="search" id="searchTxt" name="searchKeyword" title="검색어를 입력해 주세요."
								placeholder="검색어를 입력해 주세요." class="input-text" maxlength="15"
								value="${param.searchKeyword }">
							<button type="button" id="searchBtn" class="btn-search-input" onclick="search('0');">검색</button>
						</div>
					</div>

					<div class="btn-area"></div>
				</div>
				<!--// input-search-area -->
				
				<div class="board-list-util">
					<p class="result-count">
						<strong>전체 <em class="font-gblue">${paramMap.totalCnt == null ? 0 : paramMap.totalCnt}</em>건
						</strong>
					</p>
				</div>

				<div class="wrap-customer-box wrap-faq-box">
					<div class="faq-desc">자주 찾는 질문 전체가 기본으로 표시됩니다. 원하는 구분의 목록만
						보려면 아래 구분 메뉴에서 선택해주세요.</div>
					<div class="faq-cat-selector">
						<div class="wrap-select">
							<select class="faq-category" name="faq_group" onchange="search('0');">
								<option value="전체" <c:if test="${paramMap.faq_group eq '전체'}">selected</c:if>>전체</option>
								<option value="예매" <c:if test="${paramMap.faq_group eq '예매'}">selected</c:if>>예매</option>
								<option value="관람권" <c:if test="${paramMap.faq_group eq '관람권'}">selected</c:if>>관람권</option>
								<option value="멤버십" <c:if test="${paramMap.faq_group eq '멤버십'}">selected</c:if>>멤버십</option>
								<option value="할인혜택" <c:if test="${paramMap.faq_group eq '할인혜택'}">selected</c:if>>할인혜택</option>
								<option value="영화관이용" <c:if test="${paramMap.faq_group eq '영화관이용'}">selected</c:if>>영화관이용</option>
							</select>
						</div>
					</div>
					<div class="table-wrap">
					<table class="board-list">
						<caption>번호, 극장, 구분, 제목, 등록일이 들어간 공지사항 전체 리스트</caption>
						<colgroup>
							<col style="width: 70px;">
							<col style="width: 180px;">
							<col style="width: 300px;">
							<col>
							<col style="width: 1px;">
						</colgroup>
						<thead>
							<tr style="line-height: 38px">
								<th scope="col">번호</th>
								<th scope="col">구분</th>
								<th scope="col">제목</th>
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
							<input type="hidden" name="table_name" value="">
							<input type="hidden" name="code" value="">
							<c:forEach var="faqBoard" items="${faqBoardList }">
								<tr data-index="0">
									<td>${faqBoard.rownum }</td>
									<td>${faqBoard.faq_group }</td>
									<td id="faq_question"><a
										href="faq_detail?faq_code=${faqBoard.faq_code }">${faqBoard.faq_question }</a>
									</td>
									<td>${faqBoard.faq_write_date }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				</div>
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
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>