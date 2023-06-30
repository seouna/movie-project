<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>아이무비</title>
</head>
<link href="${pageContext.request.contextPath }/resources/css/sub.css" rel="stylesheet">
<body>
	<div class="lnb-area addchat">
		<nav id="lnb" class="ty2">
			<p class="tit"><a href="cc_home" title="고객센터">고객센터</a></p>
			<ul>
				<li><a href="cc_home" title="고객센터 홈">고객센터 홈</a></li>
				<li><a href="faq" title="자주 묻는 질문">자주 묻는 질문</a></li>
				<li><a href="notice_board" title="공지사항">공지사항</a></li>
				<li><a href="lost_board" title="분실물 문의">분실물 문의</a></li>
				<li><a href="oneOnOne" title="1:1문의">1:1문의</a></li>
<!-- 				<li><a href="" title="단체관람 및 대관문의">단체관람 및 대관문의</a></li> -->
				<li><a href="guest_confirm" title="문의내역">문의내역</a></li>
<!-- 				<li><a href="" title="이용약관">이용약관</a></li> -->
<!-- 				<li><a href="" title="위치기반서비스이용약관">위치기반서비스이용약관</a></li> -->
<!-- 				<li><a href="" title="개인정보처리방침">개인정보처리방침</a></li> -->
<!-- 				<li><a href="" style="border-radius: 0 0 10px 10px;" title="스크린배정수에관한기준">스크린배정수에관한기준</a></li> -->
			</ul>

			<!-- 고객센터 메뉴일때만 출력 -->
			<div class="left-customer-info">
				<p class="tit">
					IMOVIE 고객센터
					<span>Dream center</span>
				</p>
				<p class="time"><i class="iconset ico-clock"></i> 09:00~18:00</p>
			</div>
		</nav>
	</div>
</body>
</html>