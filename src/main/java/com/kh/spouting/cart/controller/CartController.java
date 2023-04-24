package com.kh.spouting.cart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spouting.cart.domain.Cart;
import com.kh.spouting.cart.service.CartService;
import com.kh.spouting.user.domain.User;

@Controller
public class CartController {
	
	@Autowired
	private CartService cService;

	// 장바구니 페이지 이동
	@RequestMapping(value="/shop/cartView", method=RequestMethod.GET)
	public ModelAndView cartView(ModelAndView mv, Cart cart, HttpSession session) {
		cart.setUserId(((User)session.getAttribute("loginUser")).getUserId());
		List<Cart> cList = cService.printCart(cart);
		if(!cList.isEmpty()) {
			mv.addObject("cList", cList).setViewName("cart/list");
		} else {
			mv.addObject("cList", null).setViewName("cart/list");
		}
		return mv;
	}
	
	// 장바구니 추가
	@RequestMapping(value="/cart/register", method=RequestMethod.POST)
	public String registerCart(@ModelAttribute Cart cart) {
		if(cService.registerCart(cart)>0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	
	
	
	
}
