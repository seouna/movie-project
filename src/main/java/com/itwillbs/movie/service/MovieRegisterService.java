package com.itwillbs.movie.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.movie.mapper.MovieRegisterMapper;

@Service
public class MovieRegisterService {
	
	@Autowired
	private MovieRegisterMapper mapper;
	
	//영화 목록
	public List<HashMap<String, String>> selectMovies(int startRow, int listLimit) {
		return mapper.selectMovies(startRow,listLimit);
	}
	
	//끝난목록
	public List<HashMap<String, String>> selectEndMoive(int startRow, int listLimit) {
		return mapper.selectEndMoive(startRow,listLimit);
	}
	
	//재상영
	public List<HashMap<String, String>> selectReScreeningMoive(int startRow, int listLimit) {
		return mapper.selectReScreeningMoive(startRow,listLimit);
	}
	
	
	//현재 상영목록
	public List<HashMap<String, String>> selectScreeningMovieList() {
		return mapper.selectScreeningMovieList();
	}
	
	//상영예정 영화 목록 
	public List<HashMap<String, String>> selectCommingMovieList() {
		return mapper.selectCommingMovieList();
	}
//	//최신 영화 목록
//	public List<HashMap<String, String>> selectAscendingMovies() {
//		return mapper.selectAscendingMovies();
//	}
//	
	
	
	
	//영화 상세정보
	public HashMap<String, String> selectMovie(String info_movie_code) {
		return mapper.selectMovie(info_movie_code);
	}
	//영화 상세정보 - 리뷰
	public List<HashMap<String, String>> selectMovieReview(String info_movie_code) {
		return mapper.selectMovieReview(info_movie_code);
	}
	
	
	//영화등록
	public int registMovie(HashMap<String, String> movie) {
		return mapper.registMovie(movie);
	}
	
	
	//스케쥴의 상세정보
	public HashMap<String, String> selectSchMovie(String sch_code) {
		return mapper.selectSchMovie(sch_code);
	}
	
	//영화삭제
	public int deleteMovie(String info_movie_code) {
		return mapper.deleteMovie(info_movie_code);
	}
	
	//영화정보수정
	public int updateMovie(@RequestParam("movie") HashMap<String, String> movie) {
		return mapper.updateMovie(movie);
	}
	//영화관리스트
	public List<HashMap<String, String>> selectCinema() {
		return mapper.selectCinema();
	}

	//영화관 선택하면 상영관나오게
	public List<HashMap<String, String>> selectScreen(String cinema_name) {
		return mapper.selectScreen(cinema_name);
	}

	//영화일정 등록
	public int scheduleRegister(HashMap<String, String> movieSchedule) {
		return mapper.scheduleRegister(movieSchedule);
	}

	//영화 일정 목록	
//	public List<HashMap<String, String>> selectSchedule() {
//		return mapper.selectScheduleDetail();
//	}
	
	
	//페이징처리한 영화일정목록
	public List<HashMap<String, String>> selectSchedule(int startRow, int listLimit, String sch_movie_code, String sch_cinema_code, String sch_research_date) {
		return mapper.selectScheduleList(startRow,listLimit,sch_movie_code,sch_cinema_code,sch_research_date);
	}

	public List<HashMap<String, String>> cinemaNameSort() {
		return mapper.cinemaNameSort();
	}

	public List<HashMap<String, String>> screenNameSort() {
		return mapper.screenNameSort();
	}

	public List<HashMap<String, String>> movieNameSort() {
		return mapper.movieNameSort();
	}

	public List<HashMap<String, String>> schDateSort() {
		return mapper.schDateSort();
	}

	public List<HashMap<String, String>> schStartSort() {
		return mapper.schStartSort();
	}

	public List<HashMap<String, String>> schLastSort() {
		return mapper.schLastSort();
	}
	
	//영화일정 상세정보
	public HashMap<String, String> detailSchedule(String sch_code) {
		return mapper.selectScheduleDetail(sch_code);
	}
	//영화일정 삭제
	public int deleteSchedule(String sch_code) {
		return mapper.deleteSchedule(sch_code);
	}

 	// 날짜별 영화일정 삭제
	public int deleteDateSch(String date) {
		return mapper.deleteDateSch(date);
	}
	
	//일정 수정
	public int movieScheduleUpdatePro(HashMap<String, String> schedule) {
		return mapper.movieScheduleUpdate(schedule);
	}

	//
	public HashMap<String, String> infoMovieCode(String info_movie_title) {
		return mapper.infoMovieCode(info_movie_title);
	}

	//종료시간수정
	public int lastTimeUpdate(HashMap<String, String> schedule) {
		return mapper.lastTimeUpdate(schedule);
	}

	//정렬
	public List<HashMap<String, String>> infoMovieCodeSort() {
		return mapper.infoMovieCodeSort();
	}

	public List<HashMap<String, String>> infoMovieNameSort() {
		return mapper.infoMovieNameSort();
	}
	public List<HashMap<String, String>> infoYearSort() {
		return mapper.infoYearSort();
	}
	public List<HashMap<String, String>> infoTimeSort() {
		return mapper.infoTimeSort();
	}
	public List<HashMap<String, String>> infoShowDateSort() {
		return mapper.infoShowDateSort();
	}
	public List<HashMap<String, String>> infoEndDateSort() {
		return mapper.infoEndDateSort();
	}
	public List<HashMap<String, String>> infoStorySort() {
		return mapper.infoStorySort();
	}
	//상영종료된 값 조회
//	public List<HashMap<String, String>> selectEndSch() {
//		return mapper.selectEndSch();
//	}

	public int insertSchedule_end() {
		return mapper.insertSchedule_end();
	}
	public int endSchedule_del() {
		return mapper.endSchedule_del();
	}
	public int getBoardListCount(String sch_movie_code, String sch_cinema_code, String sch_research_date) {
		return mapper.selectBoardListCount(sch_movie_code,sch_cinema_code,sch_research_date);
	}
	
	
	//상영종료 list
//	public List<HashMap<String, String>> endSchList() {
//	return mapper.endSchList();
//}
	//페이징처리한 상영종료 list
	public List<HashMap<String, String>> endSchList(int startRow, int listLimit) {
		return mapper.endSchList(startRow,listLimit);
	}
	public int selectTodayCount() {
		return mapper.todayCount();
	}
	public int getEndListCount() {
		return mapper.schEndListCount();
	}
	
	//영화예매내역
	public List<HashMap<String, String>> resList(int startRow, int listLimit) {
		return mapper.resList(startRow,listLimit);
	}
	//detail 예매내역
	public HashMap<String, String> detailRes(String res_code) {
		return mapper.detailRes(res_code);
	}
	public int delRes(String res_code) {
		return mapper.delRes(res_code);
	}
	public int updateRes(HashMap<String, String> reservation) {
		System.out.println("service===========================================");
		System.out.println(reservation);
		System.out.println("service===========================================");
		return mapper.updateRes(reservation);
	}
	public int getResListCount() {
		return mapper.resListCount();
	}
	
	//상영관 중복 시간 체크
	public List<HashMap<String, String>> schCheckTime(String sch_date, String cinema_name, String screen_name,String movie_code) {
		return mapper.schCheckTime(sch_date,cinema_name,screen_name,movie_code);
	}
	public List<HashMap<String, String>> screeningMovies() {
		
		return mapper.screeningMovies();
	}
	public int resTodayCount() {
		return mapper.resTodayCount();
	}
	
	//종료된 상영목록이있는지 체크
	public int ended_screening() {
		return mapper.ended_screening();
	}
	public int getScreeningListCount() {
		return mapper.screeningListCount();
	}

	public int getReScreeningListCount() {
		return mapper.reScreeningListCount();
	}




}
