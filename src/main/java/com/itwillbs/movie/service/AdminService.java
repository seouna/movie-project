package com.itwillbs.movie.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.movie.mapper.MyBatisMapper;

@Service
public class AdminService {
	@Autowired
	private MyBatisMapper mapper;

	public int registItem(HashMap<String, String> item) {
		return mapper.registItem(item);
	}

	public List<HashMap<String, String>> selectItem(String searchType, String searchKeyword) {
		return mapper.selectItem(searchType, searchKeyword);
	}

	public int deleteItem(String item_code) {
		return mapper.deleteItem(item_code);
	}

	public int updateItem(HashMap<String, String> item) {
		return mapper.updateItem(item);
	}
	
	// 결제 내역 조회
	public List<HashMap<String, String>> selectPay(String searchType, String searchKeyword) {
		return mapper.selectPay(searchType, searchKeyword);
	}
	
	// 결제 내역 삭제
	public int payDelete(String pay_code) {
		return mapper.payDelete(pay_code);
	}
	
	// 결제 내역 조회(pay_code)
	public HashMap<String, String> selectPayUpdate(String pay_code) {
		return mapper.selectPayUpdate(pay_code);
	}
	// 결제 내역 수정
	public int updatePay(HashMap<String, String> pay) {
		return mapper.payUpdate(pay);
	}


}
