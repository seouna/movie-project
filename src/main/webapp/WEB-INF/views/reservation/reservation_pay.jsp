<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script type="text/javascript" src="resources/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.number.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.cookie.min.js"></script>
	<script type="text/javascript" src="resources/js/scrollbar.js"></script>
	<script type="text/javascript" src="resources/js/swiper.min.js"></script>
	<script type="text/javascript" src="resources/js/front.js?v=1680673895731"></script>
	<script type="text/javascript" src="resources/js/app.js?v=1680673895731"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/rsv/rsv.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/rsv/rsv2.css">
	<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/sub.css" rel="stylesheet">
<meta charset="UTF-8">
<title>좌석 선택</title>
<link rel="shortcut icon" href="resources/images/rsv/res_test.png" type="image/x-icon" />


<style type="text/css">
		#pointNumber {
		  position: relative;
		}
		
		#pointNumber {
		  height: 20px;
		  width: 280px;
		  border: 1px solid #c0c0c0;
		  border-radius: 4px;
		  box-sizing: border-box;
		  padding: 16px;
		}
		
		.order_point_type {
		    font-family: 'Noto Sans KR', sans-serif;
		    font-weight: bold;
		}
		
		
</style>

</head>

<body>
	<jsp:include page="../nav.jsp"></jsp:include>	

<div class="content">
			<div class="inner2">
	<form id="dataForm" method="post" action="reservationSuccess">
				<input type="hidden" id="CinemaCd" name="CinemaCd" value="${param.CinemaCd }">
				<input type="hidden" id="MovieCd" name="MovieCd" value="${param.MovieCd }">
				<input type="hidden" id="ScreenTime" name="ScreenTime" value="${param.ScreenTime }">
				<input type="hidden" id="ScreenCd" name="ScreenCd" value="${param.ScreenCd }">
				<input type="hidden" id="MovieNm" name="MovieNm" value="${param.MovieNm }">
				<input type="hidden" id="CinemaNm" name="CinemaNm" value="${param.CinemaNm }">
				<input type="hidden" id="HidMovieUrl" name="HidMovieUrl" value="${param.HidMovieUrl }">
				<input type="hidden" id="HidRating" name="HidRating" value="${param.HidRating }">
				<input type="hidden" id="schCd" name="schCd" value="${param.schCd }">
				<input type="hidden" id="genre" name="genre" value="${param.genre }">
				<input type="hidden" id="ScreenNm" name="ScreenNm" value="${param.ScreenNm }">
				<input type="hidden" id="MovieDate" name="MovieDate" value="${param.MovieDate }">
	
	
				<input type="hidden" id="totalAmt" name="totalAmt" value="${vo.getTotalAmt() }">
				<input type="hidden" id="totalCnt" name="totalCnt" value="${param.totalCnt }">
				<input type="hidden" id="NormalCnt" name="NormalCnt" value="${param.NormalCnt }">
				<input type="hidden" id="OldCnt" name="OldCnt" value="${param.OldCnt }">
				<input type="hidden" id="YoungCnt" name="YoungCnt" value="${param.YoungCnt }">
	
				<input type="hidden" id="TicketAmt" name="TicketAmt" value="${param.TicketAmt }">
				<input type="hidden" id="NormalPrice" name="NormalPrice" value="${param.NormalPrice }">
				<input type="hidden" id="OldPrice" name="OldPrice" value="${param.OldPrice }">
				<input type="hidden" id="YoungPrice" name="YoungPrice" value="${param.YoungPrice }">
				
				
				<input type="hidden" id="SeatNm" name="SeatNm" value="${vo.getSeatNm() }">
				<input type="hidden" id="SeatLine" name="SeatLine" value="${vo.getSeatLine() }">
				<input type="hidden" id="SeatNum" name="SeatNum" value="${vo.getSeatNum() }">
				
				<input type="hidden" id="PaymentCd" name="PaymentCd" value="html5_inicis.INIBillTst">
				
				<input type="hidden" id="Discount" name="Discount" value="${param.Discount }">
				<input type="hidden" id="Point" name="Point" value="">
	
				<div class="reservation-pc page-type">
					<div class="in-wrap">
						<div class="in-box">
							<div class="in w1200">

								<div class="head">
									<h4 class="r-h4">영화예매</h4>
									<div class="right">
										<a href="reservation" class="btn-refresh">예매다시하기</a>
									</div>
								</div>
								<!-- // head -->

								<div class="body">
									<!-- 예매정보 -->
									<div class="pay-box1">
										<div class="head-pay">
											<h3>예매정보</h3>
										</div>
										<div class="cont">
											<div class="pay-mv">
												<div class="img"><img src="${vo.getHidMovieUrl() }"></div>
												<h4>${vo.getMovieNm() }</h4>
												<dl>
													<dt>장르</dt>
													<dd>${vo.getGenre() }</dd>
												</dl>
												<dl>
													<dt>극장</dt>
													<dd>${vo.getCinemaNm() }</dd>
												</dl>
												<dl>
													<dt>날짜</dt>
													<dd>${vo.getMovieDate() }</dd>
												</dl>
												<dl>
													<dt>인원</dt>
													<dd>${vo.getTotalCnt() }명</dd>
												</dl>
												<dl>
													<dt>상영관</dt>
													<dd>${vo.getScreenNm() }</dd>
												</dl>
												<dl>
													<dt>시간</dt>
													<dd>${vo.getScreenTime() }</dd>
												</dl>
												<dl>
													<dt>좌석</dt>
													<dd>${vo.getSeatNm() }</dd>
												</dl>
											</div>
										</div>
									</div>
									<!-- // 예매정보 -->
									
									<!-- 할인적용 -->
									<div class="pay-box2">
										
											
										<div class="head-pay">
												<h3>결제수단 선택</h3>
											</div>
											<div class="cont">
												<div class="pay-kinds">
													<ul>
														<li><button type="button" name="payChoice" class="btn-payks active" data-cd="card" data-msg="" value="html5_inicis.INIBillTst"><img src="https://img.dtryx.com/payment/2022/01/cardkeyin.small.png" >신용/체크카드</button></li>
														<li><button type="button" name="payChoice" class="btn-payks" data-cd="kakaopay" data-msg="" value="kakaopay.TC0ONETIME"><img src="https://img.dtryx.com/payment/2022/01/kakaopay.small.png">카카오페이</button></li>
														<li><button type="button" name="payChoice" class="btn-payks" data-cd="toss" data-msg="" value="tosspay.tosstest"><img src="resources/images/rsv/toss.jpg">토스페이</button></li>
													</ul>
												</div>
												
												<div><br></div>
												<div><br></div>
												<!-- 포인트 -->
												<div class="order_point_type" align="right">
													<dl class="box_point_switch">
															<div class="point_type input_type" >
																<dt>
																	<span class="imoviePoint" style="color: purple;">IMOVIE POINT</span>
																</dt>
																<dd>
																	<div class="input_wrap">
																		<p class="input_payment">
																			<input type="text" class="number" id="pointNumber" name="pointNumber" style="text-align:right">
																			<span class="unit">포인트</span>
																		</p>
<!-- 																		<p class="input_payment"> -->
<!-- 																			<button type="button" class="btn_payment" id="pointAll">전액사용</button> -->
<!-- 																		</p> -->
																		<p class="info">사용가능 <span id="" class="number" style="color: purple;">${selectPoint }</span><span>P</span></p>
<!-- 																		<p class="input_payment"> -->
<!-- 																			<label class="c_order_checkbox"> -->
<!-- 																				<input type="checkbox" id="savePoint" name="all_pay" style="display: none"><span>항상 전액사용</span> -->
<!-- 																			</label> -->
<!-- 																		</p> -->
																	</div>
																</dd>
															</div>
														</dl>
												</div>
												
												<div><br></div>
												<div><br></div>
												<div><br></div>
												
												
												<div class="desc1">
													<ul>
<!-- 														<li>디트릭스 영화예매의 신용카드 결제서비스는 ㈜케이에스넷에서 제공합니다.</li> -->
														<li>카카오페이 이용시 안내 사항
															<ol>
																<li>주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다.</li>
																<li>결제 가능한 신용카드:신한,삼성,현대, BC,국민,하나,롯데,NH농협,씨티,카카오뱅크</li>
																<li>결제 가능한은행<br>KB국민,IBK기업,NH농협,신한,씨티,SC제일,우리,카카오뱅크,케이뱅크,토스뱅크,하나,경남,광주,대구,부산,KDB산업,수협,우체국,전북,제주,새마을금고,신협,SBI저축,저축,미래에셋,삼성,신한금융투자,SK,유안타,유진투자,한국투자</li>
															</ol>
														</li>
													</ul>
													<br>
													<strong class="black f14">이용/취소/환불규정</strong><br>
													<strong>온라인 영화 예매 후 취소가능시간 내에 취소하시면 전액 환불됩니다.</strong><br>
		
													1. 신용카드 : 결제일과 취소일이 다를 경우 영업일 기준 3~5일 소요됩니다.<br>
													2. 카카오페이 : 카카오페이머니를 사용하신 경우 카카오페이머니 잔액으로 원복 됩니다. <br>
													카드결제를 한 경우 카드사 정책에 따라 승인취소가 진행되며, 3일 이후 매입 취소 시 영업일 기준 3~10일 소요됩니다.<br>
													3. 토스페이 : 포인트를 사용하신 경우 포인트로 재적립 됩니다. <br>
													카드결제를 한 경우 카드사 정책에 따라 승인취소가 진행되며, 3일 이후 매입 취소 시 영업일 기준 3~10일 소요됩니다.<br><br>
													
													<span class="red2">※ 예매내용을 변경할 때는, 취소가능시간 내에 취소하고 다시 예매해 주시기 바랍니다.<br>
													※ 예매내역은 12개월 이내 예매하신 내역만 제공됩니다.</span>
												</div>
											</div>
										</div>
									<!-- // 할인적용 -->
									
									<!-- 최종결제 -->
									<div class="pay-box3">
										<div class="head-pay">
											<h3>최종결제</h3>
										</div>
									<div class="cont">
											<dl class="price2">
															<dt>성인 (10,000원 x ${param.NormalCnt }명)</dt>
															<dd>${param.NormalPrice }원</dd>
														</dl>
													<dl class="price2">
															<dt>경로(만65세이상) (5,000원 x ${param.OldCnt }명)</dt>
															<dd>${param.OldPrice }원</dd>
														</dl>
													<dl class="price2">
															<dt>청소년 (7,000원 x ${param.YoungCnt }명)</dt>
															<dd>${param.YoungPrice }원</dd>
														</dl>
													<div class="discounts" style="display:block;">
													<hr class="hr3">
													<dl class="price1" style="display:none;">
														<dt>할인금액 (땡처리 특가)</dt>
														<dd class="red discountAmt">-0원</dd>
													</dl>
<!-- 													<dl class="price2 moviediscountcoupon" style="display: none;"> -->
<!-- 															<dt>할인쿠폰</dt> -->
<!-- 															<dd class="red">-0원</dd> -->
<!-- 														</dl> -->
<!-- 													</div> -->
													<dl class="price2" style="display: block;">
															<dt>포인트사용</dt>
															<dd class="red point">-0원</dd>
														</dl>
													</div>
											<hr class="hr3">
											
											<dl class="price3">
												<dt>총 결제금액</dt>
												<dd class="totalAmt">${param.totalAmt }원</dd>
											</dl>
											<div class="btn-box">
												<button type="button" class="prev btn-prev">이전</button>
												<button type="button" class="next btnPayment">결제</button>
											</div>
										</div>
									</div>
									<!-- // 최종결제 -->
								</div>
								<!-- // body -->
							</div>
						</div>
					</div>
				</div>
			</form>
			
			<div class="bg-layer" style="display: none;"></div>
			<div class="reservation-pc" id="modalDiscount" style="display: none;"></div>
	</div>
		</div>
			
			<div class="bg-layer" style="display: none;"></div>
			<div class="reservation-pc" id="modalDiscount" style="display: none;"></div>
	<form id="payForm" name="payForm" method="post" target="popup_pay"></form>
	
	<div class="fav-wrap" style="display: none">
	</div>

	<script type="text/javascript">
	
	var IMP = window.IMP; 
	IMP.init("imp61826822"); 
	
	function requestPay() {
		console.log($('#PaymentCd').val());
		IMP.request_pay({
	        pg : $('#PaymentCd').val(),
	        pay_method : 'card',
	        merchant_uid: "res" + new Date().getTime(), 
	        name : '영화 결제',
	        amount : $("#totalAmt").val(),
	        buyer_email : '${member.get('member_email')}',
	        buyer_name : '${member.get('member_name')}',
	        buyer_tel : '${member.get('member_tel')}',
	        
	    }, function (rsp) { // callback
	        if (rsp.success) {
			    alert("결제가 완료되었습니다.");
			    
				$("#dataForm").append('<input type="hidden" id="resCode" name="resCode" value="' + rsp.merchant_uid + '">');
				$("#dataForm").append('<input type="hidden" id="resPayment" name="resPayment" value="' + rsp.pay_method + '">');
				$("#dataForm").append('<input type="hidden" id="resPay" name="resPay" value="' + rsp.paid_amount + '">');
				$("#dataForm").append('<input type="hidden" id="resPayDone" name="resPayDone" value="' + rsp.status + '">');
				$("#dataForm").append('<input type="hidden" id="buyerEmail" name="buyerEmail" value="' + rsp.buyer_email + '">');
				$("#dataForm").append('<input type="hidden" id="buyerName" name="buyerName" value="' + rsp.buyer_name + '">');
				$("#dataForm").append('<input type="hidden" id="buyerTel" name="buyerTel" value="' + rsp.buyer_tel + '">');
				$("#dataForm").submit();
				
	        } else {
	            alert("실패 : 코드" + rsp.error_code + ") / 메세지()"
	            	  + rsp.error_msg + ")");
	        }
	    });
	    
	}
	
	
	$(function () {
		var discount = $("#Discount").val();
		
		// 상영 시간까지 남은 시간이 1시간 이내인 영화면 할인
		if (discount != "") {
			var oriAmt = ${vo.getTotalAmt() };
			var discountTotalAmt = oriAmt * discount;
			var totalAmt = oriAmt - discountTotalAmt;
			$("#totalAmt").val(totalAmt);
			$(".price1").css("display", "block");
			$(".discountAmt").empty();
			$(".discountAmt").append("-" + discountTotalAmt + "원");
			
			$(".totalAmt").empty();
			$(".totalAmt").append(totalAmt + "원");
			
		}
		
		
		// 포인트
		$("#pointNumber").on("change", function(e) {
			var point = $(this).val();
			$("#Point").val($(this).val());
			var oriAmt = $("#totalAmt").val();
			var totalAmt = oriAmt - point;
			
			if (point > ${selectPoint}) {
				alert("사용가능 포인트를 확인하세요!");
				$(this).val("");
				return;
			}
			
			
			$("#totalAmt").val(totalAmt);
			$(".point").empty();
			$(".point").append("-" + point + "원");
			
			$(".totalAmt").empty();
			$(".totalAmt").append(totalAmt + "원");
			
		});
		
		
		
		$(".btn-prev").on("click", function(e) {
			e.preventDefault();
			$("#TicketCd").val($("#TicketCd").data("org"));
			$("#TicketAmt").val($("#TicketAmt").data("org"));
			$("#PayInfoNat").val($("#PayInfoNat").data("org"));
			
			$("#dataForm").attr("action", "seat");
			$("#dataForm").submit();
		});
		
		// 결제수단
		$(".btn-payks").on("click", function(e) {
			if ($(this).data("msg") != "") {
				Alert($(this).data("msg"));
			}
			
			$(".btn-payks").removeClass("active");
			$(this).addClass("active");
			$("#PaymentCd").val($(this).val());
		});
		
		// 결제하기
		$(".btnPayment").on("click", function() {
			// 결제하기 전 좌석 정보 다시 확인 후 선택한 좌석이 예약좌석이면 알림
			requestPay();
			// 10분후 타임아웃
			var timeOut = setTimeout(function() {
				alert("결제 시간이 만료되어 영화 예매페이지로 돌아갑니다.");
				location.href="reservation";
			}, 600000);

	});
});
	
</script>

<jsp:include page="../footer.jsp"></jsp:include>	
</body>
</html>
