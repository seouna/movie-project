package com.itwillbs.movie.mapper;

import java.util.HashMap;
import java.util.List;

public interface LikeMapper {

	HashMap<String, String> findLike(HashMap<String , String> like);
	
	int insertLike(HashMap<String, String> like);
	
	int deleteLike(HashMap<String, String> like);
	
	int updateLike(HashMap<String, String> like);
	
	List<HashMap<String, String>> findLikeList(String id);
	
}














