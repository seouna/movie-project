package com.itwillbs.movie.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.movie.service.LikeService;
import com.itwillbs.movie.service.MovieRegisterService;
import com.itwillbs.movie.service.MypageService;

@Controller
public class MovieController {
	
	@Autowired
	private MovieRegisterService service;
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private LikeService likeService;
	
	// 영화목록페이지
	@RequestMapping(value = "screening", method = {RequestMethod.GET, RequestMethod.POST})
	public String screening(Model model, HttpSession session) {
		
		List<HashMap<String, String>> movieList = service.selectScreeningMovieList();
		model.addAttribute("movieList",movieList);
		
		String id = (String)session.getAttribute("sId");
		if(id !=null) {
			List<HashMap<String, String>> likeList = likeService.findLikeList(id);
			model.addAttribute("likeList", likeList);
		}
		
		return "movieBoard/screening";
	}
	
	// 상영예정작
	@RequestMapping(value = "comming", method = {RequestMethod.GET, RequestMethod.POST})
	public String comming(Model model,HttpSession session) {
		
		List<HashMap<String, String>> movieList = service.selectCommingMovieList();
		model.addAttribute("movieList",movieList);
		
		String id = (String)session.getAttribute("sId");
		if(id !=null) {
			List<HashMap<String, String>> likeList = likeService.findLikeList(id);
			model.addAttribute("likeList", likeList);
		}
		
		return "movieBoard/comming";
	}

	
	
	// 영화상세페이지
	// Post매핑으로 하고 저장되지 않은 movie_code 를 보냈을 때는 메인 페이지로 보내야함
	@RequestMapping(value = "MovieInfo")
	public String movieInfo(@RequestParam String info_movie_code, Model model) {
		// 영화조회
		HashMap<String, String> movieInfo = service.selectMovie(info_movie_code);
		// 영화리뷰조회
		List<HashMap<String, String>> movieInfoReview = service.selectMovieReview(info_movie_code);
		
//		 DB에 없는 movie_code를 요청 보내지 않으면 메인페이지로 보내기
		if(movieInfo == null) {
			return "redirect:/main";
		}
		
		model.addAttribute("movieInfo", movieInfo);
		model.addAttribute("movieInfoReview", movieInfoReview);

		return "movieBoard/movieInfo2";
	}

	//좋아요 버튼 기능
	
	@PostMapping(value = "likeClick")
	@ResponseBody
	public HashMap<String, String> likeCount(@RequestParam("info_movie_code") String info_movie_code, HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		
		// service에 보낼 map
		HashMap<String, String> like = new HashMap<String, String>();
		
		// view 에 보낼 map
		HashMap<String, String> result = new HashMap<String, String>();
		
		
		like.put("member_id", id);
		like.put("info_movie_code", info_movie_code);
		HashMap<String, String> isLike = likeService.findLike(like);
		String resultType = "delete";
		
		// id 유효성 검사
		if(id != null) {
			// 좋아요 한 적 없을 때
			if(isLike != null) {	
				int deleteCount = likeService.deleteLike(like);
				
				if(deleteCount > 0) {
					result.put("msg", "좋아요를 취소했습니다.");
				}
			}else {	//	좋아요 한 적 있을 때	
				
				//좋아요 추가
				int insertCount = likeService.insertLike(like);
				//좋아요 추가 성공했을 때 
				if(insertCount > 0) {
					result.put("msg", "좋아요 성공");
					resultType= "insert";
				}
			}
			
			likeService.updateLike(like);
			
		}else {
			
			result.put("msg", "로그인 후 시도해주세요.");
		}
		
		String like_count = service.selectMovie(info_movie_code).get("like_count");
		result.put("resultType", resultType);
		result.put("like_count", like_count); 
		
		System.out.println("likeClick.result : "+result);
		return result; 
		
	}
	
}
