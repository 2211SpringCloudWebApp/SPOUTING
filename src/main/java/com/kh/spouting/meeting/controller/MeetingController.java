package com.kh.spouting.meeting.controller;

import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
				model.addAttribute("msg","meeting 데이터 존재하지 않음");
				return "common/error";
			}
		} catch(Exception e) {
			model.addAttribute("msg",e.getMessage());
			return "common/error";
		}
	}
	
	@RequestMapping(value="/meetingOpenPage", method=RequestMethod.GET)
	public String meetingOpenPage() {
		return "meeting/meeting-open";
	}
	
	
	@RequestMapping(value="/meetingOpen", method=RequestMethod.POST)
	public String meetingOpen(HttpServletRequest request
			,@ModelAttribute Meeting meeting
			,@RequestParam("meetingDate") String meetingDate
			,Model model) {
		try {
			System.out.println(meetingDate);
			request.setCharacterEncoding("UTF-8");
			// 2023-04-28T18:20 -> Timestamp로 바꾸기
			
			LocalDateTime d = LocalDateTime.parse(meetingDate, DateTimeFormatter.ISO_OFFSET_DATE_TIME);
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			System.out.println(d.format(formatter));
			
			
		    
		    
		    
			
			meeting.setMeetingDay(Timestamp.valueOf(d.format(formatter)));
//			meeting.setMeetingDay(meetingDate); --> meetingDay 데이터타입을 String으로 바꿨을 때 이렇게 쓰면 됨
			
			
			
			int result = meetingService.insertMeeting(meeting);
			if(result>0) {
				return "redirect:/meeting.jsp";
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