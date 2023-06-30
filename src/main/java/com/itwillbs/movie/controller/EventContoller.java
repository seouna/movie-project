package com.itwillbs.movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EventContoller {
	
	@GetMapping("event")
	public String cinemaList() {
		
		return "event/event_list";
	}
	
	@GetMapping("eventDetail")
	public String eventDetail() {
		
		return "event/event_detail";
	}

}
