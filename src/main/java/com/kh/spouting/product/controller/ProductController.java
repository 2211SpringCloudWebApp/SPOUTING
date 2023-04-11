package com.kh.spouting.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spouting.product.domain.Product;
import com.kh.spouting.product.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService pService;
	
	// 쇼핑몰 메인페이지 이동
	@RequestMapping(value="/shop/main", method=RequestMethod.GET)
	public String mainPage() {
		return "/shop/main";
	}
	
	// 상품 목록 전체 조회
	@RequestMapping(value="/shop/productList", method=RequestMethod.GET)
	public ModelAndView list(ModelAndView mv) {
	    try {
	        List<Product> pList = pService.selectAllProduct();
	        if(pList.isEmpty()) { // 데이터가 없으면 오류 메시지 출력
	            throw new Exception("No data available");
	        }
	        mv.addObject("pList", pList).setViewName("shop/productList");
	    } catch (Exception e) {
	        mv.addObject("msg", e.getMessage()).setViewName("common/error");
	    }
	    return mv;
	}
	
}
