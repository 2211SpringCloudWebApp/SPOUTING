package com.kh.spouting.inquiry.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spouting.common.FileUtil;
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
	
	@Autowired
	@Qualifier("fileUtil")
	private FileUtil fileUtil;
	
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
	
	/**
	 * 문의사항 검색 Controller
	 * @param mv
	 * @param search
	 * @param page
	 * @return mv
	 */
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
	
	/**
	 * 문의사항 등록 View Controller
	 * @param mv
	 * @return mv
	 */
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public ModelAndView viewInquiryWrite(ModelAndView mv) {
		mv.setViewName("inquiry/write");
		return mv;
	}
	
	/**
	 * 문의사항 등록 Controller
	 * @param mv
	 * @param session
	 * @param request
	 * @param inquiry
	 * @param multi
	 * @return mv
	 */
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public ModelAndView writeInquiry(
			ModelAndView mv
			, HttpSession session
			, HttpServletRequest request
			, @ModelAttribute Inquiry inquiry
			, @RequestParam(value="uploadFile", required=false) MultipartFile multi) {
		// 파일전송
		Map<String, String> fileInfo = null;
		try {
			// 로그인한 정보 가져와서 작성자로 넣기
			User user = (User) session.getAttribute("loginUser"); 
			int inquiryWriterNo = user.getUserNo();
			
			// 첨부파일이 있는 경우
			if(multi.getSize() != 0 && !multi.getOriginalFilename().equals("")) {
				fileInfo = fileUtil.saveFile(multi, request, "inquiry");
				inquiry.setInquiriesFilename(fileInfo.get("original"));
				inquiry.setInquiriesFilerename(fileInfo.get("rename"));
				inquiry.setInquiriesFilepath(fileInfo.get("renameFilepath"));
			}
			inquiry.setUserNo(inquiryWriterNo);
			int result = iService.insertInquiry(inquiry);
			if(result > 0) {
				mv.addObject("msg", "문의사항이 등록완료되었습니다!😎").setViewName("notice/success");
			}else {
				mv.addObject("msg", "문의사항이 등록되지 않았습니다.").setViewName("common/error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	/**
	 * 문의사항 디테일 Controller
	 * @param mv
	 * @param inquiriesNo
	 * @param session
	 * @return mv
	 */
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public ModelAndView detailInquiry(
			ModelAndView mv, @RequestParam Integer inquiriesNo
			, HttpSession session) {
		try {
			//글 작성자 확인
			User user = (User) session.getAttribute("loginUser");
			InquiryJoin inquiry = iService.detailInquiry(inquiriesNo);
			mv.addObject("user", user).addObject("inquiry", inquiry).setViewName("inquiry/detail");
		} catch (Exception e) {
			mv.addObject("msg", "해당 문의사항이 존재하지 않습니다.").setViewName("common/error");
		}
		return mv;
	}
}
