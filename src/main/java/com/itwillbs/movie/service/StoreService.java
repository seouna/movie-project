package com.itwillbs.movie.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.movie.mapper.MyBatisMapper;

@Service
public class StoreService {
	@Autowired
	private MyBatisMapper mapper;
	
	// 기프트 카드 조회
	public List<HashMap<String, String>> selectItem() {
		return mapper.selectGift();
	}
	// 팝콘,음료 조회
	public List<HashMap<String, String>> selectFood() {
		return mapper.selectFood();
	}
	
	// 메가 티켓 조회
	public List<HashMap<String, String>> selectTicket() {
		return mapper.selectTicket();
	}

	// 상품 조회
	public HashMap<String, String> selectCode(String item_code) {
		return mapper.selectCode(item_code);
	}
	
	// 회원 조회
	public HashMap<String, String> selectMemberId(String id) {
		return mapper.selectMemberId(id);
	}
	
	// 결제 내역 저장
	public int insertPay(HashMap<String, String> pay) {
		return mapper.insertPay(pay);
	}
	
	// 포인트 적립
	public int updatePoint(HashMap<String, String> point) {
		return mapper.updatePoint(point);
	}
	public String selectPoint(String id) {
		return mapper.selectPoint(id);
	}
	public int minusPoint(String id, String point) {
		return mapper.minusPoint(id, point);
	}
	public int insertPointTable(String id, String payPoint) {
		return mapper.insertPointTable(id, payPoint);
	}
	public HashMap<String, String> selectPayCode(String payCode) {
		return mapper.selectPayCode(payCode);
	}
	public int minusPointTable(String id, String point) {
		return mapper.minusPointTable(id, point);
	}
	public int payCount() {
		return mapper.payCount();
	}
	
	

}
