<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>아이무비</title>
<script type="text/javascript">
	function deleteLost() {
		let result = confirm("삭제 하시겠습니까?");
		if (result) {
			location.href = "notice_deletePro?notice_code=" + $
			{
				map.notice_code
			}
			;
		}
	}
</script>
</head>
<link
	href="${pageContext.request.contextPath }/resources/css/common.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/inc.css"
	rel="stylesheet">
<!-- 상단 -->
<link href="${pageContext.request.contextPath }/resources/css/sub.css"
	rel="stylesheet">
<!-- 본문 -->
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/main.css"
	rel="stylesheet">
<body>
	<jsp:include page="../nav.jsp" />
	<div class="container has-lnb">
		<div class="inner-wrap">
			<jsp:include page="lnb-area.jsp" />

			<div id="contents">
				<h2 class="tit">공지사항</h2>

				<div class="table-wrap">
					<div class="board-view">
						<div class="tit-area">
							<p class="tit">${map.notice_subject }</p>
						</div>

						<div class="info">
							<p>
								<span class="tit">영화관</span> <span class="txt">${map.cinema_name }</span>
							</p>
							<p>
								<span class="tit">구분</span> <span class="txt">공지</span>
							</p>
							<p>
								<span class="tit">등록일</span> <span class="txt">${map.notice_write_date }</span>
							</p>
						</div>
						<div class="cont">
							<textarea rows="5" cols="30" readonly=""
								class="input-textarea view" style="border: none;">${map.notice_content }</textarea>
						</div>
					</div>
				</div>
				
<!-- 				<div class="prev-next"> -->
<!-- 					<div class="line prev"> -->
<!-- 						<p class="tit">이전</p> -->
<!-- 						<p class="link">이전 글이 없습니다.</p> -->
<%-- 						<p class="notice_detail?notice_code=${noticeBoard.notice_code }&prevNum=${noticeBoard.prevNum }&nextNum${noticeBoard.nextNum }">${noticeBoard.notice_subject }</p> --%>
<%-- 							<c:if test="${noticeBoard.prevNum ne '0' } "> --%>
<%-- 								<a href="notice_detail?notice_code=${noticeBoard.notice_code }&prevNum=${noticeBoard.prevNum }&nextNum${noticeBoard.nextNum }"></a> --%>
<%-- 							</c:if></p> --%>
						
<!-- 					</div> -->
<!-- 					<div class="line next"> -->
<!-- 						<p class="tit">다음</p> -->
<!-- 						<a href="#" class="link moveBtn" data-no="10826" -->
<!-- 							title=""></a> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
<!-- 				<nav class="pagination"> -->
<%-- 					<c:if test="${1 < paramMap.pageNum }"> --%>
<!-- 						<a title="처음 페이지 보기" href="javascript:search('0')" class="control first" pagenum="1">first</a> -->
<%-- 						<a title="이전 페이지 보기" href="javascript:search('${paramMap.pageNum-2}')" class="control prev" pagenum="1">prev</a> --%>
<%-- 					</c:if> --%>
<%-- 					<c:forEach begin="${paramMap.pageNum-paramMap.pageNum%10}" end="${(paramMap.totalCnt == null ? 1 : paramMap.totalCnt/10) + (paramMap.totalCnt%10> 0 ? 1 : 0) -1}" varStatus="status"> --%>
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${paramMap.pageNum eq status.index+1}"> --%>
<%-- 								<strong class="active">${status.index+1}</strong> --%>
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<%-- 								<a title="${status.index+1}페이지보기" href="javascript:search('${status.index}')" pageNum="${status.index+1}">${status.index+1}</a> --%>
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
<%-- 					</c:forEach> --%>
<%-- 					<c:if test="${paramMap.totalCnt > 10*paramMap.pageNum }"> --%>
<%-- 						<a title="이후 페이지 보기" href="javascript:search('${paramMap.pageNum}')" class="control next" pagenum="11">next</a>  --%>
<%-- 						<a title="마지막 페이지 보기" href="javascript:search('${paramMap.totalCnt/10 + (paramMap.totalCnt%10> 0 ? 1 : 0) -1}')" class="control last" pagenum="586">last</a> --%>
<%-- 					</c:if> --%>
<!-- 				</nav> -->
				

				<div class="btn-group pt40">
					<a href="javascript:history.back();" class="button large listBtn" title="목록">목록</a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>