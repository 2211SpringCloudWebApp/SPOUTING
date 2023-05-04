package com.kh.spouting.user.controller;

import java.util.List;

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
import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
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
	public String registerView(HttpSession session, Model model) {
		User user = (User)session.getAttribute("loginUser");
		if(user != null) {
			model.addAttribute("msg", "로그인 상태에서는 회원가입을 진행할 수 없습니다.");
			return "common/error"; 
		} else {
			return "user/register";		
		}
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
	
	//이메일 중복 체크 ajax
	@GetMapping("/user/register/emailCheck")
	@ResponseBody
	public String emailCheckLogic(String userEmail) {
		User user = uService.selectOneByMail(userEmail);
		if(user != null) {
			return "false";
		} else {
			return "true";
		}
	}
	
	//이메일 인증 ajax
	@GetMapping("/user/register/mailCheck")
	@ResponseBody
	public String mailCheckLogic(String userEmail) {
		System.out.println(userEmail);
		String code = mailService.registerEmail(userEmail);
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
	@GetMapping("/user/delete")
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
			return "common/error";
		}
	}
	
	
	/*===================================================
	 * 관리자 기능
	 *===================================================*/	
	//관리자 2차 확인 View
	@GetMapping("/admin/check")
	public String adminCheckView() {
		return "admin/check";
	}
	
	//관리자 메인 View
	@GetMapping("/admin/adminMain")
	public String adminMainView() {
		return "admin/adminMain";
	}
	
	//회원 목록 View
	@GetMapping("/admin/user")
	public String userListView(
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page
			, Model model) {
		int totalCount = uService.getUserCount();
		PageInfo pi = getPageInfo(page, totalCount);
		List<User> uList = uService.selectAllUser(pi);
		if(!uList.isEmpty()) {
			model.addAttribute("uList", uList);
			model.addAttribute("pi", pi);
			return "admin/user";
		} else {
			model.addAttribute("msg", "회원 없음");
			return "common/error";
		}
	}
	
	//회원 탈퇴
	@GetMapping("/admin/delete")
	public String dropUser(
			@RequestParam("userId") String userId
			,Model model) {
		try {
			model.addAttribute("user", userId);
			int result = uService.deleteUser(userId);
			if(result > 0) {
				return "redirect:/admin/user";
			}else {
				model.addAttribute("msg", "탈퇴가 완료되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	//회원 검색
	@GetMapping("/admin/userSearch")
	public String userSearchView(
			@ModelAttribute Search search
			, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage
			, Model model ) {
		try {
			int totalCount = uService.getUserCount(search);
			PageInfo pi = this.getPageInfo(currentPage, totalCount);
			List<User> uList = uService.selectByKeyWord(pi, search);
			if(!uList.isEmpty()) {
				model.addAttribute("search", search);
				model.addAttribute("pi", pi);
				model.addAttribute("uList", uList);
				return "admin/userSearch";
			} else {
				model.addAttribute("uList", null);
				return "admin/userSearch";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
		
	
	
	
	
	/*===================================================
	 * 페이징
	 *===================================================*/
	private PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		int boardLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		
		maxPage = (int)((double)totalCount/boardLimit+0.9);
		startNavi = (((int)((double)currentPage/naviLimit+0.9))-1)*naviLimit+1;
		endNavi = startNavi + naviLimit - 1;
		if(endNavi > maxPage) {
			endNavi = maxPage;
		}
		pi = new PageInfo(currentPage, boardLimit, naviLimit, startNavi, endNavi, totalCount, maxPage);
		return pi;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
