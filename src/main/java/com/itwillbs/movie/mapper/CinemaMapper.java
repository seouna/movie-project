package com.itwillbs.movie.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

public interface CinemaMapper {


	List<HashMap<String, String>> location();
	List<HashMap<String, String>> locationCinema(String location_name);
	List<HashMap<String, String>> noticeList();
	List<HashMap<String, String>> cinemaDetail(String cinema_code);
	List<HashMap<String, String>> schList(@Param("cinema_code") String cinema_code,@Param("date") String date);
	HashMap<String, String> preferCinema(String id);
	

}
