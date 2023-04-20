package com.kh.spouting.cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.spouting.cart.service.CartService;

public class CartController {
	
	@Autowired
	private CartService cService;

	// 장바구니 페이지 이동
	@RequestMapping(value="/shop/cart", method=RequestMethod.GET)
	public String cartView() {
		return "cart/main";
	}
	
	// 장바구니 추가
	@RequestMapping("/insert")
	public String insertCart( ) {
		return "";
	}
}
