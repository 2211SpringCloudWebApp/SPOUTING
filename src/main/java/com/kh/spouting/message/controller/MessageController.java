package com.kh.spouting.message.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.spouting.user.domain.User;

@Controller
public class MessageController {
	
	//받은 메세지
	@RequestMapping(value="/message", method=RequestMethod.GET)
	public String messsageView(Model model, @SessionAttribute("loginUser") User loginUser) {
		try {
			
			return "message/message";
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg",e.getMessage());
			return "common/error";
		}
	}
	
	
	//보낸 메세지
	@RequestMapping(value="/messageSend", method=RequestMethod.GET)
	public String sendmMessageView(Model model, @SessionAttribute("loginUser") User loginUser) {
		try {
			
			return "message/messageSend";
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg",e.getMessage());
			return "common/error";
		}
	}
	
	
	//보낸 메세지
	@RequestMapping(value="/messageWrite", method=RequestMethod.GET)
	public String messageWrite(Model model, @SessionAttribute("loginUser") User loginUser) {
		try {
			
			return "message/messageWrite";
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg",e.getMessage());
			return "common/error";
		}
	}

}
