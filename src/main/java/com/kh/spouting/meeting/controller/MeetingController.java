package com.kh.spouting.meeting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MeetingController {

	@RequestMapping(value="/meeting", method=RequestMethod.GET)
	public String meetingPage() {
		return "/meeting/meeting";
	}
}
