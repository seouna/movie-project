package com.itwillbs.movie.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.itwillbs.movie.vo.MemberVO;

public interface MypageMapper {

	MemberVO selectMemberInfo(String id);

	String selectPasswd(String id);

	int updateMemberInfo(HashMap<String, String> update);

	int deleteMember(HashMap<String, String> quit);

	List<HashMap<String, String>> qnaList(String id);

	int insertReview(HashMap<String, String> review);

	List<HashMap<String, String>> revList(String id);

	HashMap<String, String> selectMemberId(String id);

	List<HashMap<String, String>> movieList(String id);


	int insertPoint(String id);

	List<HashMap<String, String>> pointList(String id);

	List<HashMap<String, String>> payList(String id);

	List<HashMap<String, String>> cinemaList(String id);

	int updatePoint(String id);

	List<HashMap<String, String>> resList(String id);

//	List<HashMap<String, String>> resList(String id, int year, int month);

	HashMap<String,String>  checkReview(String id);

	List<HashMap<String, String>> likeList(String id);

	int deleteReview(String rev_code);

	int removePoint(String id);

	HashMap<String, String> resMovie(String id);

	int getPoint(String id);

	List<HashMap<String, String>> resListByDate(Map<String, Object> map);

//	List<HashMap<String, String>> resListByDate(Map<String, Object> map);

//	List<HashMap<String, String>> resListByDate(String id, Integer year, Integer month);




}
