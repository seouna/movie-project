package com.itwillbs.movie.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MyBatisMapper {

//	int insertMember(HashMap<String, String> member);
	
	//회원가입-수정
//	int insertMember(MemberVO member);
	int insertMember(HashMap<String, String> member);
	
	// 로그인 확인
	HashMap<String, String> chekUser(HashMap<String, String> login);
	
	//회원목록조회
	List<HashMap<String, String>> selectMember();
	
	// 회원 조회
	HashMap<String, String> selectMemberId(String id);
	
	
	// ----------------------------------------------------------------------------------------
	
	// 관리자 상품 등록
	int registItem(HashMap<String, String> item);
	
	// 관리자 상품 목록
	List<HashMap<String, String>> selectItem(@Param("searchType") String searchType,@Param("searchKeyword") String searchKeyword);
	
	// 관리자 상품 삭제
	int deleteItem(String item_code);
	
	// 관리자 상품 수정
	int updateItem(HashMap<String, String> item);
	
	// 관리자 결제 조회
	List<HashMap<String, String>> selectPay(@Param("searchType") String searchType,@Param("searchKeyword") String searchKeyword);
	
	// ----------------------------------------------------------------------------------------
	
	// 스토어 기프트카드 조회
	List<HashMap<String, String>> selectGift();
	
	List<HashMap<String, String>> selectFood();
	
	List<HashMap<String, String>> selectTicket();
	
	// 스토어 상세페이지 조회(상품 코드로)
	HashMap<String, String> selectCode(String item_code);
	
	// 스토어 결제 입력
	int insertPay(HashMap<String, String> pay);
	
	// 스토어 결제 후 포인트 적립
	int updatePoint(HashMap<String, String> point);

	int payDelete(String pay_code);

	HashMap<String, String> selectPayUpdate(String pay_code);

	int payUpdate(HashMap<String, String> pay);

	//메인화면 핫상품 3개 보여주기 
	List<HashMap<String, String>> selectHot();

	HashMap<String, String> selectKakao(String email);
	
	// 아이디 조회
	HashMap<String, String> findId(HashMap<String, String> member);

	int renewPw(HashMap<String, String> member);

	int insertPoint(String id);
	
	// 회원가입 아이디 조회
	HashMap<String, String> checkId(String id);

	HashMap<String, String> phoneCheck(HashMap<String, String> member);

	String selectPoint(String id);
	// 페이징처리한 회원목록
	List<HashMap<String, String>> selectMember(@Param("startRow") int startRow,@Param("listLimit") int listLimit,@Param("searchKeyword") String searchKeyword);
	int selectMemberListCount(@Param("searchKeyword") String searchKeyword);

	//
	int minusPoint(@Param("id") String id, @Param("point") String point);

	//
	int insertPointTable(@Param("id") String id,@Param("payPoint") String payPoint);

	//회원수
	int memberCount();
	
	//메인 공지사항1개
	HashMap<String, String> mainNotice();

	//리뷰가져오기
	List<HashMap<String, String>> selectReview();

	HashMap<String, String> selectPayCode(String payCode);
	
	// 포인트 테이블 차감
	int minusPointTable(@Param("id") String id,@Param("point") String point);

	int payCount();


	
	// ------------------------------------------------------------------------------------------
	




	

	
	
}














