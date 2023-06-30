package com.itwillbs.movie.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.movie.mapper.BoardMapper;
import com.itwillbs.movie.mapper.CinemaMapper;
import com.itwillbs.movie.vo.BoardVO;

@Service
public class CinemaService {

	@Autowired
	private CinemaMapper mapper;
	public List<HashMap<String, String>> location() {
		return mapper.location();
	}

	public List<HashMap<String, String>> locationCinema(String location_name) {
		return mapper.locationCinema(location_name);
	}

	public List<HashMap<String, String>> noticeList() {
		return mapper.noticeList();
	}

	public List<HashMap<String, String>> cinemaDetail(String cinema_code) {
		return mapper.cinemaDetail(cinema_code);
	}

//	public List<HashMap<String, Object>> schList(String cinema_code) {
////	public List<HashMap<String, String>> schList(String cinema_code,String play_date) {
////		return mapper.schList(cinema_code,play_date);
//		return mapper.schList(cinema_code);
//	}

	public List<HashMap<String, String>> schList(String cinema_code, String date) {
		// TODO Auto-generated method stub
		return mapper.schList(cinema_code,date);
	}


	public HashMap<String, String> preferCinema(String id) {
		return mapper.preferCinema(id);
	}

//	public List<HashMap<String, Object>> schList(String cinema_code, String date) {
//		System.out.println(date);
//		return mapper.schList(cinema_code,date);
//		return mapper.schList(cinema_code,date);
//	}

	
	

	
	
}
