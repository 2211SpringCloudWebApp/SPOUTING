package com.kh.spouting.meeting.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.spouting.meeting.domain.Meeting;
import com.kh.spouting.meeting.service.MeetingService;

@Controller
public class MeetingController {
	
	@Autowired
	private MeetingService meetingService;

	@RequestMapping(value="/meeting", method=RequestMethod.GET)
	public String meetingPage(Model model) {
		try {
			List<Meeting> meetingList = meetingService.selectMeeting();
			if(!meetingList.isEmpty()) {
				model.addAttribute("meetingList", meetingList);
				return "/meeting/meeting";
			} else {
				return "/meeting/meeting";
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
			return "/home";
		}
	}
	
	
}