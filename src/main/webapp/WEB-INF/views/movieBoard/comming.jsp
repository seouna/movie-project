<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/inc.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/movieInfo.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<jsp:include page="../nav.jsp" />
<c:if test = "${not empty sessionScope.sId }" >
	<c:set var="likeList" value="${likeList}"/>
</c:if>   
</head>
<body id="top">

<div id = "container">
 		<div id="content">
			<div class="selector"></div>
			<div class="section group section-movie-list comming">
			<h2 class="tit">Ι 상영예정작 Ι</h2>	
   				<ul>
					<c:forEach var="movie" items="${movieList }">
					    <li data-moviecode="${movie.info_movie_code }">
						    <span class="over over-a">
						    	<a href="#" class="rsv">
						    		<span class="over-btn-rsv">
						    		<c:choose>
										<c:when test="${movie.info_status eq 'screening' }">예매하기</c:when>						    		
						    			<c:when test="${movie.info_status eq 'comming' }">상영예정</c:when>
						    			<c:when test="${movie.info_status eq 'end' }">상영종료</c:when>
						    		</c:choose>
						    		</span>
						    		</a>
						    	<a href="MovieInfo?info_movie_code=${movie.info_movie_code }" class="info">
						    		<span class="over-btn-info">상세정보</span></a>
					    	</span>
					    	<img src="${movie.info_movie_poster}" class="posterlist">
					    	<div class="movie-desc">
					    		<p class="${movie.rate }">,</p>
					    		<p title="${movie.info_movie_title }" class="tit">${movie.info_movie_title }</p>
			    			</div>
			    			
					    <div class="btn-util">
							 <div class="like-btn">
								<a href="javascript:;" class="icon heart">
								<c:set var="info_movie_code" value="${movie.info_movie_code }"/>
									<c:choose>
										<c:when test ="${fn:contains(likeList,info_movie_code) }">
											<img src='${pageContext.request.contextPath}/resources/images/ico/after-like.png' alt="찜하기완료">
										</c:when>
										<c:otherwise>
											<img src="resources/images/ico/before-like.png" alt="찜하기">	
										</c:otherwise>
									</c:choose>
									<span class="likeNum">${movie.like_count }</span>
								</a>
							</div>
			                <p class="button" data-no="${movie.info_movie_code }" title="영화 예매하기">상영예정</p>
			           		 </div>
			  			</li>
					</c:forEach>		    
   				</ul>
   			</div>
		</div>
	</div>
<script type="text/javascript">
// 클릭시 on up에 따른 class add/remove
  $(document).ready(function () {
        $(".section-movie-list").on("mouseenter", "ul > li > span.over > a", function () {
            $(this).parent().addClass("on");
            if ($(this).hasClass("info")) {
                $(this).parent().removeClass("down");
                $(this).parent().addClass("up");
            }
            if ($(this).hasClass("rsv")) {
                $(this).parent().removeClass("up");
                $(this).parent().addClass("down");
            }
        });
        
        $(".section-movie-list").on("mouseleave", "ul>li> span.over", function () {
            $(this).closest("ul").find("span.over").removeClass("on");
        });
        
 });
 
var $likeBtn = $('.icon.heart');
$likeBtn.click(function() {
	// ajax -> likeInsert(@controller)
	// ajax : context : this를 써줘야 success에서 this 사용 가능
	var info_movie_code = $(this).closest("li").data("moviecode")+"";
	
	$likeBtn.toggleClass('active');
	
	$.ajax({
		url : 'likeClick',
		type : 'POST',
		context : this,
		data : {
			info_movie_code : info_movie_code
		},
		success : function(result){
			// 좋아요 결과 출력
			alert(result.msg)
			
			if(result.resultType == "insert"){
				$(this).find('img').attr({
					'src' : '${pageContext.request.contextPath}/resources/images/ico/after-like.png',
					alt : '찜하기 완료'
				})
			}else if(result.resultType = "delete"){
				$(this).find('img').attr({
					'src' : '${pageContext.request.contextPath}/resources/images/ico/before-like.png',
					alt : "찜하기"
				})
			}
			$(this).find('span').html(result.like_count)
		}
	}) 
});
</script>
	<jsp:include page="../footer.jsp"/>
</body>
</html>