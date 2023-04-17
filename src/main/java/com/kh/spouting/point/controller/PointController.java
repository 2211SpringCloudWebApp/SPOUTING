package com.kh.spouting.point.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.spouting.user.domain.User;

@Controller
public class PointController {

	@GetMapping("/point/charge") //포인트 충전 View
	public String pointChargeView(
			HttpServletRequest request
			, Model model) {
		HttpSession session = request.getSession();
		int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
		return "point/charge";	
	}
	
	
	
	
}
