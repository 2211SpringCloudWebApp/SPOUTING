package com.kh.spouting.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {

	@RequestMapping(value="/shop", method=RequestMethod.GET)
	public String mainPage() {
		return "/shop/main";
	}
}