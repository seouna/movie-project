package com.itwillbs.movie.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.itwillbs.movie.service.BoardService;
import com.itwillbs.movie.service.MypageService;
import com.itwillbs.movie.vo.MemberVO;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService service;
	@Autowired
	private BoardService boardService;

	//예매내역
	@GetMapping(value = "mypageR")
	public String mypageR(HttpSession session, MemberVO member, Model model) {
		String id = (String)session.getAttribute("sId");
		
		if(id ==null) {
			return "redirect:/memLogin";
		}
		
		List<HashMap<String, String>> movieList = service.movieList(id);
		model.addAttribute("movieList",movieList);
		
		List<HashMap<String, String>> likeList = service.likeList(id);
		model.addAttribute("likeList",likeList);
		
		List<HashMap<String,String>> resList = service.resList(id);
		model.addAttribute("resList", resList);
		
		member= service.getMemberInfo(id);
		model.addAttribute("member", member);
		
		return "mypage/mypage_rsv_form";
	} 
	
	// 원하는 년, 월 선택시 해당 예매 내역 리스트 보기 
	@ResponseBody	
	@RequestMapping(value = "mypageRlist",produces = "application/json; charset=utf8",method = {RequestMethod.GET, RequestMethod.POST})
	public String mypageR(HttpSession session, MemberVO member, Model model,
	                       @RequestParam(name = "year") int year,
	                       @RequestParam(name = "month") int month) throws JsonProcessingException {
	   
		String id = (String) session.getAttribute("sId");



	    List<HashMap<String, String>> resList = service.resListByDate(id, year, month);
	    
	    JSONArray ja = new JSONArray(resList);
	    System.out.println(ja.toString());
	    
		
		
	   return ja.toString();

	}


	
	//포인트조회
	@GetMapping(value = "mypageP")
	public String mypageP(HttpSession session, MemberVO member, Model model) {
		String id = (String)session.getAttribute("sId");
		
		List<HashMap<String, String>> movieList = service.movieList(id);
		model.addAttribute("movieList",movieList);
		
		List<HashMap<String, String>> likeList = service.likeList(id);
		model.addAttribute("likeList",likeList);
		
		List<HashMap<String, String>> pointList = service.pointList(id);
		model.addAttribute("pointList", pointList);
		
		member= service.getMemberInfo(id);
		model.addAttribute("member", member);
		
		return "mypage/mypage_point_form";
		
	} 
	 
	//스토어구매내역
	@GetMapping(value = "mypageS")
	public String mypageS(HttpSession session, MemberVO member, Model model) {
		String id = (String)session.getAttribute("sId");
		
		List<HashMap<String, String>> movieList = service.movieList(id);
		model.addAttribute("movieList",movieList);
		
		List<HashMap<String, String>> likeList = service.likeList(id);
		model.addAttribute("likeList",likeList);
		
		List<HashMap<String,String>> payList = service.payList(id);
		model.addAttribute("payList", payList);
		
		
		
		member= service.getMemberInfo(id);
		model.addAttribute("member", member);
		
		return "mypage/mypage_store_form";
	}
	
	//내가올린질문
	@GetMapping(value = "mypageQ")
	public String mypageQ(HttpSession session, MemberVO member, Model model, @RequestParam HashMap<String, String> map) {
		String id = (String)session.getAttribute("sId");
		
		
		List<HashMap<String, String>> movieList = service.movieList(id);
		model.addAttribute("movieList",movieList);
		
		List<HashMap<String, String>> likeList = service.likeList(id);
		model.addAttribute("likeList",likeList);
		
		member= service.getMemberInfo(id);
		model.addAttribute("member", member);
		
		// 내가쓴 글 조회시 이름,이메일, 전화번호값 필요

		map.put("memberName", member.getMember_name());
		
		map.put("memberEmail", member.getMember_email());
		
		map.put("memberTel", member.getMember_tel());
		
		
		List<HashMap<String, String>> oneBoardList = boardService.getBoardList(map);
		
		if(oneBoardList.size()>0) {
			
			HashMap<String, String> countMap = oneBoardList.get(0);
			map.put("totalCnt",String.valueOf(countMap.get("totalCnt")));
			
		}
		
		model.addAttribute("paramMap", map);
		
		model.addAttribute("oneBoardList", oneBoardList);
		
		model.addAttribute("listCount", oneBoardList.size());
		
		return "mypage/mypage_qna_form";
	}
	
	
	//회원정보수정
	@GetMapping(value = "mypageI")
	public String mypageI(HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		
		List<HashMap<String, String>> cinemaList = service.cinemaList(id);
		model.addAttribute("cinemaList", cinemaList);
		
		
		if(id ==null) {
			
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
			
		}
		
		MemberVO member = service.getMemberInfo(id);
		model.addAttribute("member", member);
		
		return "mypage/mypage_info_form";
	}
	
	//회원정보수정
	@PostMapping(value = "updatePro")
	public String updatePro(@RequestParam HashMap<String, String> update, Model model, HttpSession session ) {
		String id = (String)session.getAttribute("sId");
		
		// 주소 저장시 '/' 으로 구분해서 저장
		String member_address = update.get("member_address1") + "/" + update.get("member_address2");
		
		update.put("member_address", member_address);
		
		if(id == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String Epasswd = service.getPasswd(id);
		
		// 회원정보 수정시 비밀번호 일치 확인
		if(Epasswd == null || !passwordEncoder.matches(update.get("member_pw"), Epasswd)) {
		
			model.addAttribute("msg", "비밀번호 확인이 필요합니다.");
			return "fail_back";
		}
		
		if(!update.get("member_pw2").equals("")) {
			update.put("member_pw2",passwordEncoder.encode(update.get("member_pw2")));
		}
		
		int updateCount = service.updateMemberInfo(update);
		
		if(updateCount > 0) {
			model.addAttribute("msg", "회원정보수정성공!");
			model.addAttribute("target", "mypageI");
			return "success";
			
		} else {
			model.addAttribute("msg", "회원정보수정 실패!");
			return "fail_back";
		}
		
		
	}
	
	//회원탈퇴
	@PostMapping(value = "quitPro")
	public String quitPro(@RequestParam HashMap<String, String> quit, HttpSession session, Model model ) {
		
		//세션아이디 저장
		String id = (String)session.getAttribute("sId");
		String password = quit.get("member_pw");
		
		//아이디와 일치하는 레코드의 패스워드 조회
		String dbPasswd = service.getPasswd(id);
		
		System.out.println("평문 암호 : " + password + ", 해싱 암호 : " + dbPasswd);
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		if(passwordEncoder.matches(password, dbPasswd)) {	
			int deleteCount = service.quitMember(quit);
			
			if(deleteCount > 0) {
				
				session.invalidate();
				model.addAttribute("msg", "탈퇴가 완료되었습니다!");
				model.addAttribute("target", "main");
				
				return "success";
			} else {
				
				model.addAttribute("msg", "탈퇴 실패!");
				return "fail_back";
				
			}
		
		} else {
			
			model.addAttribute("msg", "권한이 없습니다!");
			return "fail_back";
		
		}
		
	}
	
	
	
	//리뷰페이지
	@GetMapping(value = "mypageRv")
	public String mypageRv(HttpSession session, MemberVO member, Model model) {
		
		String id = (String)session.getAttribute("sId");
		member= service.getMemberInfo(id);
		
		List<HashMap<String, String>> movieList = service.movieList(id);
		model.addAttribute("movieList",movieList);
		
		List<HashMap<String, String>> likeList = service.likeList(id);
		model.addAttribute("likeList",likeList);
		
		List<HashMap<String, String>> revList = service.revList(id);
		model.addAttribute("revList",revList);
		
		HashMap<String, String> resMovie = service.resMovie(id);
		model.addAttribute("resMovie",resMovie);
		
		model.addAttribute("member", member);
		
		return "mypage/mypage_review_form";
		
	}

	
	@PostMapping(value="mypageRvPro")
	public String mypageRvPro(@RequestParam HashMap<String, String> review, HttpSession session,  Model model) {
		
		String id = (String)session.getAttribute("sId");
		review.put("id", id);
		
		// 리뷰 작성시 별점이나 후기글을 작성 하지 않으면 작성 실패!! 
		if (review.get("rev_rating") == null || review.get("rev_content") == null) {
			
		    model.addAttribute("msg", "리뷰 작성에 실패했습니다. 별점을 선택하고 리뷰를 작성하세요.");
		  
		    return "fail_back";
		    
		}

		HashMap<String,String> count = service.checkReview(id);
	    System.out.println(count);
	    // 이미 작성한 리뷰가 있다면 중복 등록 방지
	    
	    if (count != null) { 
	    	
	        model.addAttribute("msg", "이미 작성한 리뷰가 있습니다.");
	        
	        return "fail_back";
	    }
		
	    int insertCount = service.insertReview(review);
		
		if(insertCount > 0 ) {
			
			model.addAttribute("msg", "리뷰가 등록되고 500포인트가 적립되었습니다.");
			model.addAttribute("target", "mypageRv");
			
			//리뷰 등록시 포인트 등록 및 회원정보 포인트 업데이트
			service.insertPoint(id);
			service.updatePoint(id);

			return "success";
		
		} else {
			
			model.addAttribute("msg", "리뷰 등록 실패!");
			
			return "fail_back";
			
		}
		
		
	}
	
	@GetMapping(value="deleteReview")
	public String deleteReview(@RequestParam("rev_code")String rev_code, HttpSession session, Model model) {
	  
		String id = (String)session.getAttribute("sId");

	    int deleteCount = service.deleteReview(rev_code);
 
	    if (deleteCount > 0) {
	    	
	        model.addAttribute("msg", "리뷰가 삭제되었습니다.");
	        model.addAttribute("target", "mypageRv");
	        
	        //리뷰 삭제시 포인트 차감 및 회원정보 포인트 업데이트
	        service.removePoint(id); 
	        service.updatePoint(id);
	        
	        return "success";
	        
	    } else {
	    	
	        model.addAttribute("msg", "리뷰 삭제 실패!");
	        
	        return "fail_back";
	        
	    }
	    


	    
	}
	
	
	
	
	
	
}
