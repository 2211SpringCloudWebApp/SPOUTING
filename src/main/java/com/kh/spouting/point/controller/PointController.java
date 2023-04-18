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

import com.kh.spouting.point.domain.Point;
import com.kh.spouting.point.service.PointService;
import com.kh.spouting.user.domain.User;

@Controller
public class PointController {

	@Autowired
	private PointService pService;
	
	@GetMapping("/point/charge") //포인트 충전 View
	public String pointChargeView(
			HttpServletRequest request
			, Model model) {
		HttpSession session = request.getSession();
		int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
		int userPoint = pService.getUserPoint(userNo);
		model.addAttribute("userPoint", userPoint);
		return "point/charge";	
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
			return "point/detail";
		} else {
			model.addAttribute("msg", "포인트 충전 오류입니다.");
			return "common/error";
		}
	}
	
	@GetMapping("/point/detail") //포인트 상세 View
	public String pointDetailView(
			HttpServletRequest request
			, Model model) {
		HttpSession session = request.getSession();
		int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
		int userPoint = pService.getUserPoint(userNo);
		List<Point> pList = pService.selectPointDetail(userNo);
		if(!pList.isEmpty()) {
			model.addAttribute("userPoint", userPoint);
			model.addAttribute("pList", pList);
			return "point/detail";
		} else {
			return "point/charge";
		}
	}
	
	
	
}
