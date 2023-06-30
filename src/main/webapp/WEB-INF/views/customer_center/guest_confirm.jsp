<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- 상단 -->
<link href="${pageContext.request.contextPath }/resources/css/sub.css"
	rel="stylesheet">
<!-- 본문 -->
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/main.css"
	rel="stylesheet">
<script type="text/javascript">
function bntCheck(){
	let nonMbNm = document.querySelector("#nonMbNm");
	let nonMbTelno = document.querySelector("#nonMbTelno");
	let nonMbEmail = document.querySelector("#nonMbEmail");
	let regex2 = /^[0-9]{10,11}$/; // 휴대폰 제약조건
	
	if(nonMbNm.value.length == 0){
		alert('이름을 입력해주세요');
		nonMbNm.focus();
		return ;
	}else if(nonMbEmail.value.length == 0){
		alert('이메일을 입력해주세요');
		nonMbEmail.focus();
		return ;
	}
	if("${sessionScope.sId}" == null || "${sessionScope.sId}" == ""){	//   세션이 없는 상태
		// 번호 검증
		if(!regex2.exec($("#nonMbTelno").val())) {
			alert("전화번호를 확인하세요");
			$("#nonMbTelno").focus();
			return false;
		}
 	}
	let form = document.querySelector('#iForm');
	form.action = 'one_list';
	form.method = 'post';
	form.submit();

}
</script>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="container has-lnb">

		<div class="inner-wrap">
			<jsp:include page="lnb-area.jsp" />
			<div id="contents">
			<form id="iForm">
				<h2 class="tit">문의내역 확인</h2>
				<div class="table-wrap mt10">
					<table class="board-form va-m">
						<caption>
							아이디이름, 휴대폰 번호, 인증번호 항목을 가진 비밀번호 찾기 입력 표
							<!--아이디이름, 휴대폰 번호, 인증번호 항목을 가진 비밀번호 찾기 입력 표-->
						</caption>
						<colgroup>
							<col style="width: 150px;">
							<col>
						</colgroup>
						<tbody>
							<input id="ibxSchPwdLoginId" type="hidden" value="">
							<!--이름-->
							<input id="ibxSchPwdMbNm" type="hidden" value="">
							<!--휴대폰 번호-->
							<tr>
								<th scope="row"><label for="nonMbNm">이름</label><em
									class="font-orange">*</em></th>
								<td><input type="text" maxlength="20"
									class="input-text w150px"  value="${member.get('member_name')}" 
									name="memberName" id="nonMbNm" title="이름"
									${not empty member.get('member_name') ? 'readonly="readonly"' : ''}></td>
							</tr>
							<tr>
								<th scope="row"><label for="nonMbTelno">휴대폰 번호<!--휴대폰 번호--></label><em
									class="font-orange">*</em></th>
								<td><input type="text" id="nonMbTelno" name="memberTel"
									maxlength="11" class="input-text w200px numType userData"
									value="${member.get('member_tel')}" 
									title="핸드폰번호 입력" placeholder="숫자만 입력해 주세요"
									${not empty member.get('member_tel') ? 'readonly="readonly"' : ''}>
									<div id="nonMbTelnoAlert" class="fc_r mt05 display-none">휴대폰
										번호를 정확히 입력해주세요.</div></td>
							</tr>
							<tr>
								<th scope="row"><label for="nonMbEmail">이메일</label><em
									class="font-orange">*</em></th>
								<td><input type="email" maxlength="50"
									 class="input-text w260px" value="${member.get('member_email')}" 
									name="memberEmail" id="nonMbEmail" title="이메일"
									${not empty member.get('member_email') ? 'readonly="readonly"' : ''}>
									<div id="nonMbEmailAlert" class="fc_r mt05 display-none">이메일을
										정확히 입력해주세요.</div></td>
							</tr>
						</tbody>
					</table>
				</div>
				<p class="reset mt10">* 비회원 정보 오 입력 시 문의내역 확인이 어려울 수 있으니 다시 한번
					확인해 주시기 바랍니다.</p>

				<div class="btn-group pt40">
					<button type="button" class="button large purple"
						id="nonMbInqCnfmBtn" title="확인" onclick="bntCheck();">문의내역 확인</button>
				</div>
			</form>
			</div>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>