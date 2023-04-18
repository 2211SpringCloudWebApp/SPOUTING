package com.kh.spouting.inquiry.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spouting.inquiry.domain.Inquiry;
import com.kh.spouting.inquiry.service.InquiryService;

@Controller
@RequestMapping(value="/inquiry")
public class InquiryController {

	@Autowired
	private InquiryService iService;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView viewInquiryList(ModelAndView mv) {
		List<Inquiry> iList = iService.selectAllInquiry();
		mv.addObject("iList", iList).setViewName("inquiry/list");
		return mv;
	}
}
