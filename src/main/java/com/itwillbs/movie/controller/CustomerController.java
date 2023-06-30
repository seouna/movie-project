package com.itwillbs.movie.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.movie.service.BoardService;
import com.itwillbs.movie.service.MovieRegisterService;
import com.itwillbs.movie.service.StoreService;
import com.mysql.cj.xdevapi.JsonArray;

@Controller
public class CustomerController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private MovieRegisterService movieRegisterService;
	@Autowired
	private StoreService storeService;
	
	
	// 고객센터 홈
	@RequestMapping(value = "cc_home", method = {RequestMethod.GET, RequestMethod.POST})
	public String ccHome(@RequestParam HashMap<String, String> map, Model model) {
		System.out.println("cc_home : " + map); // 지금 비어있는 상태
		// startNum 이 null 이거나 "" 인경우 map에 처음과 끝 번호 저장 그렇지 않으면 지정된 값 사용
		if(map.get("startNum") == null || "".equals(map.get("startNum"))) {
			map.put("startNum", "0");
			map.put("endNum", "5");
		}
		// 목록이라 List에 저장 select notice 해온거 저장
		List<HashMap<String, String>> noticeBoardList = boardService.getNoticeBoardList(map);
		// select faq 해온거 저장
		List<HashMap<String, String>> faqBoardList = boardService.getFaqBoardList(map);
		model.addAttribute("noticeBoardList", noticeBoardList);
		model.addAttribute("faqBoardList", faqBoardList);
		System.out.println("고객센터 홈 " + model);	// model 에 저장
		return "customer_center/cc_home";
	}
	
	// 공지사항 목록
	@RequestMapping(value = "notice_board", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeBoard(@RequestParam HashMap<String, String> map, Model model) {
		if(map.get("startNum") == null || "".equals(map.get("startNum"))) {
			map.put("pageNum", "1");
			map.put("startNum", "0");
			map.put("endNum", "10");
		} // map 에 번호만 들어 있음
		// 공지 목록 List에 저장
		List<HashMap<String, String>> noticeBoardList = boardService.getNoticeBoardList(map);
		if(noticeBoardList.size() > 0) {	// List 존재시 목록 카운트 한 값 저장
			HashMap<String, String> countMap = noticeBoardList.get(0);
			map.put("totalCnt", String.valueOf(countMap.get("totalCnt")));
		}
		List<HashMap<String, String>> cinemaList = movieRegisterService.selectCinema();
		model.addAttribute("cinemaList",cinemaList);
		model.addAttribute("paramMap", map);//paramMap={pageNum=1, startNum=0, endNum=10, totalCnt=17}
		model.addAttribute("noticeBoardList", noticeBoardList);
		System.out.println("noticeBoard 컨트롤러" + model);
		
		return "customer_center/notice_board";
	}
	
	// 공지사항 상세
	@RequestMapping(value = "notice_detail", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeDetail(@RequestParam HashMap<String, String> map, Model model) {
		model.addAttribute("paramMap", map);
		System.out.println("noticeDetail:"+map);//noticeDetail:{notice_code=17, prevNum=0, nextNum16=}
		map = boardService.getNoticeDetail(map);
		model.addAttribute("map", map);
		
//			List<BoardVO> lostBoardList = boardService.getLostBoardList();
//			model.addAttribute("lostBoardList", lostBoardList);
		
		System.out.println("공지사항 상세 " + model);
		
		return "customer_center/notice_detail";
	}

	// 자주묻는 질문
	@RequestMapping(value = "faq", method = {RequestMethod.GET, RequestMethod.POST})
	public String faq(@RequestParam HashMap<String, String> map, Model model) {
		System.out.println(map);
		if(map.get("startNum") == null || "".equals(map.get("startNum"))) {
			map.put("pageNum", "1");
			map.put("startNum", "0");
			map.put("endNum", "10");
		}
		System.out.println(map);
		List<HashMap<String, String>> faqBoardList = boardService.getFaqBoardList(map);
		if(faqBoardList.size()>0) {
			HashMap<String, String> countMap = faqBoardList.get(0);
			map.put("totalCnt",String.valueOf(countMap.get("totalCnt")));
		}
		model.addAttribute("paramMap", map);	// paramMap 이름으로 model에 저장
		model.addAttribute("faqBoardList", faqBoardList);
		
		System.out.println("faq 컨트롤러" + model);
		
		return "customer_center/faq";
	}
	
	// 자주묻는 질문 상세
	@RequestMapping(value = "faq_detail", method = {RequestMethod.GET, RequestMethod.POST})
	public String faqDetail(@RequestParam HashMap<String, String> map, Model model) {
		// map faq_code 들어있음
		map = boardService.getFaqDetail(map);
		model.addAttribute("map", map);
		return "customer_center/faq_detail";
	}
	
	// 분실물 문의 페이지 목록
	@RequestMapping(value = "lost_board", method = {RequestMethod.GET, RequestMethod.POST})
	public String lostBoard(@RequestParam HashMap<String, String> map, HttpServletResponse response , Model model) {
		response.setCharacterEncoding("UTF-8");
		
		
		if(map.get("startNum") == null || "".equals(map.get("startNum"))) {
			map.put("pageNum", "1");
			map.put("startNum", "0");
			map.put("endNum", "10");
		}
		List<HashMap<String, String>> lostBoardList = boardService.getLostBoardList(map);
		if(lostBoardList.size() > 0) {
			HashMap<String, String> countMap = lostBoardList.get(0);
			map.put("totalCnt", String.valueOf(countMap.get("totalCnt")));
		}
		List<HashMap<String, String>> cinemaList = movieRegisterService.selectCinema();
		model.addAttribute("cinemaList",cinemaList);
		model.addAttribute("paramMap", map);
		model.addAttribute("lostBoardList", lostBoardList);
		System.out.println("lostBoard 컨트롤러" + model);
		
		return "customer_center/lost_board";
	}
	
	// 분실물 문의 페이지 목록 -> 비밀번호 조회
	@ResponseBody	
	@RequestMapping(value = "lostDetailPro", method = {RequestMethod.GET, RequestMethod.POST})
		public boolean lostDetailPro(@RequestParam HashMap<String, String> map, HttpServletResponse response , Model model) {
			response.setCharacterEncoding("UTF-8");
			List<HashMap<String, String>> isCorrect = boardService.checkLostPasswd(map);
			List<HashMap<String, String>> lostBoardList = null;
			System.out.println("=====lostDetail" + isCorrect);
			System.out.println(isCorrect.isEmpty());
			if(!isCorrect.isEmpty()) {
				if(map.get("startNum") == null || "".equals(map.get("startNum"))) {
					map.put("pageNum", "1");
					map.put("startNum", "0");
					map.put("endNum", "10");
				}
				
				// 글 번호
				lostBoardList = boardService.getLostBoardList(map);
				if(lostBoardList.size() > 0) {
					HashMap<String, String> countMap = lostBoardList.get(0);
					map.put("totalCnt", String.valueOf(countMap.get("totalCnt")));
				}
				List<HashMap<String, String>> cinemaList = movieRegisterService.selectCinema();
				model.addAttribute("cinemaList",cinemaList);
				model.addAttribute("paramMap", map);
				model.addAttribute("lostBoardList", lostBoardList);
				
				
//				model.addAttribute("cinemaDetailJson", cinemaDetailJson);
				
				
			}
//			JSONArray arr = new JSONArray(lostBoardList);
//			return arr.toString();
			
			return !isCorrect.isEmpty();
		}
	
	
	// 분실물 문의 등록페이지
	@RequestMapping(value = "lost_form", method = {RequestMethod.GET, RequestMethod.POST})
	public String lostForm(HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		if(id != null) {
			HashMap<String, String> member = storeService.selectMemberId(id);
			model.addAttribute("member", member);
		}
		
		List<HashMap<String, String>> cinemaList = movieRegisterService.selectCinema();
		model.addAttribute("cinemaList",cinemaList);
		
		return "customer_center/lost_form";
	}
	
	// 분실물 문의 등록
	@PostMapping(value = "/lostWritePro")
	public String lostWritePro(@RequestParam HashMap<String, String> map, Model model) {
		int insertCount = boardService.registLostBoard(map);
		model.addAttribute("map", map);
		if(insertCount > 0) {
			
			return "redirect:/lost_board";
		} 
		else {
			model.addAttribute("msg", "등록 실패");
			return "fail_back";
		}
	}
	
	// 분실물 상세
	@RequestMapping(value = "lost_detail", method = {RequestMethod.GET, RequestMethod.POST})
	public String lostDetail(@RequestParam HashMap<String, String> map, Model model) {
		
		map = boardService.getLostDetail(map);
		model.addAttribute("map", map);
		
		return "customer_center/lost_detail";
	}
	
	// 분실물 삭제
	@RequestMapping(value = "lost_deletePro", method = {RequestMethod.GET, RequestMethod.POST})
	public String lostDeletePro(@RequestParam HashMap<String, String> map, Model model) {
		int deleteCount = boardService.getLostDelete(map);
		System.out.println(deleteCount);
		if(deleteCount > 0) {
			return "redirect:/lost_board";
		} else {
			model.addAttribute("msg", "삭제 실패!");
			return "fail_back";
		}
	}
	
	// 1:1 문의
	@RequestMapping(value = "oneOnOne", method = {RequestMethod.GET, RequestMethod.POST})
	public String oneOnOne(HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		if(id != null) {
			HashMap<String, String> member = storeService.selectMemberId(id);
			model.addAttribute("member", member);
		}
		
		List<HashMap<String, String>> cinemaList = movieRegisterService.selectCinema();
		model.addAttribute("cinemaList",cinemaList);
		return "customer_center/oneOnOne";
	}
	
	// 1:1 문의 등록
	@RequestMapping(value = "oneWritePro", method = {RequestMethod.GET, RequestMethod.POST})
	public String oneWritePro(@RequestParam HashMap<String, String> map, Model model) {
		System.out.println("controller: " + map);
		int insertCount = boardService.registOneBoard(map);
		if(insertCount > 0) {
			model.addAttribute("memberName", map.get("one_name"));
			model.addAttribute("memberEmail", map.get("one_email"));
			model.addAttribute("memberTel", map.get("one_tel"));
			System.out.println("1:1 문의 등록 모델" + model);
			return "redirect:/one_list";
		} 
		else {
			model.addAttribute("msg", "등록 실패");
			return "fail_back";
		}
	}
	
	// 내가 문의한 내용 목록
	@RequestMapping(value = "one_list", method = {RequestMethod.GET, RequestMethod.POST})
	public String oneList(@RequestParam HashMap<String, String> map, HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		System.out.println("one_list 시작 map : " + map);
//		if(id == null || "".equals(id) || map.isEmpty()) {
//			model.addAttribute("msg", "잘못된 접근입니다.");
//			return "fail_back";
//		}
		if(id != null && !id.equals("")) {
			HashMap<String, String> member = storeService.selectMemberId(id);
			model.addAttribute("paramMap", member);
			map.put("memberName", member.get("member_name")); 
			map.put("memberTel", member.get("member_tel"));
			map.put("memberEmail", member.get("member_email"));
		}
		
		if(map.get("startNum") == null || "".equals(map.get("startNum"))) {
			map.put("pageNum", "1");
			map.put("startNum", "0");
			map.put("endNum", "10");
		}
		List<HashMap<String, String>> oneBoardList = boardService.getBoardList(map);
		if(oneBoardList.size()>0) {
			HashMap<String, String> countMap = oneBoardList.get(0);
			map.put("totalCnt",String.valueOf(countMap.get("totalCnt")));
		}
		System.out.println("paramMap " + model.getAttribute("paramMap"));	// ID있을떄 !null, id없을때 null
		model.addAttribute("paramMap", map);
		model.addAttribute("oneBoardList", oneBoardList);
		System.out.println("oneList 컨트롤러" + model);
		
		
		return "customer_center/one_list";
	}
	
	
	// 내가 문의한 페이지 목록 -> 비밀번호 조회
	@ResponseBody	
	@RequestMapping(value = "one_detail_pro", method = {RequestMethod.GET, RequestMethod.POST})
	public boolean oneDetailPro(@RequestParam HashMap<String, String> map, HttpServletResponse response , Model model) {
//		response.setCharacterEncoding("UTF-8");
		
		model.addAttribute("map", map);
		System.out.println("-==================================="+map);
		List<HashMap<String, String>> isCorrect = boardService.checkOnePasswd(map);
		List<HashMap<String, String>> oneBoardList = null;
		System.out.println("=====문의 목록" + isCorrect);
		System.out.println(!isCorrect.isEmpty());
		
		
		if(!isCorrect.isEmpty()) {
			
			// 글 번호
			oneBoardList = boardService.getBoardList(map);
			if(oneBoardList.size() > 0) {
				HashMap<String, String> countMap = oneBoardList.get(0);
				map.put("totalCnt", String.valueOf(countMap.get("totalCnt")));
			}
			List<HashMap<String, String>> cinemaList = movieRegisterService.selectCinema();
			model.addAttribute("cinemaList",cinemaList);
			model.addAttribute("paramMap", map);
			
			model.addAttribute("oneBoardList", oneBoardList);
			System.out.println("문의 프로 map" + map);
			System.out.println("문의 프로 oneBoardLiost" + oneBoardList);
			System.out.println(model);
//					model.addAttribute("cinemaDetailJson", cinemaDetailJson);
		}
//		JSONArray arr = new JSONArray(oneBoardList);
//		return arr.toString();
		return !isCorrect.isEmpty();
	}
	
	
	// 내가 문의한 내역 상세
	@RequestMapping(value = "one_detail", method = {RequestMethod.GET, RequestMethod.POST})
	public String oneDetail(@RequestParam HashMap<String, String> map, Model model) {
		model.addAttribute("paramMap", map);
		map = boardService.getDetail(map);
		model.addAttribute("map", map);
		System.out.println("내가 문의 상세 컨트롤러" + model);
		
		return "customer_center/one_detail";
	}
	
	// 내가 문의한 내역 삭제
	@RequestMapping(value = "one_deletePro", method = {RequestMethod.GET, RequestMethod.POST})
	public String oneDeletePro(@RequestParam HashMap<String, String> map, Model model) {
		System.out.println("문의 내역 삭제 전" + map);
		model.addAttribute("map", map);
		int deleteCount = boardService.getDelete(map);
		System.out.println(deleteCount);
		if(deleteCount > 0) {
			model.addAttribute("memberName", map.get("memberName"));
			model.addAttribute("memberEmail", map.get("memberEmail"));
			model.addAttribute("memberTel", map.get("memberTel"));
			System.out.println("문의 상세 삭제" + model);
			return "redirect:/one_list";
		} else {
			model.addAttribute("msg", "삭제 실패!");
			return "fail_back";
		}
	}
	
//	// 비회원문의내역
//	@RequestMapping(value = "guest_board", method = {RequestMethod.GET, RequestMethod.POST})
//	public String guestBoard() {
//		return "customer_center/guest_board";
//	}
	// 비회원문의확인
	@RequestMapping(value = "guest_confirm", method = {RequestMethod.GET, RequestMethod.POST})
	public String guestConfirm(HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		if(id != null) {
			HashMap<String, String> member = storeService.selectMemberId(id);
			model.addAttribute("member", member);
		}
		return "customer_center/guest_confirm";
	}
	
	
	//관리자게시판============================================================================================
	
	// 관리자 공지사항 목록
	@RequestMapping(value = "admin_notice_board", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminNoticeBoard(@RequestParam HashMap<String, String> map, Model model) {
		
		if(map.get("startNum") == null || "".equals(map.get("startNum"))) {
			map.put("pageNum", "1");
			map.put("startNum", "0");
			map.put("endNum", "10");
		}
		List<HashMap<String, String>> noticeBoardList = boardService.getNoticeBoardList(map);
		if(noticeBoardList.size() > 0) {
			HashMap<String, String> countMap = noticeBoardList.get(0);
			map.put("totalCnt", String.valueOf(countMap.get("totalCnt")));
		}
		List<HashMap<String, String>> cinemaList = movieRegisterService.selectCinema();
		model.addAttribute("cinemaList",cinemaList);
		model.addAttribute("paramMap", map);
		model.addAttribute("noticeBoardList", noticeBoardList);
		System.out.println("noticeBoard 컨트롤러" + model);
		
		return "admin/admin_notice_board";
	}

	// 관리자 공지 등록
	@RequestMapping(value = "notice_register_pro", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeRegisterPro(@RequestParam HashMap<String, String> map, Model model) {
		
		int insertCount = boardService.registNoticeBoard(map);
		System.out.println("여기" + map);
		List<HashMap<String, String>> cinemaList = movieRegisterService.selectCinema();
		model.addAttribute("cinemaList",cinemaList);
		System.out.println(model);
		if(insertCount > 0) {
			return "redirect:/admin_notice_board";
		} else {
			model.addAttribute("msg", "등록 실패!");
			return "fail_back";
		}
	}
	
	// 관리자 공지 수정창
	@RequestMapping(value = "admin_notice_update", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminNoticeUpdate(@RequestParam String notice_code, Model model) {
		
		HashMap<String, String> noticeBoard = boardService.getNoticeBoard(notice_code);
		System.out.println(noticeBoard);
		model.addAttribute("noticeBoard", noticeBoard);
		List<HashMap<String, String>> cinemaList = movieRegisterService.selectCinema();
		model.addAttribute("cinemaList",cinemaList);
		System.out.println(model);
		return "admin/admin_notice_update";
	}
	
	// 관리자 공지 수정
	@RequestMapping(value = "notice_update_pro", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeUpdatePro(@RequestParam HashMap<String, String> map, Model model) {
		int updateCount = boardService.registNoticeUpdate(map);
		System.out.println(updateCount);
		if(updateCount > 0) {
			return "redirect:/admin_notice_board";
		} else {
			model.addAttribute("msg", "수정 실패!");
			return "fail_back";
		}
	}
	
	// 공지사항 삭제
	@RequestMapping(value = "notice_delete_pro", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeDeletePro(@RequestParam HashMap<String, String> map, Model model) {
		int deleteCount = boardService.getNoticeDelete(map);
		System.out.println(deleteCount);
		if(deleteCount > 0) {
			return "redirect:/admin_notice_board";
		} else {
			model.addAttribute("msg", "삭제 실패!");
			return "fail_back";
		}
		
	}
	
	// 관리자 자주묻는 질문 목록
	@RequestMapping(value = "admin_faq", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminFaq(@RequestParam HashMap<String, String> map, Model model) {
		
		System.out.println(map);
		if(map.get("startNum") == null || "".equals(map.get("startNum"))) {
			map.put("pageNum", "1");
			map.put("startNum", "0");
			map.put("endNum", "10");
		}
		System.out.println(map);
		List<HashMap<String, String>> faqBoardList = boardService.getFaqBoardList(map);
		if(faqBoardList.size()>0) {
			HashMap<String, String> countMap = faqBoardList.get(0);
			map.put("totalCnt",String.valueOf(countMap.get("totalCnt")));
		}
		model.addAttribute("paramMap", map);
		model.addAttribute("faqBoardList", faqBoardList);
		
		System.out.println("faq 컨트롤러" + model);
		
		return "admin/admin_faq";
	}
	
	// 관리자 자주 묻는 질문 등록
	@RequestMapping(value = "faq_register_pro", method = {RequestMethod.GET, RequestMethod.POST})
	public String faqRegisterPro(@RequestParam HashMap<String, String> map, Model model) {
		
		int insertCount = boardService.registFaqBoard(map);
		if(insertCount > 0) {
			return "redirect:/admin_faq";
		} else {
			model.addAttribute("msg", "등록 실패!");
			return "fail_back";
		}
	}
	
	// 관리자 자주묻는 질문 수정창
	@RequestMapping(value = "admin_faq_update", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminFaqUpdate(@RequestParam String faq_code, Model model) {
		
		HashMap<String, String> faqBoard = boardService.getFaqBoard(faq_code);
		System.out.println(faqBoard);
		model.addAttribute("faqBoard", faqBoard);
		System.out.println(model);
		return "admin/admin_faq_update";
	}
	
	// 관리자 자주묻는 질문 수정
	@RequestMapping(value = "faq_update_pro", method = {RequestMethod.GET, RequestMethod.POST})
	public String faqUpdatePro(@RequestParam HashMap<String, String> map, Model model) {
		int updateCount = boardService.registFaqUpdate(map);
		System.out.println(updateCount);
		if(updateCount > 0) {
			return "redirect:/admin_faq";
		} else {
			model.addAttribute("msg", "수정 실패!");
			return "fail_back";
		}
	}
	
	// 관리자 자주묻는 질문 삭제
	@RequestMapping(value = "faq_delete_pro", method = {RequestMethod.GET, RequestMethod.POST})
	public String faqDeletePro(@RequestParam HashMap<String, String> map, Model model) {
		int deleteCount = boardService.getFaqDelete(map);
		System.out.println(deleteCount);
		if(deleteCount > 0) {
			return "redirect:/admin_faq";
		} else {
			model.addAttribute("msg", "삭제 실패!");
			return "fail_back";
		}
	}
	
	// 관리자 분실물 문의 페이지
	@RequestMapping(value = "admin_lost_board", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminLostBoard(@RequestParam HashMap<String, String> map, Model model) {
		
		if(map.get("startNum") == null || "".equals(map.get("startNum"))) {
			map.put("pageNum", "1");
			map.put("startNum", "0");
			map.put("endNum", "10");
		}
		List<HashMap<String, String>> lostBoardList = boardService.getLostBoardList(map);
		System.out.println(lostBoardList);
		if(lostBoardList.size() > 0) {
			HashMap<String, String> countMap = lostBoardList.get(0);
			map.put("totalCnt", String.valueOf(countMap.get("totalCnt")));
		}
		List<HashMap<String, String>> cinemaList = movieRegisterService.selectCinema();
		model.addAttribute("cinemaList",cinemaList);
		model.addAttribute("paramMap", map);
		model.addAttribute("lostBoardList", lostBoardList);
		System.out.println("lostBoardList 컨트롤러" + model);
		
		return "admin/admin_lost_board";
	}
	
	// 분실물 답변 등록창
	@RequestMapping(value = "admin_lost_rep", method = {RequestMethod.GET, RequestMethod.POST})
	public String admin_lost_rep(@RequestParam String lost_code, Model model) {
		
		HashMap<String, String> lostBoard = boardService.getLostBoard(lost_code);
		System.out.println(lostBoard);
		model.addAttribute("lostBoard", lostBoard);
		System.out.println(model);
		return "admin/admin_lost_rep";
	}
	
	// 관리자 분실물 답변 등록
	@RequestMapping(value = "lost_update_pro", method = {RequestMethod.GET, RequestMethod.POST})
	public String lost_update_pro(@RequestParam HashMap<String, String> map, Model model) {
		int updateCount = boardService.registLostUpdate(map);
		System.out.println(updateCount);
		if(updateCount > 0) {
			return "redirect:/admin_lost_board";
		} else {
			model.addAttribute("msg", "수정 실패!");
			return "fail_back";
		}
	}
	
	// 관리자 분실물 삭제
	@RequestMapping(value = "lost_delete_pro", method = {RequestMethod.GET, RequestMethod.POST})
	public String lostAdminDeletePro(@RequestParam HashMap<String, String> map, Model model) {
		int deleteCount = boardService.getLostDelete(map);
		System.out.println(deleteCount);
		if(deleteCount > 0) {
			return "redirect:/admin_lost_board";
		} else {
			model.addAttribute("msg", "삭제 실패!");
			return "fail_back";
		}
	}	
	
//	//분실물 문의
//	@RequestMapping(value = "admin_lost_board", method = {RequestMethod.GET, RequestMethod.POST})
//	public String adminLostBoard() {
//		return "admin/admin_lost_board";
//	}
	
//	//1대1 문의
//	@RequestMapping(value = "admin_oneOnOne", method = {RequestMethod.GET, RequestMethod.POST})
//	public String adminOneOnOne() {
//		return "admin/admin_oneOnOne";
//	}
	// 관리자 1:1 문의 목록
	@RequestMapping(value = "admin_oneOnOne", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminOneOnOne(@RequestParam HashMap<String, String> map, Model model) {
		if(map.get("startNum") == null || "".equals(map.get("startNum"))) {
			map.put("pageNum", "1");
			map.put("startNum", "0");
			map.put("endNum", "10");
		}
		List<HashMap<String, String>> oneBoardList = boardService.getOneBoardList(map);
		System.out.println(oneBoardList);
		if(oneBoardList.size() > 0) {
			HashMap<String, String> countMap = oneBoardList.get(0);
			map.put("totalCnt", String.valueOf(countMap.get("totalCnt")));
		}
		List<HashMap<String, String>> cinemaList = movieRegisterService.selectCinema();
		model.addAttribute("cinemaList",cinemaList);
		model.addAttribute("paramMap", map);
		model.addAttribute("oneBoardList", oneBoardList);
		System.out.println("oneBoardList 컨트롤러" + model);
		
		return "admin/admin_oneOnOne";
	}
	
	// 관리자 1:1 답변 등록창
	@RequestMapping(value = "admin_one_rep", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminOneRep(@RequestParam String one_code, Model model) {
		
		HashMap<String, String> oneBoard = boardService.getOneBoard(one_code);
		System.out.println(oneBoard);
		model.addAttribute("oneBoard", oneBoard);
		List<HashMap<String, String>> cinemaList = movieRegisterService.selectCinema();
		model.addAttribute("cinemaList",cinemaList);
		System.out.println(model);
		return "admin/admin_one_rep";
	}
	
	// 관리자 1:1 답변 등록
	@RequestMapping(value = "one_update_pro", method = {RequestMethod.GET, RequestMethod.POST})
	public String oneUpdatePro(@RequestParam HashMap<String, String> map, Model model) {
		int updateCount = boardService.registOneUpdate(map);
		System.out.println(updateCount);
		if(updateCount > 0) {
			return "redirect:/admin_oneOnOne";
		} else {
			model.addAttribute("msg", "수정 실패!");
			return "fail_back";
		}
	}
	
	// 관리자 1:1 삭제
	@RequestMapping(value = "one_delete_pro", method = {RequestMethod.GET, RequestMethod.POST})
	public String oneAdminDeletePro(@RequestParam HashMap<String, String> map, Model model) {
		int deleteCount = boardService.getOneDelete(map);
		System.out.println(deleteCount);
		if(deleteCount > 0) {
			return "redirect:/admin_oneOnOne";
		} else {
			model.addAttribute("msg", "삭제 실패!");
			return "fail_back";
		}
	}	
	
	// 관리자 비회원 문의내역
	@RequestMapping(value = "admin_guest_board", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminGuestBoard() {
		return "admin/admin_guest_board";
	}
	
		
	
	
	
}
