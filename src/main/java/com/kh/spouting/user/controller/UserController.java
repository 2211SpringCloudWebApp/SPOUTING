package com.kh.spouting.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	// 로그인
	@GetMapping("/user/login") //로그인 View
	public String loginView() {
		return "user/login";
	}
	
	@PostMapping("/user/loginCheck")
	@ResponseBody
	public String loginCheckLogic(  //로그인 ajax Logic
			HttpServletRequest request
			, String userId
			, String userPw) {
		HttpSession session = request.getSession();
		User uParam = new User(userId, userPw);
		User user = uService.selectIdPw(uParam);
		if(user != null) {
			if(user.getUserType() == 0) {
				session.setAttribute("loginUser", user);
				return "user";
			} else {
				session.setAttribute("loginUser", user);
				return "admin";
			}
		} else {
			return "false";
		}	
	}
	
	// 로그아웃
	@GetMapping("/user/logout")
	public String logoutLogic(
			HttpSession session
			, Model model) {
		if(session != null) {
			session.invalidate();
			return "redirect:/";
		} else {
			model.addAttribute("msg", "로그아웃을 완료하지 못했습니다.");
			return "common/error";
		}
	}
	
	// 아이디 찾기
	@GetMapping("/user/findid") 
	public String findidView() { //아이디찾기 View
		return "user/findid";
	}
	
	@PostMapping("/user/findid")
	@ResponseBody
	public String findidLogic( //아이디찾기 ajax Logic
			String userName
			,String userEmail) {
		User uParam = new User();
		uParam.setUserName(userName);
		uParam.setUserEmail(userEmail);
		User user = uService.findId(uParam);
		if(user != null ) {
			return user.getUserId();
		} else {
			return "false";
		}
	}
	// 비밀번호 찾기
	@GetMapping("/user/findpw") 
	public String findpwView() { //아이디찾기 View
		return "user/findpw";
	}
	
	@PostMapping("/user/findpw")
	@ResponseBody
	public String findpwLogic( //아이디찾기 ajax Logic
			String userId
			,String userEmail) {
		User uParam = new User();
		uParam.setUserId(userId);
		uParam.setUserEmail(userEmail);
		User user = uService.findPw(uParam);
		if(user != null ) {
			return user.getUserPw();
		} else {
			return "false";
		}
	}
	

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
	
	//아이디 중복 체크
	@GetMapping("/user/register/idCheck")
	public String idCheckLogic(String userId) {
		User user = uService.selectOneById(userId);
		if(user != null) {
			return "false";
		} else {
			return "true";
		}
	}
	
	//이메일 인증

	
	/*===================================================
	 * 마이페이지 기능
	 *===================================================*/
	
	// 회원 탈퇴
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
