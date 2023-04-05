package com.kh.spouting.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String indexPage() {
		return "home";
	}
	
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public String testPage() {
		return "test";
	}

}
