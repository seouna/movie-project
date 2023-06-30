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
		if(result) {
			location.href="lost_deletePro?lost_code=" + ${map.lost_code };
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

			<div id="contents" class="">
				<h2 class="tit">분실물 문의</h2>

<!-- 				<ul class="dot-list mb30"> -->
<!-- 					<li>IMOVIE에서 잃어버린 물건이 있다면 ‘분실물 문의/접수’를 통해 접수해주세요.</li> -->
<!-- 					<li>접수하신 글은 비밀글로 등록되어 작성자와 관리자만 확인 가능합니다.</li> -->
<!-- 				</ul> -->

				<div class="table-wrap">
					<div class="board-view">
						<div class="tit-area">
							<p class="tit">${map.lost_subject }</p>
						</div>

						<div class="info">
							<p>
								<span class="txt">문의유형 : ${map.lost_question_type }</span>
							</p>
							<p>
								<strong class="txt">극장명 : ${map.cinema_name }</strong>
							</p>
							<p>
								<span class="txt">작성일 : ${map.lost_write_date }</span>
							</p>
							<p>


								<span class="txt">답변상태 : ${map.lost_board_rep }</span>

							</p>
						</div>

						<div class="cont">
							<textarea rows="5" cols="30" readonly=""
								class="input-textarea view" style="border: none;">${map.lost_content }</textarea>
						</div>
						<!-- 답변영역 -->
						<c:if test="${not empty map.lost_board_rep_content }">
							<div class="cont">
								<div>
									<label for="lost_board_rep_content">답변내용</label>
								</div>
							<textarea rows="5" cols="30" readonly=""
								class="input-textarea view" style="border: none;">${map.lost_board_rep_content }</textarea>
							</div>
						</c:if>

					</div>
				</div>

				<div class="btn-group pt40">
					<a href="lost_board" id="listBtn" class="button large" title="목록">목록</a>
					<a class="button large deleteBtn inq-delete" title="삭제" onclick="deleteLost()">삭제</a>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>