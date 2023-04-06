package com.kh.spouting.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.spouting.user.domain.User;
import com.kh.spouting.user.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService uService;
	
	@GetMapping("/")
	public String indexPage() {
		return "home";
	}
	
	
	/*===================================================
	 * 로그인 기능
	 *===================================================*/
	// 유저 로그인

	// 아이디 찾기
	
	// 비밀번호 찾기
	
	

	/*===================================================
	 * 회원가입 기능
	 *===================================================*/
	
	// 회원가입
	@GetMapping("/user/register") //회원가입 View
	public String registerView() {
		return "user/register";
	}
	
	@PostMapping("/user/register") //회원가입 Logic
	public String registerLogic(Model model, User user) {
		int result = uService.insertUser(user);
		if(result > 0) {
			return "redirect:/";
		} else {
			model.addAttribute("msg", "회원가입이 완료하지 못했습니다.");
			return "common/error";
		}
	}
	
	// 유저 탈퇴
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
