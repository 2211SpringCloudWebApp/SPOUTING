package com.kh.spouting.meeting.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	@RequestMapping(value="/meetingOpenPage", method=RequestMethod.GET)
	public String meetingOpenPage() {
		return "meeting/meeting-open";
	}
	
	
	@RequestMapping(value="/meetingOpen", method=RequestMethod.POST)
	public String meetingOpen(HttpServletRequest request
			,@ModelAttribute Meeting meeting
			,Model model) {
		try {
			request.setCharacterEncoding("UTF-8");
			int result = meetingService.insertMeeting(meeting);
			if(result>0) {
				return "redirect:/meeting.jsp";
			} else {
				return "common/error";
			}
		} catch (Exception e) {
			// TODO: handle exception
			return "common/error";
		}
	}
	
	
}