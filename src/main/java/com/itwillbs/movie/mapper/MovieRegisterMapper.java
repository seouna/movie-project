package com.itwillbs.movie.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

public interface MovieRegisterMapper {
	
	//영화등록
	int registMovie(HashMap<String, String> movie);
	
	//모든영화목록
	List<HashMap<String, String>> selectMovies();
	//현재상영목록
	List<HashMap<String, String>> selectScreeningMovieList();
	//최신영화순 조회
	List<HashMap<String, String>> selectCommingMovieList();
	
	//상영예정작목록 
//	List<HashMap<String, String>> selectCommingMovies();	
	
	//영화상세목록
	HashMap<String, String> selectMovie(String info_movie_code);
	//영화 상세정보 - 리뷰
	List<HashMap<String, String>> selectMovieReview(String info_movie_code);
	
	//스케쥴상세
	HashMap<String, String> selectSchMovie(String sch_code);
	
	
	//영화삭제
	int deleteMovie(String info_movie_code);
	
	//영화정보수정
	int updateMovie(@RequestParam("movie") HashMap<String, String> movie);

	//영화관리스트
	List<HashMap<String, String>> selectCinema();

	
	//영화관-상영관 조회
	List<HashMap<String, String>> selectScreen(String cinema_name);
	
	//영화상영일정추가  ..@Param("boardno")int boardno, @Param("userno")int userno
	int scheduleRegister(@RequestParam("movieSchedule") HashMap<String, String> movieSchedule);
	
	//영화상영일정목록
	List<HashMap<String, String>> selectScheduleList(
			@Param("startRow") int startRow
		  , @Param("listLimit") int listLimit
		  , @Param("sch_movie_code") String sch_movie_code
		  , @Param("sch_cinema_code") String sch_cinema_code
		  , @Param("sch_research_date") String sch_research_date);

	List<HashMap<String, String>> cinemaNameSort();
	List<HashMap<String, String>> screenNameSort();
	List<HashMap<String, String>> movieNameSort();
	List<HashMap<String, String>> schDateSort();
	List<HashMap<String, String>> schStartSort();
	List<HashMap<String, String>> schLastSort();

	//영화상영 상세정보
	HashMap<String, String> selectScheduleDetail(String sch_code);
	
	//영화 상영일정 삭제
	int deleteSchedule(String sch_code);
	int deleteDateSch(String date);

	int movieScheduleUpdate(HashMap<String, String> schedule);


	HashMap<String, String> infoMovieCode(String info_movie_title);


	int lastTimeUpdate(HashMap<String, String> schedule);

	List<HashMap<String, String>> infoMovieCodeSort();
	List<HashMap<String, String>> infoMovieNameSort();
	List<HashMap<String, String>> infoYearSort();
	List<HashMap<String, String>> infoTimeSort();
	List<HashMap<String, String>> infoShowDateSort();
	List<HashMap<String, String>> infoEndDateSort();
	List<HashMap<String, String>> infoStorySort();

	List<HashMap<String, String>> endSchList();

	int insertSchedule_end();

	int endSchedule_del();

//	int selectBoardListCount();

	List<HashMap<String, String>> endSchList(@Param("startRow") int startRow, @Param("listLimit") int listLimit);

	int todayCount();

	int selectBoardListCount(@Param("sch_movie_code") String sch_movie_code,@Param("sch_cinema_code") String sch_cinema_code,@Param("sch_research_date") String sch_research_date);
	int schEndListCount();
	
	//상영예매내역
	List<HashMap<String, String>> resList(@Param("startRow") int startRow,@Param("listLimit")int listLimit);

	//상세 예매정보
	HashMap<String, String> detailRes(String res_code);
	
	//예매내용삭제
	int delRes(String res_code);
	
	//예매내용 수정
	int updateRes(HashMap<String, String> reservation);

	int resListCount();

	//상영시간체크
	List<HashMap<String, String>> schCheckTime(@Param("sch_date") String sch_date,@Param("cinema_name") String cinema_name,@Param("screen_name") String screen_name,@Param("movie_code") String movie_code);

	List<HashMap<String, String>> screeningMovies();

	
	int resTodayCount();


}
