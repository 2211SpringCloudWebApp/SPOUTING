package com.kh.spouting.inquiry.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spouting.book.domain.Book;
import com.kh.spouting.book.service.BookService;
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
	private BookService bService;
	
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
	public ModelAndView viewInquiryWrite(ModelAndView mv, HttpSession session) {
		//츄가|문의게시판용: 예약내역페이지(이용전) 보이기
		User user = (User) session.getAttribute("loginUser");
		List<Book> myBookList = bService.getMyBooking(user.getUserNo());
		mv.addObject("bList", myBookList).setViewName("inquiry/write");
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
			, @RequestParam(value="bookNo", required=false) Integer bookNo
			//int는 null로 받아올수 없고 래퍼클래스는 가능!
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
	
	/**
	 * 문의사항 비밀번호체크 View Controller
	 * @param mv
	 * @param inquiriesNo
	 * @return mv
	 */
	@RequestMapping(value="/checkSecretNo", method=RequestMethod.GET)
	public ModelAndView viewCheckSecretNo(ModelAndView mv, @RequestParam Integer inquiriesNo) {
		InquiryJoin inquiry = iService.detailInquiry(inquiriesNo);
		mv.addObject("inquiry", inquiry).setViewName("inquiry/checkSecretNo");
		return mv;
	}
	
	/**
	 * 문의사항 비밀번호체크 Controller
	 * @param mv
	 * @param inquiriesNo
	 * @param secretNo
	 * @return mv
	 */
	@RequestMapping(value="/checkSecretNo", method=RequestMethod.POST)
	public ModelAndView checkSecretNo(ModelAndView mv, int inquiriesNo, int secretNo) {
		try {
			InquiryJoin iParam = new InquiryJoin(inquiriesNo, secretNo);
			InquiryJoin inquiry = iService.checkSecretNo(iParam);
			if(inquiry != null) {
				mv.addObject("inquiry", inquiry).setViewName("redirect:/inquiry/detail?inquiriesNo=" + inquiriesNo);
			}else {
				mv.addObject("msg", "비밀번호틀림").setViewName("common/error");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	/**
	 * 문의사항 수정 View Controller
	 * @param mv
	 * @param inquiry
	 * @return mv
	 */
	@RequestMapping(value="/modifyView", method=RequestMethod.POST)
	public ModelAndView viewModifyInquiry(ModelAndView mv, @ModelAttribute Inquiry inquiry) {
		InquiryJoin inquiryResult = iService.detailInquiry(inquiry.getInquiriesNo());
		mv.addObject("inquiry", inquiryResult).setViewName("inquiry/modify");
		return mv;
	}
	
	/**
	 * 문의사항 수정 Controller
	 * @param mv
	 * @param inquiry
	 * @param reloadFile
	 * @param request
	 * @return mv
	 */
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public ModelAndView modifyInquiry(ModelAndView mv, @ModelAttribute Inquiry inquiry
			, @RequestParam(value="reloadFile", required=false) MultipartFile reloadFile
			, HttpServletRequest request) {
		Map<String, String> modifyFile = null;
		try {
			InquiryJoin originalInquiry = iService.detailInquiry(inquiry.getInquiriesNo());
			
			// 파일 재첨부가 있는 경우
			if(!reloadFile.isEmpty()) {
				// 원래글에 파일이 있는 경우
				if(originalInquiry.getInquiriesFilerename() != null) {
					// 원래 파일 삭제
					this.deleteFile(request, originalInquiry.getInquiriesFilerename());
				}
				modifyFile = fileUtil.saveFile(reloadFile, request, "inquiry");
				if(modifyFile != null) {
					inquiry.setInquiriesFilename(modifyFile.get("original"));
					inquiry.setInquiriesFilepath(modifyFile.get("renameFilepath"));
					inquiry.setInquiriesFilerename(modifyFile.get("rename"));
				}
			}
			// 파일 재첨부가 없는 경우
			else {
				// 원래글에 파일이 있는 경우
				if(originalInquiry.getInquiriesFilerename() != null) {
					// 파일명과 파일경로를 그대로 사용
					inquiry.setInquiriesFilepath(originalInquiry.getInquiriesFilepath());
					inquiry.setInquiriesFilerename(originalInquiry.getInquiriesFilerename());
				}
			}
			int result = iService.modifyInquiry(inquiry);
			if(result > 0) {
				mv.addObject("msg", "문의사항수정이 완료되었습니다!").setViewName("notice/success");
			}else {
				mv.addObject("msg", "문의사항수정이 완료되지 않았습니다.").setViewName("common/error");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	// 삭제
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public ModelAndView deleteInquiry(ModelAndView mv, @ModelAttribute Inquiry inquiry
			, HttpServletRequest request) {
		try {
			// 파일먼저 삭제해주기
			InquiryJoin rmInquiry = iService.detailInquiry(inquiry.getInquiriesNo());
			if(rmInquiry.getInquiriesFilerename() != null) {
				this.deleteFile(request, rmInquiry.getInquiriesFilerename());
			}
			// 파일삭제 후 글 삭제
			int result = iService.deleteInquiry(inquiry.getInquiriesNo());
			if(result > 0) {
				mv.addObject("msg", "문의사항 삭제 완료").setViewName("notice/success");
			}else {
				mv.addObject("msg", "문의사항이 삭제되지 않았습니다.").setViewName("common/error");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	/**
	 * 파일삭제
	 * @param request
	 * @param filename
	 */
	private void deleteFile(HttpServletRequest request, String filename) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String deletePath = root + "\\images\\inquiry";
		String deleteFilepath = deletePath + "\\" + filename;
		File deleteFile = new File(deleteFilepath);
		// 삭제할 파일 존재하면
		if(deleteFile.exists()) {
			deleteFile.delete();
		}
	}
	
	// ******* 좋아요 테스트중
	@ResponseBody
	@RequestMapping(value="inputLike", method=RequestMethod.POST)
	public String updateLike(Inquiry inquiry) {
		try {
			iService.updateLike(inquiry);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return " fail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/like")
	public Inquiry getTotalLike(int inquiriesNo) {
		Inquiry inquiry = iService.getTotalLike(inquiriesNo);
		return inquiry;
	}
}
