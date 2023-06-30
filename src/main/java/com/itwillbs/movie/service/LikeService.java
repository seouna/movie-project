package com.itwillbs.movie.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.movie.mapper.LikeMapper;

@Service
public class LikeService {
	
	@Autowired
	private LikeMapper mapper;
	
	public HashMap<String, String> findLike(HashMap<String, String> like) {
		return mapper.findLike(like);
	}
	
	public int insertLike(HashMap<String, String> like) {
		return mapper.insertLike(like);
	}
	public int deleteLike(HashMap<String, String> like) {
		return mapper.deleteLike(like);
	}
	
	public int updateLike(HashMap<String, String> like) {
		return mapper.updateLike(like);
	}
	public List<HashMap<String, String>> findLikeList(String id) {
		return mapper.findLikeList(id);
	}
	
}
