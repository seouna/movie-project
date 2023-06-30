package com.itwillbs.movie.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.itwillbs.movie.mapper.*;
import com.itwillbs.movie.vo.*;


@Service
public class ReservationService {
	@Autowired
	private ReservationMapper mapper;
	
	public List<HashMap<String, String>> selectCinema() {
		return mapper.selectCinema();
	}

	public List<HashMap<String, String>> selectMovieInfo() {
		return mapper.selectMovieInfo();
	}

	public List<HashMap<String, String>> selectmoviesList(String CnItemCd) {
		return mapper.selectmoviesList(CnItemCd);
	}

	public List<HashMap<String, String>> selectMovieTimeList(String cnItemCd, String mvItemCd, String dateCd) {
		return mapper.selectMovieTimeList(cnItemCd, mvItemCd, dateCd);
	}


	public List<HashMap<String, String>> selectReservationList(String schCd) {
		return mapper.selectReservationList(schCd);
	}

	public HashMap<String, String> selectMemberId(String id) {
		return mapper.selectMemberId(id);
	}

	public int insertReservation(ReservationVO vo, String id) {
		return mapper.insertReservation(vo, id);
	}

	public int updateSchedule(String schCd, int seatCnt) {
		return mapper.updateSchedule(schCd, seatCnt);
	}

	public int resCount() {
		return 0;
	}

	public int insertReservationPoint(String id, String totalAmt) {
		return mapper.insertReservationPoint(id, totalAmt);
	}

	public int updateMemberPoint(String id, String totalAmt) {
		return mapper.updateMemberPoint(id, totalAmt);
	}

	public String selectMemberPreferGenre(String id) {
		return mapper.selectMemberPreferGenre(id);
	}

	public List<HashMap<String, String>> selectPreferMoviesList(String preferGenre, String CnItemCd) {
		return mapper.selectPreferMoviesList(preferGenre, CnItemCd);
	}

	public int insertNonMember(String uuid, String guestName, String pass, String phone) {
		return mapper.insertNonMember(uuid, guestName, pass, phone);
	}

	public String selectPoint(String id) {
		return mapper.selectPoint(id);
	}

	public String selectDiscount(String schCd) {
		return mapper.selectDiscount(schCd);
	}

	public int updateresultPoint(String id, String resultPoint) {
		return mapper.updateresultPoint(id, resultPoint);
	}

	

}
