<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

function doDisplay(){
	let dis = document.querySelector(".modal-type2");
	
	if(dis.style.display="none"){
		dis.style.display="block"
		
		
	} else{
		dis.style.display="none";
	}
}

function modalClose(){
	 $('.modal-type2').hide();	
}



</script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="member guest-login">
		<div class="list-tabs">
			<a href="memLogin" class="">회원 로그인</a>
			<a href="" class="active">비회원 예매 및 확인</a>
		</div>
<!-- 		탭 -->
		<div class="tabs2">
			<a href="guestJoin">예매</a>
			<a href="guestRsv" class="active">예매확인</a>
		</div>
		<div class="tabs-cont">
			<div class="cont">
				<form id="joinForm" name="joinForm" method="post" autocomplete="off">
					<input type="hidden" id="cgid" name="cgid" value="">
		<!-- 					이름 생년월일 휴대폰번호 인증요청 -->

					<div class="guest-join-detail">
								<label class="label-input" for="guestBday"> <span>생년월일</span>
									<input type="text" id="guestBday" name="guestBday"
									class="input input-numeric" placeholder="예) 20170101" maxlength="8">
									<span></span>
								</label>
					</div>
					<div class="guest-join-detail">
						<label class="label-input" for="phone"> <span>휴대폰번호</span>
							<input type="text" id="join-phone" name="phone"
							class="input input-numeric" placeholder="휴대폰번호 입력"> <span></span>
						</label>
					</div>
					<div class="guest-join-detail">
						<label class="label-input" for="pass"> <span>비밀번호</span>
							<input type="password" id="join-pass" name="pass"
							class="input" placeholder="비밀번호 입력"> <span></span>
						</label>
					</div>
					<div class="text-right">
						<a href="javascript:doDisplay();" class="btn-txt btnFind">비밀번호 찾기</a>
					</div>
					<button type="submit" class="btn-type0 mb50">비회원 예약확인</button>
				</form>
			</div>
			
		</div>
		<!-- 비회원 비밀번호 찾기 모달창 -->
		<div class="modal modal-type2" id="findPwd" tabindex="-1" style="display: none;">
			<div class="modal-dialog" style="max-width: 400px; margin-top: 322.5px;">
				<div class="modal-content">
					<div class="modal-header">
						<h4>비회원 비밀번호 찾기</h4>
						<button type="button" class="close-modal"  onclick="modalClose()">닫기</button>
					</div>
					<div class="modal-body">
						<h3 class="h3-member">생년월일</h3>
						<div class="mb20"><input type="text" id="BirthDay" class="inp-member onlyNumber" placeholder="생년월일 8자리(19810101)" maxlength="8"></div>
						<h3 class="h3-member">이메일주소</h3>
						<div class="inp-box1 mb20">
							<input type="tel" id="guestEmail" class="inp-member onlyNumber" placeholder="이메일주소를 입력해주세요">
						</div>
					</div>
					<div class="modal-bottom flex">
						<button type="button" class="btn-modal1" onclick="modalClose()">취소</button>
						<button type="button" class="btn-modal2" id="btnFind">확인</button>
					</div>
				</div>
			</div>
		</div>
	
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>