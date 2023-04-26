package com.kh.spouting.cart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
			mv.addObject("cList", cList).setViewName("shop/cart/list");
		} else {
			mv.addObject("cList", null).setViewName("shop/cart/list");
		}
		return mv;
	}
	
	// 장바구니 상태 마크
	@ResponseBody
	@RequestMapping(value="/cart/mark", method=RequestMethod.POST)
	public String markCart(HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser != null) {
			int countCart = cService.getCountCart(loginUser.getUserId());
			if(countCart > 0) {
				return countCart + "";
			} else {
				return "";
			}
		} else {
			return "";
		}
	}
	
	// 장바구니 추가 : 장바국니에 해당 상품이 없을 경우 insert, 있을 경우 update
	@ResponseBody
	@RequestMapping(value="/cart/register", method=RequestMethod.POST)
	public String registerCart(@ModelAttribute Cart cart) {
		if(cService.registerCart(cart)>0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 장바구니 수량 변경 ajax
	@ResponseBody
	@RequestMapping(value="/cart/modify", method=RequestMethod.GET)
	public String modifyQtyCart(@ModelAttribute Cart cart, @RequestParam("isIncrease") boolean isIncrease) {
	    int result = 0;
	    if(isIncrease) {
	        result = cService.modifyQtyCartPlus(cart);
	    } else {
	        result = cService.modifyQtyCartMinus(cart);
	    }
	    if(result > 0) {
	        return "success";
	    } else {
	        return "fail";
	    }
	}


	
	// 장바구니 상품별 체크상태 변경
	@ResponseBody
	@RequestMapping(value="/cart/modifyCheck", method=RequestMethod.GET)
	public String modifyCheckCart(@ModelAttribute Cart cart) {
		if(cService.modifyCheckCart(cart) > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 장바구니 상품 일괄 체크상태 변경
	@ResponseBody
	@RequestMapping(value="/cart/modifyAllCheck", method=RequestMethod.GET)
	public String modifyAllCheckCart(@ModelAttribute Cart cart) {
		if(cService.modifyAllCheckCart(cart) > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 장바구니 삭제 ajax
	@ResponseBody
	@RequestMapping(value="/cart/remove", method=RequestMethod.GET)
	public String removeCart(@ModelAttribute Cart cart) {
		if(cService.removeCart(cart)>0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
}
