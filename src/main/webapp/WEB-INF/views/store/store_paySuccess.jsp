<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/common.css" rel="stylesheet">
<link href="resources/css/inc.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>
<script type="text/javascript">
function NotReload(){
    if( (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116) ) {
        event.keyCode = 0;
        event.cancelBubble = true;
        event.returnValue = false;
       	alert("이미 결제가 완료되었습니다.");
    } 
}
document.onkeydown = NotReload;
</script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div id="container">
		<div id="content">
			<div class="section group section-member">

				<div class="title">결제</div>

				<div class="wrap-member-box wrap-join-box" id="join_confirm_section">
					<ul class="join-indicator">
						<li>로그인</li>
						<li>스토어</li>
						<li class="selected">결제 완료</li>
					</ul>
					<div class="member join-success">
						<div class="end">
							<div class="t1">
								<strong></strong>${member.get('member_id') } 님<br>결제 완료되었습니다.
							</div>
							<div class="t2">
								포인트 ${pay.get('point') }점 적립완료!<br>
								아이무비 스토어를 이용해주셔서 감사합니다.<br><br>
								(결제 상품은 마이페이지에서 확인 가능합니다.)
							</div>
							<div class="btns">
								<a href="main" class="btn-type-main">메인화면</a>
								<a href="store_main" class="btn-type-main">스토어</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
</body>
</html>