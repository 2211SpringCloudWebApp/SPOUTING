package com.kh.spouting.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spouting.common.PageInfo;
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
	public ModelAndView list(ModelAndView mv, @RequestParam(value="page", required=false, defaultValue="1") Integer page) {
		int totalCount = pService.getListCount();
		PageInfo pi = this.getPageInfo(page, totalCount);
		List<Product> pList = pService.selectAllProduct(pi);
		mv.addObject("pi", pi).addObject("pList", pList).setViewName("/shop/productList");
	    return mv;
	}
	
	// 페이지 처리
	private PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		int boardLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		
		maxPage = (int) Math.ceil((double)totalCount / boardLimit);
		startNavi = (((int)((double)currentPage / naviLimit + 0.9)) - 1) * naviLimit + 1 ;
		endNavi = startNavi + naviLimit - 1;
		if(endNavi > maxPage) {
			endNavi = maxPage;
		}
		pi = new PageInfo(currentPage, boardLimit, naviLimit, startNavi, endNavi, totalCount, maxPage);
		return pi;
	}
	
	
	
	
	
}
