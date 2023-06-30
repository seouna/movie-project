<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet">
<body>
	<jsp:include page="../nav.jsp" />
	<div class="container has-lnb">
		<div class="inner-wrap">
			<jsp:include page="lnb-area.jsp" />

			<div id="contents">
				<h2 class="tit">자주 묻는 질문</h2>

				<div class="table-wrap">
					<div class="board-view">
						<div class="tit-area">
							<p class="tit">${map.faq_question }</p>
						</div>

						<div class="info">
							<p>
								<span class="tit">구분</span> <span class="txt">${map.faq_group }</span>
							</p>
							<p>
								<span class="tit">등록일</span> <span class="txt">${map.faq_write_date }</span>
							</p>
						</div>

						<div class="cont">
							<textarea rows="5" cols="30"
								class="input-textarea view" style="border: none;">${map.faq_answer }</textarea>
						</div>
					</div>
				</div>

<!-- 				<div class="prev-next"> -->
<!-- 					<div class="line prev"> -->
<!-- 						<p class="tit">이전</p> -->
<!-- 						<p class="link">이전글이 없습니다.</p> -->
<!-- 					</div> -->
<!-- 					<div class="line next"> -->
<!-- 						<p class="tit">다음</p> -->
<!-- 						<a href="#" class="link moveBtn" data-no="10826" -->
<!-- 							title="[L.POINT] 서버 작업 안내(4/9)">[L.POINT] 서버 작업 안내(4/9)</a> -->
<!-- 					</div> -->
<!-- 				</div> -->

				<div class="btn-group pt40">
					<a href="javascript:history.back();" class="button large listBtn" title="목록">목록</a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>