package com.kh.spouting.point.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.point.domain.Point;
import com.kh.spouting.point.service.PointService;
import com.kh.spouting.user.domain.User;
import com.kh.spouting.user.service.UserService;

@Controller
public class PointController {

	@Autowired
	private PointService pService;
	@Autowired
	private UserService uService;
	
	@GetMapping("/point/charge") //포인트 충전 View
	public String pointChargeView(
			HttpServletRequest request
			, Model model) {
		HttpSession session = request.getSession();
		int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
		Integer userPoint = pService.getUserPoint(userNo);
		if(userPoint == null) {
			model.addAttribute("userPoint", 0);
			return "point/charge";
		} else {
			model.addAttribute("userPoint", userPoint);
			return "point/charge";	
		}
	}
	
	@PostMapping("/point/charge") //포인트 충전 Logic
	public String pointChargeLogic(
			HttpServletRequest request
			, @RequestParam int pointBuy
			, Point point
			, Model model) {
		HttpSession session = request.getSession();
		int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
		point.setPointBuy(pointBuy);
		point.setUserNo(userNo);
		int result = pService.insertPoint(point);
		if(result > 0) {
			return "redirect:/point/detail";
		} else {
			model.addAttribute("msg", "포인트 충전 오류입니다.");
			return "common/error";
		}
	}
	
	@GetMapping("/point/detail") //포인트 상세 View
	public String pointDetailView(
			HttpServletRequest request
			, @RequestParam(value="page", required=false, defaultValue="1") Integer page
			, Model model) {
		HttpSession session = request.getSession();
		int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
		Integer userPoint = pService.getUserPoint(userNo);
		if(userPoint == null) {
			model.addAttribute("userPoint", 0);
		} else {
			model.addAttribute("userPoint", userPoint);
		}
		int totalCount = pService.getPointCount(userNo);
		PageInfo pi = getPageInfo(page, totalCount);
		
		List<Point> pList = pService.selectPointDetail(userNo, pi);
		if(!pList.isEmpty()) {
			model.addAttribute("pList", pList);
			model.addAttribute("pi", pi);
			return "point/detail";
		} else {
			return "point/charge";
		}
	}
	
	/*===================================================
	 * 관리자
	 *===================================================*/
	@GetMapping("/admin/point") //포인트조회 View
	public String adminPointView(
			@RequestParam(value="page", required=false, defaultValue="1") Integer page
			, @RequestParam int userNo
			, Model model) {		
		model.addAttribute("userNo", userNo);
		
		User user = uService.selectName(userNo);
		String userName = user.getUserName();
		model.addAttribute("userName", userName);
		
		Integer userPoint = pService.getUserPoint(userNo);
		if(userPoint == null) {
			model.addAttribute("userPoint", 0);
		} else {
			model.addAttribute("userPoint", userPoint);
		}
		int totalCount = pService.getPointCount(userNo);
		PageInfo pi = getPageInfo(page, totalCount);
		
		List<Point> pList = pService.selectPointDetail(userNo, pi);
		if(!pList.isEmpty()) {
			model.addAttribute("pList", pList);
			model.addAttribute("pi", pi);
			return "admin/point";
		} else {
			model.addAttribute("pList", null);
			return "admin/point";
		}	
	}
	
	@PostMapping("/admin/managePoint")
	public String adminPointChange( //관리자 포인트 조정 Logic
			Model model
			, @RequestParam int pointChange
			, @RequestParam int userNo
			, Point point) {
		point.setPointChange(pointChange);
		point.setUserNo(userNo);
		int result = pService.adminPoint(point);
		if(result > 0) {
			return "redirect:/admin/point?userNo="+userNo;
		} else {
			model.addAttribute("msg", "포인트 충전 오류입니다.");
			return "common/error";
		}
	}
		
	/*===================================================
	 * 페이징
	 *===================================================*/
	private PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		int boardLimit = 8;
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
