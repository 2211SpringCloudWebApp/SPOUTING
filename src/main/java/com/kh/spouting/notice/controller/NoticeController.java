package com.kh.spouting.notice.controller;

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

import com.kh.spouting.common.FileUtil;
import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.notice.domain.Notice;
import com.kh.spouting.notice.domain.NoticeJoin;
import com.kh.spouting.notice.service.NoticeService;
import com.kh.spouting.user.domain.User;

@Controller
@RequestMapping(value="/notice")
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
	@Autowired
	@Qualifier("fileUtil")
	private FileUtil fileUtil;

	/**
	 * 공지사항 리스트 Controller
	 * @param mv
	 * @return mv
	 */
	@RequestMapping(value="/list", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public ModelAndView viewNoticeList(
			ModelAndView mv
			, HttpSession session
			, @RequestParam(value="page", required = false, defaultValue = "1") Integer page) {
		try {
			// 페이징처리
			int totalCount = nService.getNoticeCount();
			PageInfo pi = this.getPageInfo(page, totalCount);
			// 로그인유저정보 보내기(관리자전용버튼위해서)
			User user = (User) session.getAttribute("loginUser");
			List<NoticeJoin> nList = nService.selectAllNotice(pi);
			mv.addObject("nList", nList).addObject("user", user).addObject("pi", pi).setViewName("notice/list");
		} catch (Exception e) {
			mv.addObject("msg", "공지사항 페이지 에러발생").setViewName("common/error");
		}
		return mv;
	}
	
	/**
	 *  공지사항 디테일 Controller
	 * @param mv
	 * @param noticeNo
	 * @return mv
	 */
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public ModelAndView viewNoticeDetail(ModelAndView mv, @RequestParam Integer noticeNo, HttpSession session) {
		try {
			User user = (User) session.getAttribute("loginUser");
			Notice notice = nService.selectOneNotice(noticeNo);
			mv.addObject("notice", notice).addObject("user", user).setViewName("notice/detail");
			return mv;
		} catch (Exception e) {
			mv.addObject("msg", "해당 공지사항이 존재하지 않습니다.").setViewName("common/error");
			return mv;
		}
	}
	
	/**
	 * 공지사항 등록 View Controller
	 * @param mv
	 * @return mv
	 */
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public ModelAndView viewNoticeWrite(ModelAndView mv) {
		mv.setViewName("notice/write");
		return mv;
	}
	
	/**
	 * 공지사항 등록 Controller
	 * @param mv
	 * @param notice
	 * @param multi
	 * @param request
	 * @return mv
	 */
	@ResponseBody
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public ModelAndView writeNotice(
			ModelAndView mv, @ModelAttribute Notice notice
			, @RequestParam(value="uploadFile", required = false) MultipartFile multi
			, HttpServletRequest request
			, HttpSession session) {
		Map<String, String> fileInfo = null;
		try {
			User user = (User) session.getAttribute("loginUser");
			// 작성자아이디 가져오기
			int noticeWriter = user.getUserNo();
			if(multi.getSize() != 0 && !multi.getOriginalFilename().equals("")) {
				fileInfo = fileUtil.saveFile(multi, request, "notice");
				notice.setUserNo(noticeWriter);
				notice.setNoticeFilename(fileInfo.get("original"));
				notice.setNoticeFilerename(fileInfo.get("rename"));
				notice.setNoticeFilepath(fileInfo.get("renameFilepath"));
			}
			int result = nService.insertNotice(notice);
			if(result > 0) {
				mv.setViewName("redirect:/notice/list");
			}else {
				mv.addObject("msg", "공지사항이 등록되지 않았습니다.").setViewName("common/error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "공지사항이 등록되지 않았습니다.").setViewName("common/error");
		}
		return mv;
	}
	
	// 페이징처리하기
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
	
	/**
	 * 공지사항 검색 Controller
	 * @param mv
	 * @param search
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/search", method = RequestMethod.GET)
	public ModelAndView searchNotice(
			ModelAndView mv
			, @ModelAttribute Search search
			, @RequestParam(value="page", required = false, defaultValue = "1") Integer page ) {
		try {
			int totalCount = nService.getSearchNoticeCount(search);
			PageInfo pi = this.getPageInfo(page, totalCount);
			
			List<NoticeJoin> nList = nService.searchNotice(search, pi);
			
			if(!nList.isEmpty()) {
				mv.addObject("pi", pi).addObject("search", search).addObject("nList", nList).setViewName("notice/search");
			}else {
				mv.addObject("msg", "검색하신 내용이 존재하지 않습니다.").setViewName("common/error");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	/**
	 * 공지사항 수정 View Controller
	 * @param mv
	 * @param notice
	 * @return mv
	 */
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public ModelAndView modifyNotice(
			ModelAndView mv,
			@ModelAttribute Notice notice
			) {
		Notice noticeResult = nService.selectOneNotice(notice.getNoticeNo());
		mv.addObject("notice", noticeResult).setViewName("notice/modify");
		return mv;
	}
}
