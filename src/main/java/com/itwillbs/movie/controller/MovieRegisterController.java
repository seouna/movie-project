package com.itwillbs.movie.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.movie.service.MovieRegisterService;
import com.itwillbs.movie.service.ReservationService;
import com.itwillbs.movie.vo.PageInfo;

@Controller
public class MovieRegisterController {
	@Autowired
	private MovieRegisterService movieRegisterService;
	
	@Autowired
	private ReservationService reservationService;

	// 영화관리페이지
	// 영화목록조회
	@RequestMapping(value = "admin_movie_register", method = { RequestMethod.GET, RequestMethod.POST })
	public String movieRegister(Model model,@RequestParam(defaultValue = "1") int pageNum) {
		
		
		//페이징처리
		// -----------------------------------------------------------------------
		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록 갯수(10개로 제한)
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호(startRow) 계산 => 0, 10, 20...
		// -----------------------------------------------------------------------
		List<HashMap<String, String>> movieList = movieRegisterService.selectMovies(startRow, listLimit);
		//상영중인것만 보여줘야함
	
		// -----------------------------------------------------------------------
		int listCount = movieRegisterService.getScreeningListCount();
		System.out.println("현재상영테이블 =============================");
		System.out.println(listCount);
		System.out.println("=============================");

		int pageListLimit = 10;

		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);

		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;

		int endPage = startPage + pageListLimit - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		
		System.out.println(pageInfo);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("movieList", movieList);

		
		return "admin/admin_movie_register";
	}
	
	
	@GetMapping("admin_movie_register_end")
	public String screenEnd(Model model,@RequestParam(defaultValue = "1") int pageNum) {
		
		//페이징처리
				// -----------------------------------------------------------------------
				int listLimit = 10; // 한 페이지에서 표시할 게시물 목록 갯수(10개로 제한)
				int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호(startRow) 계산 => 0, 10, 20...
				// -----------------------------------------------------------------------
				List<HashMap<String, String>> movieList = movieRegisterService.selectEndMoive(startRow, listLimit);
			
				// -----------------------------------------------------------------------
				int listCount = movieRegisterService.getEndListCount();

				int pageListLimit = 10;

				int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);

				int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;

				int endPage = startPage + pageListLimit - 1;

				if (endPage > maxPage) {
					endPage = maxPage;
				}

				PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
				
				System.out.println(pageInfo);
				
				model.addAttribute("pageInfo", pageInfo);
				model.addAttribute("movieList", movieList);
		
		return "admin/admin_movie_register_end";
	}
	
	@GetMapping("admin_movie_register_reScreening")
	public String reScreening(Model model,@RequestParam(defaultValue = "1") int pageNum) {
		
		//페이징처리
				// -----------------------------------------------------------------------
				int listLimit = 10; // 한 페이지에서 표시할 게시물 목록 갯수(10개로 제한)
				int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호(startRow) 계산 => 0, 10, 20...
				// -----------------------------------------------------------------------
				List<HashMap<String, String>> movieList = movieRegisterService.selectReScreeningMoive(startRow, listLimit);
			
				// -----------------------------------------------------------------------
				int listCount = movieRegisterService.getReScreeningListCount();

				int pageListLimit = 10;

				int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);

				int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;

				int endPage = startPage + pageListLimit - 1;

				if (endPage > maxPage) {
					endPage = maxPage;
				}

				PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
				
				System.out.println(pageInfo);
				
				model.addAttribute("pageInfo", pageInfo);
				model.addAttribute("movieList", movieList);
		
		return "admin/admin_movie_register_reScreening";
	}
	
	

	// 영화상영예정작관리
	@RequestMapping(value = "admin_movie_comming_register", method = { RequestMethod.GET, RequestMethod.POST })
	public String admin_movie_comming_register(Model model) {
		List<HashMap<String, String>> movieList = movieRegisterService.selectCommingMovieList();
		model.addAttribute("movieList", movieList);

		return "admin/admin_movie_comming_register";
	}

	// 영화(1개)조회
	@RequestMapping(value = "selectMovie", method = { RequestMethod.GET, RequestMethod.POST })
	public String selectMovie(@RequestParam String info_movie_code, Model model) {
		System.out.println(info_movie_code);

		HashMap<String, String> selectMovie = movieRegisterService.selectMovie(info_movie_code);

		System.out.println(selectMovie);
		model.addAttribute("selectMovie", selectMovie);

		System.out.println(selectMovie);

		return "admin/admin_movie_update";
	}


	
	// 영화 정보 수정
	@RequestMapping(value = "updateMovie", method = { RequestMethod.GET, RequestMethod.POST })
	public String updateMoviePro(@RequestParam HashMap<String, String> movie) {
		System.out.println(movie);
		int updateCount = movieRegisterService.updateMovie(movie);
		return "redirect:/admin_movie_register";
	}

	// 영화등록
	@RequestMapping(value = "registMoviePro", method = { RequestMethod.GET, RequestMethod.POST })
	public String registMovie(@RequestParam HashMap<String, String> movie, Model model) {
		System.out.println(movie);
		/*
		 * 예외처리 현황 Controller - 중복코드 제외 admin_movie_register page - 포스터 누락 제외, 영화 코드 누락
		 * 제외, 상영일 이상 제외, 관람등급 누락 제외
		 */

		try {
			int registCount = movieRegisterService.registMovie(movie);
			if (registCount > 0) {
				return "redirect:/admin_movie_register";
			}

		} catch (DuplicateKeyException e) {
			model.addAttribute("msg", "이미 등록된 영화가 있습니다.");
		}
		return "fail_back";

	}

	// 영화삭제
	@RequestMapping(value = "deleteMovie", method = { RequestMethod.GET, RequestMethod.POST })
	public String movieDelete(@RequestParam String info_movie_code, Model model) {
		System.out.println(info_movie_code);

		int deleteCount = movieRegisterService.deleteMovie(info_movie_code);
		return "redirect:/admin_movie_register";
	}

	// -------------------메인
	// 영화------------------------------------------------------------

	// -------------------------------------------------------------------------------------------------
	// 영화 일정 ( Movie Schedule )
	// -------------------------------------------------------------------------------------------------

	// 영화 일정등록 // 영화관 상영관들고오기
	@RequestMapping(value = "movieScheduleUpdate", method = { RequestMethod.GET, RequestMethod.POST })
	public String movieSchedule(Model model, String cinema_name,@RequestParam(defaultValue = "1") int pageNum) {
		
		// -----------------------------------------------------------------------
		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록 갯수(10개로 제한)
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호(startRow) 계산 => 0, 10, 20...
		// -----------------------------------------------------------------------
		List<HashMap<String, String>> movieList = movieRegisterService.selectMovies(startRow, listLimit);
		model.addAttribute("movieList", movieList);
		List<HashMap<String, String>> cinemaList = movieRegisterService.selectCinema();
		model.addAttribute("cinemaList", cinemaList);

		return "admin/admin_movie_schedule_register";
	}

	// 영화관에맞는 상영관 표시
	@ResponseBody
	@RequestMapping(value = "screenSelect", produces = "application/json; charset=utf8", method = { RequestMethod.GET,
			RequestMethod.POST })
	public List<HashMap<String, String>> screenSelect(
			Model model
			, @RequestParam("cinema_name") String cinema_name
			, @RequestParam("cinema_code") String cinema_code
			, @RequestParam("movie_code") String movie_code
			) {
		System.out.println("무비코드 ===============================================");
		System.out.println(cinema_name);
		System.out.println(movie_code);
		System.out.println("===============================================");
		List<HashMap<String, String>> selectScreen = movieRegisterService.selectScreen(cinema_name);
		System.out.println(selectScreen);

		return selectScreen;
	}
	//

	

	@ResponseBody
	@PostMapping(value = "schCheckTime", produces = "application/json; charset=utf8")
	public String schCheckTime(Model model, @RequestParam("sch_date") String sch_date,
			@RequestParam("cinema_name") String cinema_name, @RequestParam("screen_name") String screen_name,
			@RequestParam("movie_code") String movie_code) throws JsonProcessingException {
		System.out.println("sch_date =======================================================");
		System.out.println(movie_code);
		System.out.println("======ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ=========================================");
		System.out.println(sch_date+", "+ cinema_name + " , " + screen_name+", " + movie_code);
		System.out.println("==========ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ====================================");
		//상영시간을 가지고온다
		List<HashMap<String, String>> schCheckTime = movieRegisterService.schCheckTime(sch_date, cinema_name,screen_name,movie_code);

		
		ObjectMapper objectMapper = new ObjectMapper();
		String schCheckTimeJson = objectMapper.writeValueAsString(schCheckTime);
		System.out.println("==================================");
		System.out.println(schCheckTimeJson);
		System.out.println("==================================");
		
		
		model.addAttribute("schCheckTimeJson", schCheckTimeJson);

		return schCheckTimeJson;
	}

	// 영화일정등록
	@RequestMapping(value = "movieScheduleRegisterPro", method = { RequestMethod.GET, RequestMethod.POST })
	public String movieSchedulePro(@RequestParam HashMap<String, String> movieSchedule, Model model)
			throws ParseException {
		System.out.println("여기로 오니..");
		System.out.println(movieSchedule);
		HashMap<String, String> selectInfoTime = movieRegisterService.selectMovie(movieSchedule.get("sch_movie_code"));

		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm"); // 변환형식

		Calendar cal = Calendar.getInstance();
		String runningTime = selectInfoTime.get("info_time");
		String strTime2 = movieSchedule.get("sch_start_time");

		Date runTime = sdf.parse(runningTime); // date 변환
		Date startTime = sdf.parse(strTime2); //// date 변환

		// 변환한값을 cal객체의 add메서드써서 더함
		cal.setTime(startTime);
		cal.add(Calendar.HOUR_OF_DAY, runTime.getHours());
		cal.add(Calendar.MINUTE, runTime.getMinutes());
//		cal.add(Calendar.SECOND, runTime.getSeconds());
		Date sumDate = cal.getTime();

		String sch_last_time = movieSchedule.get("sch_last_time");
		sch_last_time = sdf.format(sumDate);
		movieSchedule.put("sch_last_time", sch_last_time);
		System.out.println(movieSchedule);

		int scheduleRegisterCount = movieRegisterService.scheduleRegister(movieSchedule);
		System.out.println(scheduleRegisterCount);
		if (scheduleRegisterCount > 0) {
			System.out.println("예매등록성공");
		}
		return "redirect:/admin_schedule_register";
	}

	// 영화일정목록
	@RequestMapping(value = "admin_schedule_register", method = { RequestMethod.GET, RequestMethod.POST })
	public String scheduleRegister(Model model, @RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "") String sch_movie_code,
			@RequestParam(defaultValue = "") String sch_cinema_code,
			@RequestParam(defaultValue = "") String sch_research_date) {
		// 상영영화 만 불러와야함 23.04.26
		List<HashMap<String, String>> movieList = movieRegisterService.screeningMovies();

		System.out.println(movieList);

		List<HashMap<String, String>> cinemaList = movieRegisterService.selectCinema();
		// -----------------------------------------------------------------------
		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록 갯수(10개로 제한)
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호(startRow) 계산 => 0, 10, 20...
		// -----------------------------------------------------------------------
		List<HashMap<String, String>> scheduleList = movieRegisterService.selectSchedule(startRow, listLimit,
				sch_movie_code, sch_cinema_code, sch_research_date);
		// -----------------------------------------------------------------------
		int listCount = movieRegisterService.getBoardListCount(sch_movie_code, sch_cinema_code, sch_research_date);
		System.out.println("현재상영테이블 =============================");
		System.out.println(listCount);
		System.out.println("=============================");

		int pageListLimit = 10;

		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);

		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;

		int endPage = startPage + pageListLimit - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		// ------------------------------------------------------------------------------------

		int todayCount = movieRegisterService.selectTodayCount();
		model.addAttribute("todayCount", todayCount);
		model.addAttribute("cinemaList", cinemaList);
		model.addAttribute("scheduleList", scheduleList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("movieList", movieList);
		// -----------------------------------------------------------------------
		System.out.println("=========================================");
		System.out.println(listCount);
		System.out.println("=========================================");
		System.out.println(pageInfo);
		System.out.println("=========================================");
		return "admin/admin_movie_schedule";
	}

	// 상영스케쥴 삭제
	@RequestMapping(value = "deleteSchedule", method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteSchedule(@RequestParam String sch_code, Model model) {

		int deleteCount = movieRegisterService.deleteSchedule(sch_code);

		return "redirect:/admin_schedule_register";
	}

	// 상영스케쥴 삭제
	@ResponseBody
	@GetMapping("deleteDateSch")
	public Map<String, Object> deleteDateSch(@RequestParam String date, Model model) throws JsonProcessingException {

		int deleteCount = movieRegisterService.deleteDateSch(date);
		Map<String, Object> response = new HashMap<>();

		response.put("deleteCount", deleteCount);

		return response;

	}

	// 영화일정 페이지 정렬 ======================================================
	// 지점명정렬
	@RequestMapping(value = "cinemaNameSort", method = { RequestMethod.GET, RequestMethod.POST })
	public String cinemaNameSort(Model model) {
		List<HashMap<String, String>> scheduleList = movieRegisterService.cinemaNameSort();
		model.addAttribute("scheduleList", scheduleList);
		System.out.println(scheduleList);
		return "admin/admin_movie_schedule";
	}

	// 상영관정렬
	@RequestMapping(value = "screenNameSort", method = { RequestMethod.GET, RequestMethod.POST })
	public String screenNameSort(Model model) {
		List<HashMap<String, String>> scheduleList = movieRegisterService.screenNameSort();
		model.addAttribute("scheduleList", scheduleList);
		return "admin/admin_movie_schedule";
	}

	// 영화이름정렬
	@RequestMapping(value = "movieNameSort", method = { RequestMethod.GET, RequestMethod.POST })
	public String movieNameSort(Model model) {
		List<HashMap<String, String>> scheduleList = movieRegisterService.movieNameSort();
		model.addAttribute("scheduleList", scheduleList);
		return "admin/admin_movie_schedule";
	}

	// 상영일자정렬
	@RequestMapping(value = "schDateSort", method = { RequestMethod.GET, RequestMethod.POST })
	public String schDateSort(Model model) {
		List<HashMap<String, String>> scheduleList = movieRegisterService.schDateSort();
		model.addAttribute("scheduleList", scheduleList);
		return "admin/admin_movie_schedule";
	}

	// 시작시간정렬
	@RequestMapping(value = "schStartSort", method = { RequestMethod.GET, RequestMethod.POST })
	public String schStartSort(Model model) {
		List<HashMap<String, String>> scheduleList = movieRegisterService.schStartSort();
		model.addAttribute("scheduleList", scheduleList);
		return "admin/admin_movie_schedule";
	}

	// 마지막시간정렬
	@RequestMapping(value = "schLastSort", method = { RequestMethod.GET, RequestMethod.POST })
	public String schLastSort(Model model) {
		List<HashMap<String, String>> scheduleList = movieRegisterService.schLastSort();
		model.addAttribute("scheduleList", scheduleList);
		return "admin/admin_movie_schedule";
	}
	// 영화일정 페이지 정렬 ======================================================

	// 상영일정 수정 - 상영 상세 정보 (날짜랑 시간만 바꿀수 있음)
	@RequestMapping(value = "selectSchedule", method = { RequestMethod.GET, RequestMethod.POST })
	public String selectSchedule(@RequestParam String sch_code, Model model) {
		System.out.println("selectSchedule");
		System.out.println(sch_code);
		HashMap<String, String> selectSchedule = movieRegisterService.detailSchedule(sch_code);
		model.addAttribute("selectSchedule", selectSchedule);
		System.out.println("selectSchedule ==================================");
		System.out.println(selectSchedule);
		System.out.println("==================================");
		System.out.println(model);
		return "admin/admin_movie_schedule_update";
	}

	// 영화 정보 수정
	@RequestMapping(value = "updateSchedule", method = { RequestMethod.GET, RequestMethod.POST })
	public String updateSchedule(@RequestParam HashMap<String, String> schedule, Model model) throws ParseException {
		System.out.println(schedule);
		System.out.println("=============================");
		System.out.println(schedule.get("sch_code"));

		HashMap<String, String> selectInfoTime = movieRegisterService.selectSchMovie(schedule.get("sch_code"));
		System.out.println("=============================");
		System.out.println(selectInfoTime);
		System.out.println("=============================");

		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm"); // 변환형식

		Calendar cal = Calendar.getInstance();
		String runningTime = selectInfoTime.get("info_time");
		String strTime2 = schedule.get("sch_start_time");
		Date runTime = sdf.parse(runningTime); // date 변환
		Date startTime = sdf.parse(strTime2); //// date 변환

		// 변환한값을 cal객체의 add메서드써서 더함
		cal.setTime(startTime);
		cal.add(Calendar.HOUR_OF_DAY, runTime.getHours());
		cal.add(Calendar.MINUTE, runTime.getMinutes());
		cal.add(Calendar.SECOND, runTime.getSeconds());
		Date sumDate = cal.getTime();

		String sch_last_time = schedule.get("sch_last_time");
		sch_last_time = sdf.format(sumDate);
		schedule.put("sch_last_time", sch_last_time);

		System.out.println(schedule);

		int modifyCount = movieRegisterService.movieScheduleUpdatePro(schedule);

		return "redirect:/admin_schedule_register";
	}

	// 영화 페이지
	// 정렬=============================================================================
	// 토글은 안됨..
	// 영화코드정렬
	@GetMapping(value = "infoMovieCodeSort")
	public String infoMovieCodeSort(Model model) {
		List<HashMap<String, String>> movieList = movieRegisterService.infoMovieCodeSort();
		model.addAttribute("movieList", movieList);
		return "admin/admin_movie_register";
	}

	// 영화코드정렬
	@GetMapping(value = "infoMovieNameSort")
	public String infoMovieNameSort(Model model) {
		List<HashMap<String, String>> movieList = movieRegisterService.infoMovieNameSort();
		model.addAttribute("movieList", movieList);
		return "admin/admin_movie_register";
	}

	// 제작년도
	@GetMapping(value = "infoYearSort")
	public String infoYearSort(Model model) {
		List<HashMap<String, String>> movieList = movieRegisterService.infoYearSort();
		model.addAttribute("movieList", movieList);
		return "admin/admin_movie_register";
	}

	// 상영시간
	@GetMapping(value = "infoTimeSort")
	public String infoTimeSort(Model model) {
		List<HashMap<String, String>> movieList = movieRegisterService.infoTimeSort();
		model.addAttribute("movieList", movieList);
		return "admin/admin_movie_register";
	}

	@GetMapping(value = "infoShowDateSort")
	public String infoShowDateSort(Model model) {
		List<HashMap<String, String>> movieList = movieRegisterService.infoShowDateSort();
		model.addAttribute("movieList", movieList);
		return "admin/admin_movie_register";
	}

	@GetMapping(value = "infoEndDateSort")
	public String infoEndDateSort(Model model) {
		List<HashMap<String, String>> movieList = movieRegisterService.infoEndDateSort();
		model.addAttribute("movieList", movieList);
		return "admin/admin_movie_register";
	}

	@GetMapping(value = "infoStorySort")
	public String infoStorySort(Model model) {
		List<HashMap<String, String>> movieList = movieRegisterService.infoStorySort();
		model.addAttribute("movieList", movieList);
		return "admin/admin_movie_register";
	}

	// 상영종료된 목록movieEndSchedule
	@GetMapping("movieEndSchedule")
	public String movieEndSchedule(Model model, @RequestParam(defaultValue = "1") int pageNum) {
		System.out.println("movieEndSchedule =======================================================");
// 		List<HashMap<String, String>> endSchList = movieRegisterService.endSchList();

		// -----------------------------------------------------------------------
		int listLimit = 15; // 한 페이지에서 표시할 게시물 목록 갯수(10개로 제한)
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호(startRow) 계산 => 0, 10, 20...
		// -----------------------------------------------------------------------
		
		List<HashMap<String, String>> movieList = movieRegisterService.selectMovies(startRow, listLimit);
		List<HashMap<String, String>> cinemaList = movieRegisterService.selectCinema();
		int ended_screening = movieRegisterService.ended_screening();
		
		if(ended_screening > 0) {
			int insertCount = movieRegisterService.insertSchedule_end();
			if (insertCount > 0) {
				int delCount = movieRegisterService.endSchedule_del();
			}
		}
		// 상영종료테이블에서LIST


		List<HashMap<String, String>> endSchList = movieRegisterService.endSchList(startRow, listLimit);

		// -----------------------------------------------------------------------
		int listCount = movieRegisterService.getEndListCount();
		System.out.println("end테이블 " + listCount);
		int pageListLimit = 10; // 페이지 목록 갯수를 3개로 제한
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);

		int todayCount = movieRegisterService.selectTodayCount();
		model.addAttribute("movieList", movieList);
		model.addAttribute("cinemaList", cinemaList);
		model.addAttribute("todayCount", todayCount);
		model.addAttribute("endSchList", endSchList);
		model.addAttribute("pageInfo", pageInfo);
		System.out.println(pageInfo);
		System.out.println(endSchList);
		return "admin/admin_movie_schedule_endList";
	}
	
	//예매리스트
	@GetMapping("resList")
	public String resList(Model model, @RequestParam(defaultValue = "1") int pageNum) {
		
		int resCount = movieRegisterService.resTodayCount();
		
		// -----------------------------------------------------------------------
		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록 갯수(10개로 제한)
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호(startRow) 계산 => 0, 10, 20...
		// -----------------------------------------------------------------------
		List<HashMap<String, String>> resList = movieRegisterService.resList(startRow, listLimit);
		// -----------------------------------------------------------------------
		int listCount = movieRegisterService.getResListCount();
		System.out.println("Res테이블 " + listCount);
		int pageListLimit = 10; // 페이지 목록 갯수를 3개로 제한
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		model.addAttribute("resCount",resCount);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("resList", resList);

		return "admin/admin_movie_res_register";
	}

	@GetMapping("selectRes")
	public String resUpdate(Model model, @RequestParam String res_code, @RequestParam(defaultValue = "1") int pageNum) {
		System.out.println("====================================");
		HashMap<String, String> detailRes = movieRegisterService.detailRes(res_code);
		
		
		// -----------------------------------------------------------------------
		int listLimit = 15; // 한 페이지에서 표시할 게시물 목록 갯수(10개로 제한)
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호(startRow) 계산 => 0, 10, 20...
		// -----------------------------------------------------------------------
		
		
		List<HashMap<String, String>> movieList = movieRegisterService.selectMovies(startRow, listLimit);

		model.addAttribute("movieList", movieList);
		model.addAttribute("detailRes", detailRes);
		System.out.println("====================================");
		System.out.println(detailRes);
		System.out.println("====================================");
		return "admin/admin_movie_res_register_update";
	}

	@GetMapping("deleteRes")
	public String deleteRes(@RequestParam String res_code) {
		int delCount = movieRegisterService.delRes(res_code);

		return "redirect:/resList";
	}

	@RequestMapping(value = "updateRes", method = { RequestMethod.GET, RequestMethod.POST })
	public String updateRes(@RequestParam HashMap<String, String> reservation) {
		int updateCount = movieRegisterService.updateRes(reservation);
		System.out.println("updateRes ========================================");
		System.out.println(updateCount);
		System.out.println("updateRes ========================================");
		System.out.println(reservation);

		return "redirect:/resList";
	}

}
