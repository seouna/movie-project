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
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="member guest-login">
		<div class="list-tabs">
			<a href="memLogin">회원 로그인</a>
			<a href="" class="active">비회원 예매 및 확인</a>
		</div>
<!-- 		탭 -->
		<div class="tabs2">
			<a href="guestJoin" class="active">예매</a>
			<a href="guestRsv" >예매확인</a>

		</div>
		<div class="tabs-cont">
			<div class="cont">
				<form id="joinForm" name="joinForm" method="post" autocomplete="off" action="guestJoinPro">
					<input type="hidden" id="cgid" name="cgid" value="">
		<!-- 					이름 생년월일 휴대폰번호 인증요청 -->

					<div class="guest-join-detail">
								<label class="label-input" for="memberName"> <span>이름</span>
									<input type="text" id="memberName" name="guestName" class="input" value="" placeholder="실명을 입력해주세요">
									 <span></span>
								</label>
							</div>
<!-- 					<div class="guest-join-detail"> -->
<!-- 								<label class="label-input" for="memberBirth"> <span>생년월일</span> -->
<!-- 									<input type="text" id="memberBirth" name="guestBday" -->
<!-- 									class="input input-numeric" placeholder="예) 20170101" maxlength="8"> -->
<!-- 									<span></span> -->
<!-- 								</label> -->
<!-- 							</div> -->
					<div class="guest-join-detail">
						<label class="label-input" for="memberPhone"> <span>휴대폰번호</span>
							<input type="text" id="memberPhone" name="phone"
							class="input input-numeric" placeholder="휴대폰번호 입력"> <span></span>
						</label>
					</div>
					<div class="guest-join-detail">
						<label class="label-input" for="pass"> <span>비밀번호</span>
							<input type="password" id="join-pass" name="pass"
							class="input" placeholder="비밀번호 입력"> <span></span>
						</label>
					</div>
					<div class="guest-join-detail">
						<label class="label-input" for="pass2"> 
						<span>비밀번호 확인</span> 
						<input type="password" id="join-pw2" name="password2" class="input" placeholder="위에 입력한 비밀번호를 다시 입력해주세요">
						<span></span>
						</label>
					</div>
					<div class="guest-join-detail">
						<label class="label-input" for="memberEmail"> <span>E-mail</span>
							<input type="text" id="memberEmail" name="email"
							class="input" placeholder="이메일 입력"> <span></span>
						</label>
					</div>
					
					<div class="privacy">
						<div class="t1">[개인정보 수집 및 이용동의]</div>
						<div class="t2">수집 목적: 영화 예매서비스 제공<br>수집 항목: 이름, 생년월일, 휴대폰번호 <br>비밀번호 보유 및 이용기간: 예매 후 6개월</div>
					</div>
					<div class="chks mb30">
						<label style="margin-right:25px"><input type="radio" id="chk" name="chk" class="radio" checked=""><em></em><span>동의</span></label>
						<label><input type="radio" name="chk" class="radio"><em></em><span>동의안함</span></label>
					</div>
					<div class="check-desc">정보수집에 동의를 거부할 수 있으며, 동의하지 않을 경우 <br>비회원 예매서비스를 이용하실 수 없습니다.</div>
					
					<button type="submit" class="btn-type0 mb50">비회원 예매</button>
				</form>
			</div>
		</div>
	
	
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>