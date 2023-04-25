package com.kh.spouting.notice.controller;

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
import org.springframework.web.util.HtmlUtils;

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
			// 관리자 확인하기 위해
			User user = (User) session.getAttribute("loginUser");
			NoticeJoin notice = nService.selectOneNotice(noticeNo);
			nService.viewCount(noticeNo);	//글 클릭 시 조회수 1 증가
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
		// 파일전송
		Map<String, String> fileInfo = null;
		try {
			User user = (User) session.getAttribute("loginUser");
			// 작성자아이디 가져오기
			int noticeWriter = user.getUserNo();
			// 첨부파일이 있는 경우
			if(multi.getSize() != 0 && !multi.getOriginalFilename().equals("")) {
				fileInfo = fileUtil.saveFile(multi, request, "notice");
				notice.setNoticeFilename(fileInfo.get("original"));
				notice.setNoticeFilerename(fileInfo.get("rename"));
				notice.setNoticeFilepath(fileInfo.get("renameFilepath"));
			}
			notice.setUserNo(noticeWriter);
			int result = nService.insertNotice(notice);
			if(result > 0) {
				mv.addObject("msg", "공지사항 등록완료!").setViewName("notice/success");
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
	@RequestMapping(value="/modifyView", method = RequestMethod.POST)
	public ModelAndView modifyNoticeView(
			ModelAndView mv,
			@ModelAttribute Notice notice
			) {
		NoticeJoin noticeResult = nService.selectOneNotice(notice.getNoticeNo());
		mv.addObject("notice", noticeResult).setViewName("notice/modify");
		return mv;
	}
	
	/**
	 * 공지사항 수정 Controller
	 * @param mv
	 * @param reloadFile
	 * @param notice
	 * @param request
	 * @return mv
	 */
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public ModelAndView modifyNotice(
			ModelAndView mv
			, @RequestParam(value="reloadFile", required=false) MultipartFile reloadFile
			, @ModelAttribute Notice notice
			, HttpServletRequest request) {
		Map<String, String> modifyFile = null;
		try {
			NoticeJoin originalNotice = nService.selectOneNotice(notice.getNoticeNo());
			
			// 파일 재첨부 있는 경우
			if(!reloadFile.isEmpty()) {
				// 원래글에 파일이 있는 경우
				if(originalNotice.getNoticeFilerename() != null) {
					// 원래 파일 삭제(deleteFile메소드에 filename전달해줌)
					this.deleteFile(request, originalNotice.getNoticeFilerename());
				}
				modifyFile = fileUtil.saveFile(reloadFile, request, "notice");
				if(modifyFile != null) {
					notice.setNoticeFilerename(modifyFile.get("rename"));
					notice.setNoticeFilepath(modifyFile.get("renameFilepath"));
				}
			}
			// 파일 재첨부가 없는 경우
			else {
				 // 원래글에 파일이 있는 경우
	            if(originalNotice.getNoticeFilerename() != null) {
	                // 파일명과 파일경로를 그대로 사용
	                notice.setNoticeFilerename(originalNotice.getNoticeFilerename());
	                notice.setNoticeFilepath(originalNotice.getNoticeFilepath());
	            }
			}
			int result = nService.modifyNotice(notice);
			if(result > 0) {
				mv.setViewName("redirect:/notice/list");
			}else {
				mv.addObject("msg", "공지사항수정이 완료되지 않았습니다.").setViewName("common/error");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	/**
	 * 공지사항 삭제 Controller
	 * @param mv
	 * @param noticeNo
	 * @param request
	 * @return mv
	 */
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public ModelAndView deleteNotice(
			ModelAndView mv
			, @RequestParam Integer noticeNo
			, HttpServletRequest request) {
		try {
			// 파일을 먼저 삭제하기위해
			NoticeJoin notice = nService.selectOneNotice(noticeNo);
			if(notice.getNoticeFilerename() != null) {
				this.deleteFile(request, notice.getNoticeFilerename());
			}
			// 파일삭제 후 글 삭제
			int result = nService.deleteNotice(noticeNo);
			if(result > 0) {
				mv.addObject("msg", "공지사항 삭제 완료").setViewName("notice/success");
			}else {
				mv.addObject("msg", "공지사항이 삭제되지 않았습니다.").setViewName("common/error");
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
		String deletePath = root + "\\images\\notice";
		String deleteFilepath = deletePath + "\\" + filename;
		File deleteFile = new File(deleteFilepath);
		// 삭제할 파일 존재하면
		if(deleteFile.exists()) {
			deleteFile.delete();
		}
	}
}
