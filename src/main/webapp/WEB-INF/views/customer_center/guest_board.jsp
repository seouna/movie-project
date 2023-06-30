<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<title>아이무비</title>
</head>
<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/inc.css" rel="stylesheet">
<!-- 상단 -->
<link href="${pageContext.request.contextPath }/resources/css/sub.css" rel="stylesheet">
<!-- 본문 -->
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet">
<body>
	<jsp:include page="../nav.jsp" />
	<div class="container has-lnb">
		<div class="inner-wrap">
			<jsp:include page="lnb-area.jsp" />

			<div id="contents">
            <h2 class="tit">문의내역</h2>
            <div class="tab-purple mb20">
                <ul>
                    <li data-url="/mypage/myinquiry?cd=INQD01" class="on"><a href="#" class="btn" data-cd="INQD01" title="1:1 문의내역 탭으로 이동">1:1 문의내역</a></li>
                    <li data-url="/mypage/myinquiry?cd=INQD03"><a href="#" class="btn" data-cd="INQD03" title="단체관람/대관 문의내역 탭으로 이동">단체관람/대관 문의내역</a></li>
                    <li data-url="/mypage/myinquiry?cd=INQD02"><a href="#" class="btn" data-cd="INQD02" title="분실물 문의내역 탭으로 이동">분실물 문의내역</a></li>
                    <li data-url="/mypage/myinquiry?cd=INQD04"><a href="#" class="btn" data-cd="INQD04" title="제휴/광고/부대사업 문의내역 탭으로 이동">제휴/광고/부대사업 문의내역</a></li>
                </ul>
            </div>

            <div class="mypage-infomation mt20">
                <ul class="dot-list mb20">
                    <li id="tabDesc">고객센터를 통해 남기신 1:1 문의내역을 확인하실 수 있습니다.</li>
                    <!-- <li>문의하시기 전 <a href="/support/faq" class="a-link"><strong>자주묻는질문</strong></a>을 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다</li> -->
                </ul>

                <div class="btn-group right">
                    <a href="#" class="button" id="inqBtn" title="1:1 문의하기">1:1 문의하기</a>
                </div>
            </div>

            <div class="board-list-util mb10">
                <p class="result-count">
                    <!-- to 개발 : 검색을 안한 경우 -->
                    <strong>전체 (<b id="totalCnt">0</b>건)</strong>
                </p>

                <div class="dropdown bootstrap-select bs3"><select id="custInqStatCd" onchange="javascript:$('#searchBtn').click();" class="" tabindex="-98">
                    <option value="">전체</option>
                    
                        
                            <option value="INQST1">미답변</option>
                        
                    
                        
                            <option value="INQST2">답변완료</option>
                        
                    
                        
                    
                        
                    
                        
                    
                </select><button type="button" class="btn dropdown-toggle btn-default bs-placeholder" data-toggle="dropdown" role="button" data-id="custInqStatCd" title="전체"><div class="filter-option"><div class="filter-option-inner"><div class="filter-option-inner-inner">전체</div></div> </div><span class="bs-caret"><span class="caret"></span></span></button><div class="dropdown-menu open" role="combobox"><div class="inner open" role="listbox" aria-expanded="false" tabindex="-1"><ul class="dropdown-menu inner "></ul></div></div></div>

                <div class="board-search ml07">
                    <input type="text" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="input-text" id="searchTxt" value="">
                    <button type="button" class="btn-search-input" id="searchBtn">검색</button>
                </div>
            </div>

            <div class="table-wrap">
                <table class="board-list a-c">
                    <caption>번호, 극장, 유형, 제목, 답변상태, 등록일 순서로 보여주는 1:1 문의 내역 표입니다</caption>
                    <colgroup>
                        <col style="width:80px">
                        <col style="width:140px;">
                        <col style="width:120px;">
                        <col>
                        <col style="width:160px;">
                        <col style="width:100px;">
                    </colgroup>
                    <thead>
                    <tr style="line-height: 38px">
                        <th scope="col">번호</th>
                        <th scope="col">극장</th>
                        <th scope="col">유형</th>
                        <th scope="col">제목</th>
                        <th scope="col">답변상태</th>
                        <th scope="col">등록일</th>
                    </tr>
                    </thead>
                    <tbody><tr><td colspan="6">목록이 없습니다.</td></tr></tbody>
                </table>
            </div>
            <section id="layer-01" class="layer-popup" style="top: 31px; left: 304.5px; width: 500px; height:300px; opacity: 1; display: none;">
                <div class="wrap">
                    <header class="layer-header">
                        <h3 class="tit">
                            비밀번호 입력
                        </h3>
                    </header>

                    <div class="layer-con">
                        <p>글 작성시 입력한 비밀번호를 입력해주세요.</p>
                        <div class="box-gray a-c">
                            <input type="password" id="password" title="비밀번호 입력" class="input-text w250px">
                            <p class="fc_r mt10 mb0">비밀번호가 일치하지 않습니다. 다시 입력해주세요.</p>
                        </div>
                        <div class="btn-group">
                            <a href="#" class="button small lyclose" id="cancelBtn" title="취소">취소</a>
                            <a href="#" class="button small purple" id="chkBtn" title="확인">확인</a>
                        </div>
                    </div>

                    <button type="button" class="btn-layer-close">레이어 닫기</button>
                </div>
            </section>
            <!-- pagination -->
            <nav class="pagination"></nav>
            <!--// pagination -->
        </div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>