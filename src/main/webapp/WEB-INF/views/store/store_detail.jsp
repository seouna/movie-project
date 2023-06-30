<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/common.css" rel="stylesheet">
<link href="resources/css/inc.css" rel="stylesheet">
<link href="resources/css/sub.css" rel="stylesheet">
<link href="resources/css/common.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>
</head>
<body>
<jsp:include page="../nav.jsp" />
<div id="contents" class="">
    <div class="inner-wrap">
        <!-- store-view -->
        <div class="store-view">
            <h2 class="tit">${item.get('item_name') }
            </h2>
            <div class="sub-info">
                <p class="bundle">${item.get('item_detail') }</p>
            </div>
            <!-- box-store-view -->
            <div class="box-store-view">
                <div class="left">
                    <div class="img">
                        <p><img src="${item.get('item_image') }" alt="아이무비 기프트카드 2만원권" onerror="noImg(this);"></p>
                    </div>
                    <p class="origin">
                    </p>
                </div>
                <!-- right -->
                <div class="right">
                    <!-- goods-info -->
                    <div class="goods-info">
                            <div class="line">
                                <p class="tit"><span class="line32">사용극장</span></p>
                                <div class="cont">
                                	<a href="#" class="a-link" name="brchList">사용가능극장</a>
                                </div>
                            </div>
                        <div class="line">
                            <p class="tit">유효기간</p>
                                <div class="cont">
                                    <p class="txt">
                                     구매일로부터 366일 이내
                                     
                                     사용 가능</p>
                                     <p class="txt min">본 상품의 최초 유효기간은 구매일로 부터 366일까지입니다.</p>
                                    <p></p>
                                </div>
                        </div>
                            <div class="line">
                                <p class="tit">판매수량</p>
                                <div class="cont">
                                    <div class="sale-count">
                                        <span> 1회 8개 구매가능	</span>
                                        <span> 1인 8개 구매가능	</span>
                                    </div>
                                </div>
                            </div>
                        <div class="line">
                                <p class="tit">구매 후 취소</p>
                                <div class="cont">
                                    <p class="txt">
                                            구매일로부터 366일 이내 취소 가능하며, 부분취소는 불가능합니다.
                                    </p>
                                    	<p class="txt min">구매일로 부터 366일까지 취소 가능하며, 부분취소는 불가합니다.</p>
                                </div>
                        </div>
                    </div>
                    <div class="type">
                        <div class="receipt">
                            <div class="line">
                                <p class="tit"><span class="line32">수량/금액</span></p>
                                <div class="cont">
                                    <button type="button" class="btn minus" title="수량감소">
                                    <i class="iconset ico-minus"></i></button>
                                    <input type="text" id="itemCount" title="수량 입력" class="input-text" readonly="readonly" value="1" min="1" max="100">
                                    <button type="button" class="btn plus" title="수량증가">
                                    <i class="iconset ico-plus"></i></button>
                                    <div class="money">
                                        <em id="prdtSumAmt">${item.get('item_price') }</em>
										    	<span>원</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--// type -->

                    <div class="btn-group">
		                                <a href="javascript:buy()" id="btnPurc" class="button purple large" w-data="500" h-data="410" title="구매">구매</a>
                    </div>
                </div>
                <!--// right -->
            </div>
            <!--// box-store-view -->
        </div>
        <!--// store-view -->

        <!-- 레이어 : 극장확인 -->
        <section id="layer_chk01" class="modal-layer">
        </section>
        <!--// 레이어 : 극장확인 -->

        <!-- 레이어 : 지점확인 -->
        <section id="layer_chk02" class="modal-layer">
        </section>
        <!--// 레이어 : 지점확인 -->

        <!-- 레이어 : 취소불가 -->
        <section id="layer_chk03" class="modal-layer">
        </section>
        <!--// 레이어 : 지점확인 -->
            <!-- box-pulldown -->
            <div class="box-pulldown">
                <div class="tit">
                    <button type="button" class="btn-toggle">구매 후 취소 <i class="iconset ico-arr-toggle-down">내용보기</i></button>
                </div>
            	<div class="dotList02">
                        • 아이무비 모바일 금액권은&nbsp;미사용분에 한하여 최초 유효기간 이내에만&nbsp;결제&nbsp;취소가&nbsp;가능합니다.<br>
• 결제&nbsp;취소&nbsp;방법&nbsp;:&nbsp;아이무비 온라인(홈페이지/App) 계정 로그인 &gt; &nbsp;나의 아이무비&nbsp;&gt;&nbsp;예매/구매내역 &gt;&nbsp;구매취소<br>
•&nbsp;유효기간&nbsp;만료&nbsp;1개월 전&nbsp;유효기간의&nbsp;연장을&nbsp;신청할&nbsp;수&nbsp;있으며,&nbsp;93일&nbsp;(3개월) 단위로&nbsp;연장&nbsp;됩니다.<br>
&nbsp; (소멸시효기간:&nbsp;5년)<br>
•&nbsp;환불은&nbsp;최초 유효기간&nbsp;만료&nbsp;또는 60% 이상 사용 시에만&nbsp;신청&nbsp;가능합니다.<br>
•&nbsp;최초 유효기간 만료 후 환불 시 결제금액의 90%만 환불되며, 60% 이상 사용 후 환불 시 잔여금액에 한하여 환불이 가능합니다.<br>
•&nbsp;유효기간&nbsp;연장&nbsp;및&nbsp;환불방법:&nbsp;Pay’s 고객센터(1644-5368)를 통해 연장 및 계좌 환불이 가능합니다.<br>
<br>
[&nbsp;아이무비 모바일 금액권&nbsp;고객센터&nbsp;]<br>
• ‘㈜한국페이즈서비스’&nbsp;고객센터&nbsp;1644-5368&nbsp;(평일&nbsp;09시&nbsp;~&nbsp;18시)<br>
•&nbsp;기간연장&nbsp;및&nbsp;환불문의,&nbsp;민원&nbsp;접수
            	</div>
            </div>
            <!--// box-pulldown -->

            <!-- box-pulldown -->
            <div class="box-pulldown">
                <div class="tit">
                    <button type="button" class="btn-toggle">상품이용안내 <i class="iconset ico-arr-toggle-down">내용보기</i></button>
                </div>
                <div class="dotList02">
                        [&nbsp;이용안내&nbsp;]<br>
• 아이무비 온라인(홈페이지/App)에서&nbsp;운영&nbsp;하는&nbsp;아이무비 모바일 금액권은 ㈜한국페이즈서비스를 통해 발행&nbsp;및&nbsp;운영&nbsp;됩니다.<br>
• 본 모바일 금액권은 주중/주말 제한없이 사용이 가능하며, 영화티켓(온/오프라인) 및 매점(오프라인)에서 상품 구매 시 사용 가능합니다.<br>
• 본 모바일 금액권은 금액 분할 사용이 가능하며, 사용 후 잔액은 유효기간 내 재사용이 가능합니다.<br>
• 본 모바일 금액권은 아이무비 멤버십 포인트 적립 및 현금영수증 발행이 가능합니다.<br>
• 본 모바일 금액권은 현금과 교환되지 않으며, 지류 및 온라인 관람권으로 교환이 불가합니다.<br>
• 영화관 지점 프로모션 및 행사상품은 구매가 불가할 수 있습니다.<br>
• 사용여부 및 잔액조회는 Pay’s 고객센터(1644-5368)에서 확인 가능합니다.<br>
&nbsp; &nbsp;운영시간 – 평일 09:30 ~ 18:00 (주말 및 공휴일 상담 불가)<br>
• 추가 결제 금액에 대해서는 동일한 모바일 금액권, 현금, 신용카드로 추가 결제 가능합니다.<br>
• 카드번호 1개당 1명의 계정에만 온라인에 등록할 수 있습니다.<br>
• 본 모바일 금액권의 유효기간은 구매일로부터 1년입니다<br>
<br>
[&nbsp;사용방법&nbsp;]<br>
• 아이무비 홈페이지, App 예매 방법<br>
&nbsp; 아이무비 계정 로그인 &gt; 영화/시간 선택 &gt; 관람인원 선택 &gt; 결제화면 [관람권/모바일상품권] 선택 &gt; [아이무비/페이즈 모바일 금액권] 선택 &gt; 금액권 번호 입력 및 적용 &gt; 결제<br>
• 현장 무인발권기 예매 및 매점 이용 방법<br>
&nbsp; 티켓구매 &gt; 영화/시간 선택 &gt; 관람인원 선택 &gt; 결제화면 [아이무비/페이즈 모바일금액권] 선택 &gt; 금액권 번호 입력 및 적용 &gt; 결제<br>
&nbsp; 매점구매 &gt; 상품 선택 &gt; 결제화면 [아이무비/페이즈 모바일금액권] 선택 &gt; 금액권 번호 입력 및 적용 &gt; 결제<br>
• 현장 매표소&amp;매점 이용 방법<br>
&nbsp; 매표소 및 매점에서 아이무비 모바일 금액권 제시 시 영화 예매 및 매점상품 구매 가능<br>
<br>
[&nbsp;사용불가사항&nbsp;]<br>
• 아트나인(독립영화관), 더 부티크 프라이빗<br>
• 굿즈패키지 매점상품, 영화제 티켓, 특별컨텐츠, 아이무비 지류관람권<br>
• 매점 사용 제외지점 : 경산하양점, 공주점, 김천점, 남춘천점, 북대구(칠곡)점, 속초점, 순천점, 안산중앙점, 원주점, 인천논현점, 진주(중안)점, 진천점, 첨단점, 청주사창점, 파주금촌점, ARTNINE
				</div>
            </div>
            <!--// box-pulldown -->
    </div>
</div>
<!-- 모달창 -->
<section id="layer_chk_theater" class="modal-layer" style="z-index: 505;">
<div class="wrap" style="width: 600px; height: 530px; margin-left: -300px; margin-top: -265px;">
	<header class="layer-header">
		<h3 class="tit">사용가능극장 </h3>
	</header>
	<!-- layer-con -->
	<div class="layer-con" style="height: 485px;">
		<!-- layer-goods-theater -->
		<div class="layer-goods-theater">
			<p class="txt">선택하신 상품의 사용가능한 극장입니다.</p>
			<div class="area">
				<ul class="modalTab">
						<li class="on">
							<button type="button" class="btn">서울 (19)</button>
							<div class="cont">
								<ul class="dot-list">
									
										<li>강남</li>
									
										<li>강남대로(씨티)</li>
									
										<li>강동</li>
									
										<li>군자</li>
									
										<li>더 부티크 목동현대백화점</li>
									
										<li>동대문</li>
									
										<li>마곡</li>
									
										<li>목동</li>
									
										<li>상봉</li>
									
										<li>상암월드컵경기장</li>
									
										<li>성수</li>
									
										<li>센트럴</li>
									
										<li>송파파크하비오</li>
									
										<li>신촌</li>
									
										<li>이수</li>
									
										<li>창동</li>
									
										<li>코엑스</li>
									
										<li>홍대</li>
									
										<li>화곡</li>
									
								</ul>
							</div>
						</li>
					
						<li>
							<button type="button" class="btn">경기 (30)</button>
							<div class="cont">
								<ul class="dot-list">
									
										<li>고양스타필드</li>
									
										<li>광명AK플라자</li>
									
										<li>광명소하</li>
									
										<li>금정AK플라자</li>
									
										<li>김포한강신도시</li>
									
										<li>남양주</li>
									
										<li>남양주현대아울렛 스페이스원</li>
									
										<li>동탄</li>
									
										<li>미사강변</li>
									
										<li>백석벨라시타</li>
									
										<li>별내</li>
									
										<li>부천스타필드시티</li>
									
										<li>분당</li>
									
										<li>수원</li>
									
										<li>수원남문</li>
									
										<li>수원호매실</li>
									
										<li>시흥배곧</li>
									
										<li>안산중앙</li>
									
										<li>안성스타필드</li>
									
										<li>양주</li>
									
										<li>영통</li>
									
										<li>용인기흥</li>
									
										<li>용인테크노밸리</li>
									
										<li>의정부민락</li>
									
										<li>일산</li>
									
										<li>킨텍스</li>
									
										<li>파주금촌</li>
									
										<li>파주운정</li>
									
										<li>파주출판도시</li>
									
										<li>하남스타필드</li>
									
								</ul>
							</div>
						</li>
					
						<li>
							<button type="button" class="btn">인천 (5)</button>
							<div class="cont">
								<ul class="dot-list">
									
										<li>검단</li>
									
										<li>송도</li>
									
										<li>영종</li>
									
										<li>인천논현</li>
									
										<li>청라지젤</li>
									
								</ul>
							</div>
						</li>
					
						<li>
							<button type="button" class="btn">대전/충청/세종 (15)</button>
							<div class="cont">
								<ul class="dot-list">
									
										<li>공주</li>
									
										<li>논산</li>
									
										<li>대전</li>
									
										<li>대전신세계 아트앤사이언스</li>
									
										<li>대전유성</li>
									
										<li>대전중앙로</li>
									
										<li>대전현대아울렛</li>
									
										<li>세종(조치원)</li>
									
										<li>세종나성</li>
									
										<li>세종청사</li>
									
										<li>오창</li>
									
										<li>진천</li>
									
										<li>천안</li>
									
										<li>청주사창</li>
									
										<li>홍성내포</li>
									
								</ul>
							</div>
						</li>
					
						<li>
							<button type="button" class="btn">부산/대구/경상 (26)</button>
							<div class="cont">
								<ul class="dot-list">
									
										<li>경북도청</li>
									
										<li>경산하양</li>
									
										<li>경주</li>
									
										<li>구미강동</li>
									
										<li>김천</li>
									
										<li>남포항</li>
									
										<li>대구신세계(동대구)</li>
									
										<li>대구이시아</li>
									
										<li>덕천</li>
									
										<li>마산</li>
									
										<li>문경</li>
									
										<li>부산극장</li>
									
										<li>부산대</li>
									
										<li>북대구(칠곡)</li>
									
										<li>사상</li>
									
										<li>삼천포</li>
									
										<li>양산</li>
									
										<li>양산증산</li>
									
										<li>울산</li>
									
										<li>정관</li>
									
										<li>진주(중안)</li>
									
										<li>창원</li>
									
										<li>창원_P</li>
									
										<li>창원내서</li>
									
										<li>포항</li>
									
										<li>해운대(장산)</li>
									
								</ul>
							</div>
						</li>
					
						<li>
							<button type="button" class="btn">광주/전라 (10)</button>
							<div class="cont">
								<ul class="dot-list">
									
										<li>광주상무</li>
									
										<li>광주하남</li>
									
										<li>목포하당(포르모)</li>
									
										<li>순천</li>
									
										<li>여수웅천</li>
									
										<li>전대(광주)</li>
									
										<li>전주객사</li>
									
										<li>전주송천</li>
									
										<li>전주혁신</li>
									
										<li>첨단</li>
									
								</ul>
							</div>
						</li>
					
						<li>
							<button type="button" class="btn">강원 (5)</button>
							<div class="cont">
								<ul class="dot-list">
									
										<li>남춘천</li>
									
										<li>속초</li>
									
										<li>원주</li>
									
										<li>원주센트럴</li>
									
										<li>춘천석사</li>
									
								</ul>
							</div>
						</li>
					
						<li>
							<button type="button" class="btn">제주 (0)</button>
							<div class="cont">
								<ul class="dot-list">
									
								</ul>
							</div>
						</li>
					
				</ul>
			</div>
			<p class="mt20 a-c">* 사용가능극장은 당사의 사정에 의해 변경될 수 있습니다.</p>
		</div>
	</div>

	<button type="button" class="btn-modal-close">레이어 닫기</button>
</div>
</section>
<jsp:include page="../footer.jsp"/>
	<script>
		$(function() {
			
			// 모달창 클릭
			$('.a-link').on("click", function() {
				$('#layer_chk_theater').addClass('on');
			});
			
			// 모달창 목록
			$('ul.modalTab li').click(function() {
				$('ul.modalTab li').removeClass('on');
				$(this).addClass('on');
			})
			
			// 모달창 취소
			$('.btn-modal-close').on("click", function() {
				$('#layer_chk_theater').removeClass('on');
			});
			
			
			// 하단 박스 클릭
			$('.box-pulldown').click(function() {
				
               if($(this).attr('class') == 'box-pulldown on') {
				$('.box-pulldown').removeClass('on');
               } else if($(this).attr('class') == 'box-pulldown') {
               	$('.box-pulldown').removeClass('on');
				$(this).addClass('on');
               }
	               
			});
			
			// 상품수량 + 버튼
			$('.btn.plus').click(function() {
				var currentVal = parseInt($('.input-text').val());
				if(currentVal < $('.input-text').attr('max')) {
					$('.input-text').val(currentVal + 1).change();
	            }
				$('.money em').html(${item.get('item_price') } * $('.input-text').val());
			})
			
			// 상품수량 - 버튼
			$('.btn.minus').click(function() {
				var currentVal = parseInt($('.input-text').val());
				if(currentVal > $('.input-text').attr('min')) {
					$('.input-text').val(currentVal - 1).change();
	            }
				$('.money em').html(${item.get('item_price') } * $('.input-text').val());
			})
			
			
		});
		
		function buy() {
			location.href = "store_pay?item_code=${item.get('item_code') }&item_price=" + $('#prdtSumAmt').text() + "&item_count=" + $('#itemCount').val();
		}
	</script>
</body>
</html>