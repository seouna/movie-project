package com.itwillbs.movie.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.movie.service.StoreService;


@Controller
public class StoreController {
	
	@Autowired
	private StoreService service;
	
	
	// 상품별 DB 조회 후 리스트 출력.
	@RequestMapping(value = "store_main", method = {RequestMethod.GET, RequestMethod.POST})
	public String test2(Model model) {
		
		List<HashMap<String, String>> gift = service.selectItem();
		List<HashMap<String, String>> food = service.selectFood();
		List<HashMap<String, String>> ticket = service.selectTicket();
		model.addAttribute("gift", gift);
		model.addAttribute("food", food);
		model.addAttribute("ticket", ticket);
		
		
		return "store/store_main";
	}
	
	// 상품 데이터를 받아 상세페이지 출력.
	@RequestMapping(value = "store_detail", method = {RequestMethod.GET, RequestMethod.POST})
	public String store_detail(@RequestParam String item_code, Model model) {
		
		HashMap<String, String> item = service.selectCode(item_code);
		model.addAttribute("item", item);
		
		return "store/store_detail";
	}
	
	
	// 스토어 결제
	@RequestMapping(value = "store_pay", method = {RequestMethod.GET, RequestMethod.POST})
	public String store_pay(@RequestParam String item_code, @RequestParam String item_price, @RequestParam String item_count, HttpSession session, Model model) {
		HashMap<String, String> item = service.selectCode(item_code);
		String id = (String)session.getAttribute("sId");
		HashMap<String, String> member = service.selectMemberId(id);
		model.addAttribute("item", item);
		model.addAttribute("item_price", item_price);
		model.addAttribute("member", member);
		
		// 포인트 조회
		String point = service.selectPoint(id);
		model.addAttribute("point", point);
		model.addAttribute("item_count", item_count);
		
		if(id == null) {
			model.addAttribute("msg", "로그인 후 이용가능합니다.");
			model.addAttribute("target", "memLogin");
			return "success";
		} else {
			return "store/store_pay";
		}
	}
	
	
	
	// 결제 성공
	@RequestMapping(value = "store_paySuccess", method = {RequestMethod.GET, RequestMethod.POST})
	public String store_paySuccess(@RequestParam HashMap<String, String> pay, HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		HashMap<String, String> member = service.selectMemberId(id);
		pay.put("id", id);
		
		
		// 포인트 차감
		if(pay.get("point") != "") {
			// 중복 결제 방지
			HashMap<String, String> payCode = service.selectPayCode(pay.get("pay_code"));
			if(payCode != null) {
				model.addAttribute("msg", "상품 결제가 이미 완료되었습니다. 메인화면으로 이동합니다.");
				model.addAttribute("target", "main");
				return "success";
			} else {
				// 멤버 테이블 차감
				String point = (Integer.parseInt(member.get("member_point")) - Integer.parseInt(pay.get("point"))) + "";
				int minusMember = service.minusPoint(id, point);
				// 포인트 테이블 차감
				int minusPoint = service.minusPointTable(id, pay.get("point"));
				
			}
			
		}
		
		int insertPay = service.insertPay(pay);
		System.out.println("insertPay" + insertPay);
		if(insertPay > 0) {
			// 포인트 적립
			HashMap<String, String> member2 = service.selectMemberId(id);
			HashMap<String, String> point = new HashMap<String, String>();
			
			// member 테이블 저장.
			String pointResult = (Integer.parseInt(member2.get("member_point")) + Integer.parseInt(pay.get("pay_price")) / 10) + "";
			point.put("id", id);
			point.put("point", pointResult);
			int updatePoint = service.updatePoint(point);
			
			// point 테이블 저장.
			String payPoint = (Integer.parseInt(pay.get("pay_price")) / 10) + "";
			int insertPointTable = service.insertPointTable(id, payPoint);
			
			// 포인트 추가 금액
			pay.put("point", (Integer.parseInt(pay.get("pay_price")) / 10) + "");
			model.addAttribute("member", member);
			model.addAttribute("pay", pay);
		} else {
			model.addAttribute("msg", "상품 결제가 실패하였습니다.");
			return "fail_back";
		}
		
		
		return "store/store_paySuccess";
	}
	
	
}
