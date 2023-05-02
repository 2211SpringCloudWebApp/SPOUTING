package com.kh.spouting.message.controller;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;
import com.kh.spouting.message.domain.Message;
import com.kh.spouting.message.service.MessageService;
import com.kh.spouting.user.domain.User;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	//받은 메세지
	@RequestMapping(value="/message", method=RequestMethod.GET)
	public String messsageView(Model model, @SessionAttribute("loginUser") User loginUser) {
		try {
//			loginUser.getUserNo()
			List<Message> messageList = messageService.getMessageList(loginUser.getUserNo());
			model.addAttribute("messageList",messageList);
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
			List<Message> sendMessageList = messageService.getSendMessageList(loginUser.getUserNo());
			model.addAttribute("sendMessageList", sendMessageList);
			return "message/messageSend";
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg",e.getMessage());
			return "common/error";
		}
	}
	
	
	//메세지 상세 페이지
	@RequestMapping(value="/messageDetail", method=RequestMethod.GET)
	public String messageDetailView(Model model, @RequestParam("msgNo") int msgNo) {
		try {
			Message oneMessage = messageService.oneMessageDetail(msgNo);
			model.addAttribute("oneMessage", oneMessage);
			return "message/messageDetail";
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg",e.getMessage());
			return "common/error";
		}
	}
	
	
	//메세지 전송 페이지
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
	
	
	//메세지 전송
	@RequestMapping(value="/msgSend", method=RequestMethod.POST)
	public String sendMessage(Model model, @SessionAttribute("loginUser") User loginUser,
								@ModelAttribute Message message) {
		try {
			int result = messageService.sendMessage(message);
			List<Message> sendMessageList = messageService.getSendMessageList(loginUser.getUserNo());
			model.addAttribute("sendMessageList", sendMessageList);
			return "message/messageSend";
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg",e.getMessage());
			return "common/error";
		}
	}
	
	//회원 검색
	@ResponseBody
	@RequestMapping(value="/msgSearchUser", method=RequestMethod.GET)
	public String searchUser(Model model, @RequestParam(value="word", required=false, defaultValue="") String word, HttpServletResponse response) {
		try {
			List<User> userList = messageService.searchUser(word);
			response.setCharacterEncoding("UTF-8");
			if(!userList.isEmpty()) {
				return new Gson().toJson(userList);
			} else {
//				return null;
				return new Gson().toJson(userList);

			}
			
		} catch (Exception e) {
			// TODO: handle exception
			return e.getMessage();
		}
	}

}
