package com.itwillbs.movie.service;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.movie.mapper.MyBatisMapper;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberService {
	
	@Autowired
	private MyBatisMapper mapper;

	//회원추가
//	public int insertMember(HashMap<String, String> member) {
//		return mapper.insertMember(member);
//	}
	//로그인
	public HashMap<String, String> checkUser(HashMap<String, String> login) {
		return mapper.chekUser(login);
	}
	
	//회원목록조회
//	public List<HashMap<String, String>> selectMember() {
//		return mapper.selectMember();
//	}
	public List<HashMap<String, String>> selectMember() {
		return mapper.selectMember();
	}
	//페이징
	public List<HashMap<String, String>> selectMember(int startRow,int listLimit,String searchKeyword) {
		return mapper.selectMember(startRow, listLimit,searchKeyword);
	}

	//회원추가수정
//	public int registMember(MemberVO member) {
//		return mapper.insertMember(member);
//	}
	public int registMember(HashMap<String, String> member) {
		// TODO Auto-generated method stub
		return mapper.insertMember(member);
	}
	//최신 핫상품 (3개)보여주기
	public List<HashMap<String, String>> selectHotItem() {
		return mapper.selectHot();
	}
	
	// 카카오 회원 확인
	public HashMap<String, String> kakaoMember(String email) {
		return mapper.selectKakao(email);
	}
	
	// 아이디 조회
	public HashMap<String, String> findId(HashMap<String, String> member) {
		return mapper.findId(member);
	}
	
	// 비밀번호 재설정
	public int renewPw(HashMap<String, String> member) {
		return mapper.renewPw(member);
	}

	public int insertPoint(String id) {
		return mapper.insertPoint(id);
	}
	
	// SMS 인증
	public void certifiedPhoneNumber(String phone, int randomNumber) {
		String api_key = "NCSQU2TAT8POKQ76";
	    String api_secret = "N5KAV8MZDEGWQZYSQGJI27HQIQLB06VH";
	    Message coolsms = new Message(api_key, api_secret);

	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phone);    // 수신전화번호
	    params.put("from", "01076110230");    // 발신전화번호
	    params.put("type", "SMS");
	    params.put("text", "[아이무비] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); 

	    try {
	        JSONObject obj = (JSONObject)coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
		
	}
	
	// 아이디 검증.
	public HashMap<String, String> checkId(String id) {
		return mapper.checkId(id);
	}
	
	// 비밀번호 찾기 회원 인증.
	public HashMap<String, String> phoneCheck(HashMap<String, String> member) {
		return mapper.phoneCheck(member);
	}

//	public List<HashMap<String, String>> selectMember(int startRow, int listLimit,String searchKeyword) {
//		return mapper.selectMember(startRow,listLimit,searchKeyword);
//	}

	//회원 이름검색
	public int getMemberListCount(String searchKeyword) {
		return mapper.selectMemberListCount(searchKeyword);
	}

	//회원수
	public int selectMemCount() {
		return mapper.memberCount();
	}
	//메인 공지사항 1개
	public HashMap<String, String> selectNotice() {
		return mapper.mainNotice();
	}

	//리뷰가져오기
	public List<HashMap<String, String>> selectReview() {
		System.out.println("==================selectReviewselectReviewselectReview=========================");
		return mapper.selectReview();
	}


	
}
