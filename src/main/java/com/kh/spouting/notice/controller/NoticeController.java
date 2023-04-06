package com.kh.spouting.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/notice")
public class NoticeController {

	@RequestMapping(value="/list", method = RequestMethod.GET)
	public ModelAndView viewNoticeList(ModelAndView mv) {
		mv.setViewName("notice/list");
		return mv;
	}
}
