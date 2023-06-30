<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/rsv/rsv3.css">
	<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc.css" rel="stylesheet">
<meta charset="UTF-8">
<title>좌석 선택</title>
<link rel="shortcut icon" href="resources/images/rsv/res_test.png" type="image/x-icon" />
</head>

<body>
<jsp:include page="../nav.jsp"></jsp:include>

	<div class="content">
			<div class="inner2">
	<form id="dataForm" method="post" action="reservationPay">
				
				<input type="hidden" id="CinemaCd" name="CinemaCd" value="${param.CinemaCd }">
				<input type="hidden" id="MovieCd" name="MovieCd" value="${param.MovieCd }">
				<input type="hidden" id="ScreenTime" name="ScreenTime" value="${param.ScreenTime }">
				<input type="hidden" id="ScreenCd" name="ScreenCd" value="${param.ScreenCd }">
				<input type="hidden" id="MovieNm" name="MovieNm" value="${param.MovieNm }">
				<input type="hidden" id="CinemaNm" name="CinemaNm" value="${param.CinemaNm }">
				<input type="hidden" id="HidMovieUrl" name="HidMovieUrl" value="${param.HidMovieUrl }">
				<input type="hidden" id="HidRating" name="HidRating" value="${param.HidRating }">
				<input type="hidden" id="schCd" name="schCd" value="${param.schCd }">
				<input type="hidden" id="showDate" name="showDate" value="${param.showDate }">
				<input type="hidden" id="genre" name="genre" value="${param.genre }">
				<input type="hidden" id="ScreenNm" name="ScreenNm" value="${param.ScreenNm }">
				<input type="hidden" id="MovieDate" name="MovieDate" value="${param.MovieDate }">
	
				<input type="hidden" id="totalAmt" name="totalAmt" value="0">
				<input type="hidden" id="totalCnt" name="totalCnt" value="0">
				<input type="hidden" id="NormalCnt" name="NormalCnt" value="0">
				<input type="hidden" id="OldCnt" name="OldCnt" value="0">
				<input type="hidden" id="YoungCnt" name="YoungCnt" value="0">
	
				<input type="hidden" id="TicketAmt" name="TicketAmt" value="10000">
				<input type="hidden" id="NormalPrice" name="NormalPrice" value="0">
				<input type="hidden" id="OldPrice" name="OldPrice" value="0">
				<input type="hidden" id="YoungPrice" name="YoungPrice" value="0">
				
				<input type="hidden" id="TicketCd" name="TicketCd" value="001260">
				<input type="hidden" id="TicketNm" name="TicketNm" value="성인">
				
				<input type="hidden" id="Discount" name="Discount" value="${param.Discount }">

<!-- 				<input type="hidden" id="TicketInfo" name="TicketInfo" value="성인 1명"> -->
				
<!-- 				<input type="hidden" id="SeatInfo" name="SeatInfo" value=""> -->
<!-- 				<input type="hidden" id="TicketList" name="TicketList" value=""> -->
<!-- 				<input type="hidden" id="SeatType" name="SeatType" value=""> -->
<!-- 				<input type="hidden" id="SeatZone" name="SeatZone" value=""> -->
<!-- 				<input type="hidden" id="SeatString" name="SeatString" value=""> -->
<!-- 				<input type="hidden" id="SelectedSeatList" name="SelectedSeatList" value=""> -->
				
<!-- 				<input type="hidden" id="TicketCategory" name="TicketCategory" value=""> -->
<!-- 				<input type="hidden" id="AddTicketAmt" name="AddTicketAmt" value=""> -->
<!-- 				<input type="hidden" id="TotalTicketAmt" name="TotalTicketAmt" value=""> -->
<!-- 				<input type="hidden" id="TicketPropertyNo" name="TicketPropertyNo" value=""> -->
				
<!-- 				<input type="hidden" id="PayInfoNat" name="PayInfoNat" value=""> -->
<!-- 				<input type="hidden" id="HoldGuID" name="HoldGuID" value=""> -->
								
				
				<div class="reservation-pc single page-type">
					<div class="in-wrap">
						<div class="in-box">
							<div class="in w1200">
	
								<div class="head">
									<h4 class="r-h4">영화예매</h4>
									<div class="right">
										<a href="javascript:location.reload(true);" class="btn-refresh">예매다시하기</a>
									</div>
								</div>
								<!-- // head -->

								<div class="body">
									<div class="r-choice">
										<dl>
											<dt>인원선택</dt>
										</dl>
										<div class="scroll-choice">
											<div class="scroll-wrapper scrollbar-inner"
												style="position: relative;">
												<div class="scrollbar-inner scroll-content"
													style="height: 480px; margin-bottom: 0px; margin-right: 0px; max-height: none;">
													<div id="priceList">
														<div class="t1">성인</div>
														<div class="list">
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001260" value="0" data-no="0" checked=""> <span>0</span></label>
															<label class=""> <input type="radio"class="c-radio rdoTicket" name="T001260" value="1" data-no="0"> <span>1</span></label>
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001260" value="2" data-no="0"> <span>2</span></label>
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001260" value="3" data-no="0"> <span>3</span></label>
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001260" value="4" data-no="0"> <span>4</span></label>
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001260" value="5" data-no="0"> <span>5</span></label>
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001260" value="6" data-no="0"> <span>6</span></label>
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001260" value="7" data-no="0"> <span>7</span></label>
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001260" value="8" data-no="0"> <span>8</span></label>
														</div>
														<div class="t1">경로(만65세이상)</div>
														<div class="list">
															<label class=""> 
															<input type="radio" class="c-radio rdoTicket" name="T001261" value="0" data-no="1" checked=""> <span>0</span></label>
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001261" value="1" data-no="1"> <span>1</span></label>
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001261" value="2" data-no="1"> <span>2</span></label>
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001261" value="3" data-no="1"> <span>3</span></label>
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001261" value="4" data-no="1"> <span>4</span></label>
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001261" value="5" data-no="1"> <span>5</span></label>
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001261" value="6" data-no="1"> <span>6</span></label>
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001261" value="7" data-no="1"> <span>7</span></label>
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001261" value="8" data-no="1"> <span>8</span></label>
														</div>
														<div class="t1">청소년</div>
														<div class="list">
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001262" value="0" data-no="2" checked=""> <span>0</span></label>
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001262" value="1" data-no="2"> <span>1</span></label>
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001262" value="2" data-no="2"> <span>2</span></label>
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001262" value="3" data-no="2"> <span>3</span></label>
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001262" value="4" data-no="2"> <span>4</span></label>
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001262" value="5" data-no="2"> <span>5</span></label>
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001262" value="6" data-no="2"> <span>6</span></label>
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001262" value="7" data-no="2"> <span>7</span></label>
															<label class=""> <input type="radio" class="c-radio rdoTicket" name="T001262" value="8" data-no="2"> <span>8</span></label>
														</div>
													</div>
												</div>
												<div class="scroll-element scroll-x">
													<div class="scroll-element_outer">
														<div class="scroll-element_size"></div>
														<div class="scroll-element_track"></div>
														<div class="scroll-bar" style="width: 100px;"></div>
													</div>
												</div>
												<div class="scroll-element scroll-y">
													<div class="scroll-element_outer">
														<div class="scroll-element_size"></div>
														<div class="scroll-element_track"></div>
														<div class="scroll-bar" style="height: 100px;"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="btn-area">
											<button type="button" class="btn-prev" onclick="history.back();">영화 선택</button>
										</div>
									</div>
									<div class="r-select">
										<div class="r-wrap">
											<div class="tit1">좌석선택</div>
											<div class="tit2">SCREEN</div>
											<div class="scroll-wrapper scrollbar-inner"
												style="position: relative;">
												<div class="scrollbar-inner scroll-content"
													style="height: auto; margin-bottom: 0px; margin-right: 0px; max-height: 270px;">
													<div class="r-box">
														<!-- // 좌석 start -->
														<div class="seatBox">
															<div id="ssSeat" class="seatWrap">
																<div class="seatSelectWrapper">
																	<div class="seatSelectContainer">
																		<div class="seatMap" id="seatMap"
																			style="width: 432px; height: 252px;">
																			<div class="child" style="top: 36px; left: 0px">A</div>
																			<div class="child" style="top: 72px; left: 0px">B</div>
																			<div class="child" style="top: 108px; left: 0px">C</div>
																			<div class="child" style="top: 144px; left: 0px">D</div>
																			<div class="child" style="top: 180px; left: 0px">E</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<!-- 좌석 end // -->
													</div>
												</div>
												<div class="scroll-element scroll-x">
													<div class="scroll-element_outer">
														<div class="scroll-element_size"></div>
														<div class="scroll-element_track"></div>
														<div class="scroll-bar" style="width: 100px;"></div>
													</div>
												</div>
												<div class="scroll-element scroll-y">
													<div class="scroll-element_outer">
														<div class="scroll-element_size"></div>
														<div class="scroll-element_track"></div>
														<div class="scroll-bar" style="height: 100px;"></div>
													</div>
												</div>
											</div>

											<div id="seatLegendList" class="labels">
												<span><em class="available" style="background: #C8C8C8; outline-color: #"></em>일반석</span>
												<span><em class="nowselecting" style="background: #C40900; outline-color: #"></em>현재선택</span>
												<span><em class="soldout" style="background: #3D3F51; outline-color: #"></em>판매완료</span>
											</div>
										</div>
										<div class="choice-list">
											<strong>선택 좌석</strong>
											<ul id="choiceList">
											</ul>
										</div>
										<div class="bottom">
											<strong class="totalAmt">총 0원</strong>
											<button type="button" class="btn-pay btnNext">결제하기</button>
										</div>

										<div class="before" style="display: none;">
											<p>관람하실 인원을 선택해 주세요.</p>
										</div>
									</div>
								</div>
								<!-- // body -->
							</div>
						</div>
					</div>
				</div>
			</form>
	</div>
		</div>
<script type="text/javascript">
	let seatLine = 6;		// 1~5
	let seatNum = 10;   	// 1~9
	let num = 0;			// data-id 0부터 count++
	let seatSum = 45;		// 총 좌석수
	let left = 36;			// 좌석 x축
	let y = 36; 			// 좌석 y축
	let asc = 65;			// 아스키코드 65 == 'A'
	let schCd = $("#schCd").val();
	
	var totalAmt = 0;		// 최종 금액
	var nAmt = 0;			// 성인 요금
	var oAmt = 0;			// 경로 요금
	var yAmt = 0;			// 청소년 요금
	var nCount = 0;
	var oCount = 0;
	var yCount = 0;
	var totalCount = 0;		// 총 인원 수
	var btnCnt = 0;
	
	var seatNmList = new Array();
	var seatLineList = new Array();
	var seatNumList = new Array();
	
// reservationList에서 res_seat_line, res_seat_num 값 select 후
// 데이터 존재시 버튼 컬러 변경 , 클릭 비활성화
	function reservationList() {
		$.ajax({
				type: "GET",
				url: "reservationList",
				data: { 
					schCd : schCd
				},
				dataType: "json",
				success: function(response) { 
					var obj = {};
					
					response.forEach(function(el, index){
						var lines = el.res_seat_line.split(',');
						var seats = el.res_seat_num.split(',');
						lines.forEach((el, index) => {
							// 라인에 좌석 정보 없으면 빈 값 저장 
							if(!obj[el]) obj[el] = [];
							seats[index].split(',').forEach((seat) => {
								obj[el].push(seat);
							});
							obj[el].sort();
						});
					});
	
					// 클래스가 seat인 모든 배열 순회하면서 DB값과 일치하는 값 조회
					var seatList = $('.seat');
	 				$.each(seatList, function(index, el){
	 					var line = $(el).attr('data-line');
	 					var seatNum = $(el).attr('data-num');
	 					
	 					// 예약된 자리면
	 					if(obj[line]){
	 						if(obj[line].includes(seatNum)){ 
	 	 						$(el).attr("class", "seat soldout");
	 	 						$(el).attr("disabled", "true");
	 	 						$(el).css({"background-color" : "#3D3F51"});		
	 	 					}
	 					}
	 				});
				},
				error: function(xhr, textStatus, errorThrown) {
					console.log("reservationList : 요청처리실패");
			}
		});
	}
	
	$(function() {
		
		// 좌석 생성
		for(let i = 1; i < seatLine; i++) {
			y = 36;
			y *= i;
			$("#seatMap").append('<div id="seat' + i + '"></div>');
			
			for(let j = 1; j < seatNum; j++) {
				let alp = String.fromCharCode(asc);								// 좌석 행 출력  
				
				var str = "";
				str += "<button type='button' data-id='";
				str += num;
				str += "' data-line='";
				str += i;
				str += "' data-num='";
				str += j;
				str += "' class='seat available' style='top:";
				str += y;
				str += "px; left:";
				str += j * left;
				str += "px; background-color: #C8C8C8'"
				str += " data-nm='";
				str += alp + j;
				str += "'>";
				str += alp + j;
				str += "</button>";
				
				$("#seat" + i).append(str);
				
			} //j
			left = 36;
			asc++;
			
		}
		
		// 판매완료 좌석
		reservationList();
		
		// 좌석 선택 시 선택 좌석에 표시
		$(".seat").on("click", function(e) {
			if($(this).val() != "") { 					// 기존 선택된 좌석 취소
				$(this).val("");
				btnCnt--;								// 선택하면 선택좌석 minus
				$(this).css({"background-color" : "#C8C8C8"});
				$(this).removeClass("sel");
				
				var removeData = $(this).data("nm");
				var removeDataLine = $(this).data("line");
				var removeDataNum = $(this).data("num");
				
				// 선택좌석 - 선택취소한 좌석 원래대로 돌려놓기
				$.each($('.choice'), function(index, el){
					if($(el).attr('data-nm') == removeData) {
						$(el).remove();
					}
				});
				
				// 선택 취소한 좌석 hidden 값에 추가 한거 지우기
				$('#seatNm' + $(this).data("nm")).remove();
				$('#seatLine' + $(this).data("line")).remove();
				$('#seatNum' + $(this).data("num")).remove();
				
			} else { 									// 빈 좌석 선택하기
				$(this).val($(this).data("nm"));
				
				btnCnt++; 								// 선택했을 때 선택좌석 plus
				var totalCnt = $("#totalCnt").val();
				
				if(btnCnt <= totalCnt) {
					var str = "";
					str += "<li class='choice' data-nm=";
					str += $(this).data("nm");
					str += ">";
					str += "<button type='button' data-id='";
					str += $(this).data("id");
					str += "' data-line='";
					str += $(this).data("line");
					str += "' data-num='";
					str += $(this).data("num");
					str += "' class='choice'";
					str += " background-color: #C8C8C8'";
					str += " data-nm='";
					str += $(this).data("nm");
					str += "'>";
					str += $(this).data("nm");
					str += "</button>";
					str += "</li>";
					$("#choiceList").append(str);
				
					// 선택한 값 저장하고 reservationPay.jsp로 넘어감
					$("#dataForm").append('<input type="hidden" id="seatNm' + $(this).data("nm") + '" name="seatNm" value="' + $(this).data("nm") + '">');
					$("#dataForm").append('<input type="hidden" id="seatLine' + $(this).data("line") + '" name="seatLine" value="' + $(this).data("line") + '">');
					$("#dataForm").append('<input type="hidden" id="seatNum' + $(this).data("num") + '" name="seatNum" value="' + $(this).data("num") + '">');
			
					$(this).css({"background-color" : "#C40900"});
					$(this).addClass("sel");
				} else {									// 총 인원수보다 선택한 좌석이 더 많을 때
					btnCnt--;
					alert("인원 수보다 선택한 좌석 수가 더 많습니다.");
				}
				console.log("btnCnt: " + btnCnt);
				console.log("totalCnt " + totalCnt);
			}
		});
		
		// 성인 요금
		$("input:radio[name=T001260]").on("change", function(e){
			var price = $("#TicketAmt").val();
			var Check = $(this).is(":checked");
			if(Check) {
				totalAmt -= nAmt;
				totalCount -= nCount;
				nCount = $(this).val();
				nAmt = nCount * price;
				console.log("nCheck amt: " + nAmt);
				totalAmt += nAmt;
				totalCount += parseInt(nCount);
				console.log(totalCount);
				$("#totalAmt").val(totalAmt);
				$("#totalCnt").val(totalCount);
				$("#NormalCnt").val(nCount);
				$("#NormalPrice").val(nAmt);
				$(".totalAmt").hide();
				$(".bottom").append("<strong class='totalAmt'> 총 " + $("#totalAmt").val() + "원 </strong>");
			}
		});
		
		// 경로 요금
		$("input:radio[name=T001261]").on("change", function(e){
			var price = $("#TicketAmt").val() * 0.5;
			var Check = $(this).is(":checked");
			if(Check) {
				totalAmt -= oAmt;
				totalCount -= oCount;
				oCount = $(this).val();
				oAmt = oCount * price;
				console.log("oCheck amt: " + oAmt);
				totalAmt += oAmt;
				totalCount += parseInt(oCount);
				console.log(totalCount);
				$("#totalAmt").val(totalAmt);
				$("#totalCnt").val(totalCount);
				$("#OldCnt").val(oCount);
				$("#OldPrice").val(oAmt);
				$(".totalAmt").hide();
				$(".bottom").append("<strong class='totalAmt'> 총 " + $("#totalAmt").val() + "원 </strong>");
			}
		});
		
		// 청소년 요금
		$("input:radio[name=T001262]").on("change", function(e){
			var price = $("#TicketAmt").val() * 0.7;
			var Check = $(this).is(":checked");
			if(Check) {
				totalAmt -= yAmt;
				totalCount -= yCount;
				yCount = $(this).val();
				yAmt = yCount * price;
				console.log("yCheck amt: " + yAmt);
				totalAmt += yAmt;
				totalCount += parseInt(yCount);
				console.log(totalCount);
				$("#totalAmt").val(totalAmt);
				$("#totalCnt").val(totalCount);
				$("#YoungCnt").val(yCount);
				$("#YoungPrice").val(yAmt);
				$(".totalAmt").hide();
				$(".bottom").append("<strong class='totalAmt'> 총 " + $("#totalAmt").val() + "원 </strong>");
			}
		});
		
		
		$(".btn-pay").on("click", function(e) {
			var totalCnt = $("#totalCnt").val;
			var seatCnt = 0;
			
			// 선택된 좌석 수 확인
			var seatList = $('.sel');
				$.each(seatList, function(index, el){
					 console.log("seatList");
					 seatCnt++;
				});
			
			// 선택한 인원 수와 총 좌석 수가 같아야 submit
			if (seatCnt != totalCount) {
				alert("선택한 좌석 수를 확인해주세요!")
			} else {
				$("#dataForm").submit();
			}	
			
		});
		
	});


</script>
<jsp:include page="../footer.jsp"></jsp:include>	
		
	
<div style="left: -1000px; overflow: scroll; position: absolute; top: -1000px; border: none; box-sizing: content-box; height: 200px; margin: 0px; padding: 0px; width: 200px;"><div style="border: none; box-sizing: content-box; height: 200px; margin: 0px; padding: 0px; width: 200px;"></div></div>
</body>
</html>