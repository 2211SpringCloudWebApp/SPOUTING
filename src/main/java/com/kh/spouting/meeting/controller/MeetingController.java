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

import com.kh.spouting.meeting.domain.Lineup;
import com.kh.spouting.meeting.domain.Meeting;
import com.kh.spouting.meeting.service.MeetingService;
import com.kh.spouting.user.domain.User;

@Controller
public class MeetingController {
	
	@Autowired
	private MeetingService meetingService;

	//커뮤니티 목록 페이지
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
	
	//커뮤니티 주최 페이지
	@RequestMapping(value="/meetingOpenPage", method=RequestMethod.GET)
	public String meetingOpenPage(Model model) {
//		, @SessionAttribute("loginUser") User loginUser 이부분 지움~!~! 나중에 복기용으로 남겨두기
//		model.addAttribute("loginUser",loginUser);
		return "meeting/meeting-open";
	}
	
	//커뮤니티 주최 데이터 넘겨주기
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
	
	// 소셜링 상세 페이지 예제
	@RequestMapping(value="/meetingDetailPageHard", method=RequestMethod.GET)
	public String meetingDetailPageEx(Model model) {
		return "meeting/meeting-detail-hard";
	}
	
	// 소셜링 상세 페이지
	@RequestMapping(value="/meetingDetailPage", method=RequestMethod.GET)
	public String meetingDetailPage(@RequestParam("meetingNo") int meetingNo, Model model) {
		Meeting meeting = meetingService.selectOneByNumber(meetingNo);
		int lineupCount = meetingService.getLineupCount(meetingNo);
		model.addAttribute("meeting", meeting);
		model.addAttribute("lineupCount", lineupCount);
		return "meeting/meeting-detail";
	}
	
	//소셜링 참여
	@RequestMapping(value="/joinMeeting", method=RequestMethod.GET)
	public String meetingJoin(@RequestParam("meetingNo") int meetingNo,
							@SessionAttribute("loginUser") User loginUser
							,Model model) {
		try {
			Lineup JoinMember = new Lineup(meetingNo, loginUser.getUserNo());
			int result = meetingService.joinMeeting(JoinMember);
			if(result > 0) {
				return "redirect:/meeting";
			} else {
				model.addAttribute("msg","이미 참여신청한 소셜링입니다.");
				return "common/error";
			}			
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg","이미 참여신청한 소셜링입니다.");
			return "common/error";
		}
	}
	
}