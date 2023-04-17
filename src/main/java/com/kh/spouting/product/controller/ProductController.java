package com.kh.spouting.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.product.domain.Product;
import com.kh.spouting.product.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService pService;
	
	// 페이징 처리
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

	// 쇼핑몰 메인페이지 이동
	@RequestMapping(value="/shop/main", method=RequestMethod.GET)
	public String mainPage() {
		return "shop/main";
	}
	
	// 상품 목록 전체 조회
	@RequestMapping(value="/shop/productList", method=RequestMethod.GET)
	public ModelAndView list(ModelAndView mv, 
			@RequestParam(value="page", required=false, defaultValue="1") Integer page) {
		int totalCount = pService.getListCount();
		PageInfo pi = this.getPageInfo(page, totalCount);
		List<Product> pList = pService.selectAllProduct(pi);
		mv.addObject("pi", pi).addObject("pList", pList).setViewName("/shop/productList");
	    return mv;
	}
	
	// 상품 1차 카테고리 목록 조회
	@RequestMapping(value="/shop/catelist1", method=RequestMethod.GET)
	public ModelAndView list(ModelAndView mv,
	                         @RequestParam(value="page", required=false, defaultValue="1") Integer page,
	                         @RequestParam(value="c", required=false) int[] categoryNos, // 카테고리 번호 배열로 변경
	                         @RequestParam(value="categoryNo", required=false) int categoryNo
							) {
		try {
			int totalCount = pService.getListCountByCate(categoryNo); // 카테고리 내 게시글 수 만큼만 전체 게시글 수 따오기
			PageInfo pi = this.getPageInfo(page, totalCount);
			List<Product> cateList = pService.selectCateProduct1(pi, categoryNos); // 카테고리 번호 배열 전달
			String strCategoryNo = ""; // 배열을 스트링으로 변환
			for(int i=0; i < categoryNos.length; i++) {
				if(i != categoryNos.length-1) {
					strCategoryNo += categoryNos[i] + ",";
				}else {
					strCategoryNo += categoryNos[i];
				}
			}
			mv.addObject("pi", pi).addObject("cateList", cateList).addObject("c", strCategoryNo).setViewName("/shop/categoryList1");
		} catch (Exception e) {
			mv.addObject("msg", "상위 카테고리 상품 조회에 실패했습니다.").setViewName("common/error");
		}
	    return mv;
	}
	
	// 상품 2차 카테고리 목록 조회
	@RequestMapping(value="/shop/catelist2", method=RequestMethod.GET)
	public ModelAndView list(ModelAndView mv,
			@RequestParam("c") int categoryNo,
			Model model) {
		try {
			List<Product> cateList = pService.selectCateProduct2(categoryNo);
			mv.addObject("cateList", cateList).setViewName("/shop/categoryList2");
		} catch (Exception e) {
			mv.addObject("msg", "하위 카테고리 상품 조회에 실패했습니다.").setViewName("common/error");
		}
		return mv;
	}
	
	// 조건부 검색
	@RequestMapping(value="/product/search", method=RequestMethod.GET)
	public String productSearchView(
			@ModelAttribute Search search
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			, Model model) {
		try {
			System.out.println(search.toString());
			int totalCount = pService.getListCount(search);
			PageInfo pi = this.getPageInfo(currentPage, totalCount);
			List<Product> searchList = pService.selectListByKeyword(pi, search);
			if(!searchList.isEmpty()) {
				model.addAttribute("search", search);
				model.addAttribute("pi", pi);
				model.addAttribute("sList", searchList);
				return "shop/search";
			} else {
				model.addAttribute("msg", "데이터 조회에 실패했습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 상품 상세페이지 조회
	@RequestMapping(value="/product/detail", method=RequestMethod.GET)
	public String detailProduct(@RequestParam("productNo") int productNo, Model model) {
		try {
			Product product = pService.selectOneByNo(productNo);
			model.addAttribute("product", product);
			return "shop/detailProduct";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	
}
