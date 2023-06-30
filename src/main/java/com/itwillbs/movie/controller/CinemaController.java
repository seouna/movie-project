package com.itwillbs.movie.controller;

import java.io.IOException;
import java.sql.Time;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

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

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.google.protobuf.TextFormat.ParseException;
import com.itwillbs.movie.service.CinemaService;
import com.itwillbs.movie.service.MemberService;
import com.itwillbs.movie.service.MovieRegisterService;

@Controller
public class CinemaController {

	@Autowired
	MemberService service;

	@Autowired
	CinemaService cinemaService;

	@Autowired
	MovieRegisterService movieRegisterService;

	@GetMapping(value = "cinemaList")
	public String cinemaList(String location_name, HttpSession session, Model model) {
		System.out.println(location_name);
		// 지역목록
		List<HashMap<String, String>> location = cinemaService.location();
		model.addAttribute("location", location);
		System.out.println(location_name);

		List<HashMap<String, String>> noticeList = cinemaService.noticeList();
		model.addAttribute("noticeList", noticeList);

		String id = (String) session.getAttribute("sId");
		System.out.println(id);
		HashMap<String, String> myPreferCinema = cinemaService.preferCinema(id);

		System.out.println(myPreferCinema);
		model.addAttribute("myPreferCinema", myPreferCinema);

		return "cinema/cinema_all";
	}

	// 선택한 지역을 넘겨서 받은결과값 (json)
	@ResponseBody
	@RequestMapping(value = "locationCinema", produces = "application/json; charset=utf8", method = { RequestMethod.GET,
			RequestMethod.POST })
	public List<HashMap<String, String>> locationCinema(String location_name, Model model) {
		List<HashMap<String, String>> locationCinema = cinemaService.locationCinema(location_name);
		return locationCinema;
	}

	// 예매
	@GetMapping("cinemaDetail")
	public String cinemaDetail(@RequestParam(value = "cinema_code", required = false) String cinema_code,
			@RequestParam(value = "date", required = false) String date, Model model)
			throws JsonProcessingException, ParseException {
		System.out.println("==================================");
		System.out.println(date);
		System.out.println("==================================");

		List<HashMap<String, String>> cinemaDetail = cinemaService.cinemaDetail(cinema_code);

		System.out.println(cinemaDetail);
		System.out.println("==================================");
		ObjectMapper objectMapper = new ObjectMapper();
		String cinemaDetailJson = objectMapper.writeValueAsString(cinemaDetail);
		model.addAttribute("cinemaDetailJson", cinemaDetailJson);

		model.addAttribute("cinema_code", cinema_code);
		model.addAttribute("cinemaDetail", cinemaDetail);

		return "cinema/cinema_detail";
	}

	@ResponseBody
	@RequestMapping(value = "schList", produces = "application/json; charset=utf8", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String schList(String cinema_code, String date, Model model) throws JsonProcessingException {
		ObjectMapper objectMapper = new ObjectMapper();
		SimpleModule module = new SimpleModule();

		module.addSerializer(Time.class, new JsonSerializer<Time>() {
			@Override
			public void serialize(Time value, JsonGenerator gen, SerializerProvider serializers) throws IOException {
				gen.writeString(value.toString());
			}
		});

		objectMapper.registerModule(module);

		// JSON으로 변환할 객체
		List<HashMap<String, String>> schList = cinemaService.schList(cinema_code, date);

		model.addAttribute("schList", schList);

		String schListJson = objectMapper.writeValueAsString(schList);

		System.out.println(schListJson);
		System.out.println("==================================");


		return schListJson;
	}

	// 위치
	@GetMapping("/cinemaLocation")
	public String cinemaLocation(@RequestParam("cinema_code") String cinema_code, Model model)
			throws JsonProcessingException {
		List<HashMap<String, String>> cinemaDetail = cinemaService.cinemaDetail(cinema_code);

		// 자바스크립트에서 쓸수있도록 json타입으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		String cinemaDetailJson = objectMapper.writeValueAsString(cinemaDetail);

		model.addAttribute("cinemaDetailJson", cinemaDetailJson);
		model.addAttribute("cinema_code", cinema_code);
		model.addAttribute("cinemaDetail", cinemaDetail);

		return "cinema/cinema_location";
	}

	// 이벤트
	@GetMapping("/cinemaEvent")
	public String cinemaEvent(@RequestParam("cinema_code") String cinema_code, Model model) {
		List<HashMap<String, String>> cinemaDetail = cinemaService.cinemaDetail(cinema_code);

		// 파라미터를 받아온것도 model에넣어주고 / 결과값도 넣어줘야함
		model.addAttribute("cinema_code", cinema_code);
		model.addAttribute("cinemaDetail", cinemaDetail);
		return "cinema/cinema_event";
	}

	// 관람료
	@GetMapping("/cinemaPrice")
	public String cinemaPrice(@RequestParam("cinema_code") String cinema_code, Model model) {

		List<HashMap<String, String>> cinemaDetail = cinemaService.cinemaDetail(cinema_code);

		model.addAttribute("cinema_code", cinema_code);
		model.addAttribute("cinemaDetail", cinemaDetail);
		return "cinema/cinema_price";
	}

	// 회원 로그인 확인 -
	@PostMapping(value = "cinemaLoginPro")
	public String loginPro(@RequestParam HashMap<String, String> login, Model model, HttpSession session) {
		String memberId = login.get("member_id");
		String password = login.get("member_pw");

		HashMap<String, String> member = service.checkUser(login);

		if (member == null) {
			model.addAttribute("msg", "아이디와 비밀번호가 일치하지 않습니다.");
			return "fail_back";
		}

		String hashedPassword = member.get("member_pw");
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

		if (passwordEncoder.matches(password, hashedPassword)) {
			session.setAttribute("sId", memberId);
			session.setAttribute("token", "true");
			return "redirect:/cinemaList";
		}

		model.addAttribute("msg", "아이디와 비밀번호가 일치하지 않습니다.");
		return "fail_back";
	}

}
