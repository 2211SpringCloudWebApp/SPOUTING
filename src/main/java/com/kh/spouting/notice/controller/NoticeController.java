package com.kh.spouting.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spouting.notice.domain.Notice;
import com.kh.spouting.notice.service.NoticeService;

@Controller
@RequestMapping(value="/notice")
public class NoticeController {

	@Autowired
	private NoticeService nService;

	/**
	 * 공지사항 리스트 Controller
	 * @param mv
	 * @return mv
	 */
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public ModelAndView viewNoticeList(ModelAndView mv) {
		try {
			List<Notice> nList = nService.selectAllNotice();
			mv.addObject("nList", nList).setViewName("notice/list");
		} catch (Exception e) {
			mv.addObject("msg", "공지사항 페이지 에러발생").setViewName("common/error");
		}
		return mv;
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.POST)
	public ModelAndView viewNoticeDetail(ModelAndView mv) {
		mv.setViewName("notice/detail");
		return mv;
//		try {
//			Notice notice = nService.selectOneNotice();
//			mv.addObject("notice", notice).setViewName("notice/detail");
//			return mv;
//		} catch (Exception e) {
//			mv.addObject("msg", "해당 공지사항이 존재하지 않습니다.").setViewName("common/error");
//			return mv;
//		}
	}
}
