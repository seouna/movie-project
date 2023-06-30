package com.itwillbs.movie.controller;

import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.annotations.*;
import org.json.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.movie.service.*;
import com.itwillbs.movie.vo.*;

@Controller
public class ReservationController {
	@Autowired
	private ReservationService service;
	
	@Autowired
	private CinemaService cinemaService;
	
	
	// 비회원 예매 및 세션 저장
	@PostMapping("guestJoinPro")
	public String guestJoinPro(String guestName, String phone, String pass, HttpSession session) {
		
		// 현재 시스템(서버)에서 랜덤ID 값을 추출해서 id에 저장
		String uuid = UUID.randomUUID().toString();
		session.setAttribute("guestsId", uuid);
		
		int insertNonMember = service.insertNonMember(uuid, guestName, pass, phone);
		
		return "reservation/guest_join_success";
	}
	
	
	
	
	
	
	
	
	@GetMapping("reservation")
	public String reservation(Model model, String cd, HttpSession session) {
		String id = (String)session.getAttribute("sId");
		String guestsId = (String)session.getAttribute("guestsId");
		//지역
		List<HashMap<String, String>> location = cinemaService.location();
		model.addAttribute("location",location);
		
		// 극장
		List<HashMap<String, String>> cinema = service.selectCinema();
		model.addAttribute("cinema", cinema);
		
		// 영화상세정보
		List<HashMap<String, String>> movieInfo = service.selectMovieInfo();
		model.addAttribute("movieInfo", movieInfo);
		
		if(guestsId != null) {
			return "reservation/reservation";
		} else if (id == null) {
			model.addAttribute("msg", "로그인 후 이용가능합니다.");
			model.addAttribute("target", "memLogin");
			return "success";
		} else {
			return "reservation/reservation";
		}
		
		
		
	}
	
	// 영화리스트
	@ResponseBody
	@GetMapping("moviesList")
	public String moviesList(String CnItemCd) {
		
		List<HashMap<String, String>> moviesList = service.selectmoviesList(CnItemCd);
		
		JSONArray ja = new JSONArray(moviesList);
		
		return ja.toString();
	}
	
	// 선호 장르 영화리스트
	@ResponseBody
	@GetMapping("preferMoviesList")
	public String preferMoviesList(@Param("CnItemCd") String CnItemCd, HttpSession session) {
		String id = (String)session.getAttribute("sId");
		String preferGenre = service.selectMemberPreferGenre(id);
		
		List<HashMap<String, String>> preferMoviesList = service.selectPreferMoviesList(preferGenre, CnItemCd);
		
		JSONArray ja = new JSONArray(preferMoviesList);
		
		return ja.toString();
	}
	
	
	
	// 상영시간리스트
	@ResponseBody
	@GetMapping("movieTimeList")
	public String timeList(@Param("CnItemCd") String CnItemCd, @Param("MvItemCd") String MvItemCd, @Param("dateCd") String dateCd) {
		List<HashMap<String, String>> movieTimeList = service.selectMovieTimeList(CnItemCd, MvItemCd, dateCd);
		JSONArray ja = new JSONArray(movieTimeList);
		
		return ja.toString();
	}
	
	
	// 좌석 선택
	@PostMapping("seat")
	public String seat(Model model) {
		
		return "reservation/seat";
	}
	
	
	// 예매 리스트 조회
	@ResponseBody
	@GetMapping("reservationList")
	public String reservationList(Model model, String schCd) {
		// 예매 테이블 조회 => 데이터가 존재하면 jsp에서 좌석 사용불가처리 (매개변수 : 일정코드)
		List<HashMap<String, String>> reservationList = service.selectReservationList(schCd);
		JSONArray ja = new JSONArray(reservationList);
		
		return ja.toString();
	}
	
	
	// 상영 시간까지 남은 시간이 30분 이내인 영화인지 확인
	@ResponseBody
	@GetMapping("discount")
	public String discount(Model model, String schCd) {
		String discount = service.selectDiscount(schCd);
		System.out.println("discount!!!!!!!!!!!!!!!!!!!!!!!!!!: " + discount);
//		System.out.println(discount.getClass().getName());
		return discount;
	}
	
	// 결제
	@PostMapping("reservationPay")
	public String reservationPay(ReservationVO vo, Model model, HttpSession session) {
		model.addAttribute("vo", vo);
		
		String guestsId = (String)session.getAttribute("guestsId");
		String id = (String)session.getAttribute("sId");
		
		// -----------여기 수정!
		if(guestsId != null) {
//			HashMap<String, String> member = service.selectNonMemberId(guestsId);
//			model.addAttribute("member", member);
		} else {
			HashMap<String, String> member = service.selectMemberId(id);
			model.addAttribute("member", member);
		}
		
		String selectPoint = service.selectPoint(id);
		model.addAttribute("selectPoint", selectPoint);
		System.out.println("selectPoint" + selectPoint);
		
		
		return "reservation/reservation_pay";
	}
	
	
	// 예매 결제 완료
	@RequestMapping(value = "reservationSuccess", method = {RequestMethod.GET, RequestMethod.POST})
	public String reservationResult(ReservationVO vo, Model model, HttpSession session) {
		model.addAttribute("vo", vo);
		String id = (String)session.getAttribute("sId");
		HashMap<String, String> member = service.selectMemberId(id);
		model.addAttribute("member", member);
		
		// 결제 후 예매 정보 추가 - 회원
		int insertReservation = service.insertReservation(vo, id);
			
		System.out.println("vo!!!!!!!!!!!!!!!!" + vo);
		
		
		// 예매 성공 후 point 적립
		// 예매 성공 후 member 포인트 갱신
		String totalAmt = vo.getTotalAmt();
		if(insertReservation > 0) {
			int insertReservationPoint = service.insertReservationPoint(id, totalAmt);
			int updateMemberPoint = service.updateMemberPoint(id, totalAmt);
			String selectPoint = service.selectPoint(id);
			model.addAttribute("selectPoint", selectPoint);
			
			int resultPoint = Integer.parseInt(selectPoint)-Integer.parseInt(vo.getPoint());
			
			int updateresultPoint = service.updateresultPoint(id, resultPoint+"");
			
			
		}
		
		// 좌석 count
		String seatTotal = vo.getSeatNm();
		int seatCnt = seatTotal.length() - seatTotal.replace(",", "").length() + 1;
		
		// 좌석수 업데이트
		int updateSchedule = service.updateSchedule(vo.getSchCd(), seatCnt);
		
		
		return "reservation/reservation_success";
	}
	
	
}
