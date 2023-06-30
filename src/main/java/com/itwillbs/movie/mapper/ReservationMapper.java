
package com.itwillbs.movie.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.itwillbs.movie.vo.*;

public interface ReservationMapper {
	List<HashMap<String, String>> selectCinema();

	List<HashMap<String, String>> selectMovieInfo();

	List<HashMap<String, String>> selectmoviesList(String CnItemCd);

	List<HashMap<String, String>> selectMovieTimeList(@Param("CnItemCd") String CnItemCd, @Param("MvItemCd") String MvItemCd, @Param("dateCd") String dateCd);

	List<HashMap<String, String>> selectReservationList(String schCd);

	HashMap<String, String> selectMemberId(String id);

	int insertReservation(@Param("vo") ReservationVO vo, @Param("id") String id);

	int updateSchedule(@Param("schCd") String schCd, @Param("seatCnt") int seatCnt);

	int insertReservationPoint(@Param("id") String id, @Param("totalAmt") String totalAmt);

	int updateMemberPoint(@Param("id") String id, @Param("totalAmt") String totalAmt);

	String selectMemberPreferGenre(String id);

	List<HashMap<String, String>> selectPreferMoviesList(@Param("preferGenre") String preferGenre, @Param("CnItemCd") String CnItemCd);

	int insertNonMember(@Param("uuid") String uuid, @Param("guestName") String guestName, @Param("pass") String pass, @Param("phone") String phone);

	String selectPoint(String id);

	String selectDiscount(String schCd);

	int updateresultPoint(@Param("id") String id, @Param("resultPoint") String resultPoint);
	
}
