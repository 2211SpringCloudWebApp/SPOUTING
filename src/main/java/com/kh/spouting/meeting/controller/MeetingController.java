package com.kh.spouting.meeting.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.spouting.meeting.domain.Meeting;
import com.kh.spouting.meeting.service.MeetingService;
import com.kh.spouting.user.domain.User;

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
				return "meeting/meeting";
			} else {
				model.addAttribute("msg","meeting 데이터 존재하지 않음");
				return "common/error";
			}
		} catch(Exception e) {
			model.addAttribute("msg",e.getMessage());
			return "common/error";
		}
	}
	
	@RequestMapping(value="/meetingOpenPage", method=RequestMethod.GET)
	public String meetingOpenPage(Model model, @SessionAttribute("loginUser") User loginUser) {
		model.addAttribute("loginUser",loginUser);
		return "meeting/meeting-open";
	}
	
	
	@RequestMapping(value="/meetingOpen", method=RequestMethod.POST)
	public String meetingOpen(HttpServletRequest request
			,@ModelAttribute Meeting meeting
			,@RequestParam("meetingDate") String meetingDate
			,@SessionAttribute("loginUser") User loginUser
			,Model model) {
			model.addAttribute("loginUser",loginUser);
		try {
			System.out.println(meetingDate);
			request.setCharacterEncoding("UTF-8");
			// 2023-04-28T18:20 -> Timestamp로 바꾸기
	
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
			LocalDateTime dateTime = LocalDateTime.parse(meetingDate, formatter);
			
			meeting.setMeetingDay(Timestamp.valueOf(dateTime));
			
			int result = meetingService.insertMeeting(meeting);
			if(result>0) {
				return "redirect:/meeting";
			} else {
				model.addAttribute("msg","모임 등록 중 오류 발생");
				return "common/error";
			}
		} catch (Exception e) {
			// TODO: handle exception
//			model.addAttribute("msg",e.getMessage());
			e.printStackTrace();
			return "common/error";
		}
	}
	
	
}