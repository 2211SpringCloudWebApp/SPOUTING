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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spouting.notice.domain.FileUtil;
import com.kh.spouting.notice.domain.Notice;
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
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public ModelAndView viewNoticeList(ModelAndView mv, HttpSession session) {
		try {
			// 로그인유저정보 보내기
			User user = (User) session.getAttribute("loginUser");
			List<Notice> nList = nService.selectAllNotice();
			mv.addObject("nList", nList).addObject("user", user).setViewName("notice/list");
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
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public ModelAndView writeNotice(
			ModelAndView mv, @ModelAttribute Notice notice
			, @RequestParam(value="uploadFile", required = false) MultipartFile multi
			, HttpServletRequest request
			, HttpSession session) {
		Map<String, String> fileInfo = null;
		try {
//			User user = (User) session.getAttribute("loginUser");
			// 작성자아이디 가져오기?
//			String noticeWriterId = user.getUserId();
			
			fileInfo = fileUtil.saveFile(multi, request);
			notice.setNoticeFilename(fileInfo.get("original"));
			notice.setNoticeFilerename(fileInfo.get("rename"));
			notice.setNoticeFilepath(fileInfo.get("renameFilepath"));
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
}
