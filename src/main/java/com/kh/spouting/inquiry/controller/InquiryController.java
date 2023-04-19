package com.kh.spouting.inquiry.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.inquiry.domain.Inquiry;
import com.kh.spouting.inquiry.domain.InquiryJoin;
import com.kh.spouting.inquiry.service.InquiryService;
import com.kh.spouting.user.domain.User;

@Controller
@RequestMapping(value="/inquiry")
public class InquiryController {

	@Autowired
	private InquiryService iService;
	
	/**
	 * 문의사항 리스트 Controller
	 * @param mv
	 * @param session
	 * @param page
	 * @return mv
	 */
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView viewInquiryList(
			ModelAndView mv
			, HttpSession session
			, @RequestParam(value="page", required = false, defaultValue = "1") Integer page) {
		try {
			// 페이징처리
			int totalCount = iService.getInquiryCount();
			PageInfo pi = this.getPageInfo(page, totalCount);
			// 로그인유저정보 보내기
			User user = (User) session.getAttribute("loginUser");
			List<InquiryJoin> iList = iService.selectAllInquiry(pi);
			mv.addObject("iList", iList).addObject("user", user).addObject("pi", pi).setViewName("inquiry/list");
		} catch (Exception e) {
			mv.addObject("msg", "문의사항 페이지 에러발생").setViewName("common/error");
		}
		return mv;
	}
	
	// 문의사항 검색
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public ModelAndView searchInquiry(
			ModelAndView mv
			, @ModelAttribute Search search
			, @RequestParam(value="page", required=false, defaultValue="1") Integer page) {
		try {
			int totalCount = iService.getSearchInquiryCount(search);
			PageInfo pi = this.getPageInfo(page, totalCount);
			
			List<Inquiry> iList = iService.searchInquiry(search, pi);
			
			if(!iList.isEmpty()) {
				mv.addObject("iList", iList).addObject("pi", pi).addObject("search", search).setViewName("inquiry/search");
			}else {
				mv.addObject("msg", "검색하신 문의사항이 존재하지 않습니다.").setViewName("common/error");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	// 페이징 처리하기
	private PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		int boardLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		
		maxPage = (int) Math.ceil((double)totalCount / boardLimit);
		startNavi = (((int)((double)currentPage / naviLimit + 0.9)) - 1) * naviLimit +  1;
		endNavi = startNavi + naviLimit - 1;
		if(endNavi > maxPage) {
			endNavi = maxPage;
		}
		pi = new PageInfo(currentPage, boardLimit, naviLimit, startNavi, endNavi, totalCount, maxPage);
		return pi;
	}
}
