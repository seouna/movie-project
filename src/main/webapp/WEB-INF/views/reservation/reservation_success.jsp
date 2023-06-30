<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc.css" rel="stylesheet">
	<style>
		.point {
			color : red;
		}
	</style>	
	
<meta charset="UTF-8">
<title>결제 완료</title>
</head>
<body>
	<jsp:include page="../nav.jsp"></jsp:include>
	
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
	
	<input type="hidden" id="PaymentCd" name="PaymentCd" value="${param.PaymentCd }">

	<div id="contents" class="">
	    <div class="inner-wrap">
	        <div class="store-view">
	            <h2 class="tit">결제&예매 확인
	            </h2>
	            <div class="sub-info">
	                <p class="bundle">예매가 완료 되었습니다! 결제 금액의 10%가 적립됩니다.</p>
	            </div>
	            <!-- box-store-view -->
	            <div class="box-store-view">
	                <div class="left">
	                    <div class="img">
	                        <p><img src="${vo.getHidMovieUrl() }" onerror="noImg(this);"></p>
	                    </div>
	                    <p class="origin">
	                    </p>
	                </div>
	                <!-- right -->
	                <div class="right">
	                    <div class="goods-info">
	                            <div class="line">
	                                <p class="tit"><span class="line32">예매번호</span></p>
	                                <div class="cont">
	                                <p class="txt">${param.resCode }</p>
	                                </div>
	                            </div>
	                            <div class="line">
	                                <p class="tit"><span class="line32">영화명</span></p>
	                                <div class="cont">
	                                <p class="txt">${vo.getMovieNm() }</p>
	                                </div>
	                            </div>
	                        <div class="line">
	                            <p class="tit">극장</p>
	                                <div class="cont">
	                                    <p class="txt">${vo.getCinemaNm() }</p>
	                                </div>
	                        </div>
	                        <div class="line">
	                            <p class="tit">상영관</p>
	                                <div class="cont">
	                                    <p class="txt">${vo.getScreenNm() }</p>
	                                </div>
	                        </div>
	                            <div class="line">
	                                <p class="tit">날짜</p>
	                                <div class="cont">
	                                    <div class="txt">
	                                        <span> ${vo.getMovieDate() }	</span>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="line">
	                                <p class="tit">시간</p>
	                                <div class="cont">
	                                    <div class="sale-count">
	                                        <span> ${vo.getScreenTime() }	</span>
	                                    </div>
	                                </div>
	                            </div>
	                        <div class="line">
	                                <p class="tit">인원</p>
	                                <div class="cont">
	                                    <p class="txt">${vo.getTotalCnt() }명</p>
	                                </div>
	                        </div>
	                        <div class="line">
	                                <p class="tit">좌석</p>
	                                <div class="cont">
	                                    <p class="txt">${vo.getSeatNm() }</p>
	                                </div>
	                        </div>
	                    </div>
	
	                    <div class="btn-group">
			            	<a href="main" id="btnPurHome" class="button purple large"  title="main">HOME</a>
			            	<a href="mypageR" id="btnPurMypage" class="button large" title="mypageR">마이페이지</a>
	                    </div>
	                </div>
	                <!--// right -->
	            </div>
	        </div>
		</div>
	</div>
<script type="text/javascript">
// 중복 결제 방지
function NotReload(){
    if( (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116) ) {
        event.keyCode = 0;
        event.cancelBubble = true;
        event.returnValue = false;
    } 
}
document.onkeydown = NotReload;

</script>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>