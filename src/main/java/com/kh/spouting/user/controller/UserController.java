package com.kh.spouting.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spouting.common.MailSendService;
import com.kh.spouting.user.domain.User;
import com.kh.spouting.user.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService uService;
	@Autowired
	private MailSendService mailService;
	
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
	
	@PostMapping("/user/loginCheck") //로그인 ajax Logic
	@ResponseBody
	public String loginCheckLogic(  
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
	@GetMapping("/user/findid")  //아이디찾기 View
	public String findidView() { 
		return "user/findid";
	}
	
	@PostMapping("/user/findid") //아이디찾기 ajax Logic
	@ResponseBody
	public String findidLogic( 
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
	@GetMapping("/user/findpw")  //아이디찾기 View
	public String findpwView() { 
		return "user/findpw";
	}
	
	@PostMapping("/user/findpw") //아이디찾기 ajax Logic
	@ResponseBody
	public String findpwLogic( 
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
			model.addAttribute("msg", "회원가입을 완료하지 못했습니다.");
			return "common/error";
		}
	}
	
	//아이디 중복 체크 ajax
	@GetMapping("/user/register/idCheck")
	@ResponseBody
	public String idCheckLogic(String userId) {
		User user = uService.selectOneById(userId);
		if(user != null) {
			return "false";
		} else {
			return "true";
		}
	}
	
	//이메일 인증 ajax
	@GetMapping("/user/register/mailCheck")
	@ResponseBody
	public String mailCheckLogic(String email) {
		String code = mailService.registerEmail(email);
		return code;
	}

	
	/*===================================================
	 * 마이페이지 기능
	 *===================================================*/
	
	//정보수정 전 비번확인
	@GetMapping("/mypage/myinfo") //View
	public String myinfoView() {
		return "mypage/myinfo";
	}
	
	//회원 정보수정
	@GetMapping("/user/modify") //회원정보 수정 View
	public String userModifyView(HttpSession session, Model model) {
		User userOne = (User)session.getAttribute("loginUser");
		String userId = userOne.getUserId();
		User user = uService.selectOneById(userId);
		model.addAttribute("user", user);
		return "user/modify";
	}
	
	@PostMapping("/user/modify") //회원정보 수정 Logic
	public String userModifyLogic(
			@ModelAttribute User user
			, Model model) {
		try {
			int result = uService.updateUser(user);
			if(result > 0) {
				model.addAttribute("user", user);
				return "redirect:/user/modify";
			}else {
				model.addAttribute("msg", "정보수정에 실패하였습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "정보수정 실패.");
			return "common/error";
		}
		
	}
	
	//회원 탈퇴
	@GetMapping("/user/delete") //회원탈퇴
	public String removeUser(
			@RequestParam("userId") String userId
			,Model model) {
		try {
			int result = uService.deleteUser(userId);
			model.addAttribute("user", userId);
			if(result > 0) {
				return "redirect:/user/logout";
			}else {
				model.addAttribute("msg", "탈퇴가 완료되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "member/modify";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
