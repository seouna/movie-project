<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>아이무비</title>
<script type="text/javascript">
	function deleteOne() {
		let result = confirm("삭제 하시겠습니까?");
		if (result) {
			location.href = "one_deletePro?code=" + ${map.code} + "&table_name=" + "${map.table_name}" + "&codeChk="+"${map.table_name=='one_board'?'one_code':'lost_code'}"
					+"&memberName=${paramMap.memberName}"+"&memberTel=${paramMap.memberTel}"+"&memberEmail=${paramMap.memberEmail}";
			{
				map.one_code
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
				<h2 class="tit">내가 문의한 내용</h2>
				<div class="table-wrap">
					<div class="board-view">
						<div class="tit-area">
							<p class="tit">${map.subject }</p>
						</div>
						<div class="info">
							<p>
								<span class="tit">영화관</span> <span class="txt">${map.cinema_name }</span>
							</p>
							<p>
								<span class="tit">구분</span> <span class="txt">${map.question_type }</span>
							</p>
							<p>
								<span class="tit">등록일</span> <span class="txt">${map.write_date }</span>
							</p>
						</div>

						<div class="cont">
							<textarea rows="5" cols="30" readonly=""
								class="input-textarea view" style="border: none;">${map.content }</textarea>
						</div>
						<!-- 답변영역 -->
						<c:if test="${not empty map.rep_content}">
							<div class="cont">
								<div>
									<label for="rep_content">답변내용</label>
								</div>
							<textarea rows="5" cols="30" readonly=""
								class="input-textarea view" style="border: none;">${map.rep_content }</textarea>
							</div>
						</c:if>
					</div>
				</div>
				<div class="btn-group pt40">
				<form action ="one_list">
					<input type="hidden" name="memberName" value="${paramMap.memberName}">
					<input type="hidden" name="memberTel" value="${paramMap.memberTel}">
					<input type="hidden" name="memberEmail" value="${paramMap.memberEmail}">
					<button type ="submit" class="button large listBtn" title="목록">목록</button>
					<a class="button large deleteBtn inq-delete" title="삭제" onclick="deleteOne()">삭제</a>
				</form>
<%-- 					<a href="one_list?memberName=${paramMap.memberName}&memberTel=${paramMap.memberTel}&memberEmail=${paramMap.memberEmail}" class="button large listBtn" title="목록">목록</a> --%>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>