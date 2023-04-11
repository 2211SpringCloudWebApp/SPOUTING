package com.kh.spouting.book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.spouting.book.domain.Facilities;
import com.kh.spouting.book.service.BookService;

@RequestMapping(value="/book")
@Controller
public class BookController {
	
	@Autowired
	BookService bService;

	//시설예약페이지 보이기(시설정보 불러오기)
	@RequestMapping(value="/bookView")
	public String bookView(Model model) {
		List<Facilities> fList = bService.selectAllFacil();
		model.addAttribute("fList", fList);
		return "book/bookView";
	}
	
	//시설 리스트 예약페이지로 불러오기
//	@ResponseBody
//	@RequestMapping(value="/getPrice", method=RequestMethod.GET, produces="application/json;charset=utf-8")
//	public String getPrice(@RequestParam("facilityName") String facilityName) {
//		List<Facilities> fList = bService.selectAllFacil();
//		return new Gson().toJson(fList);
//		
//		}
//	
//	@RequestMapping(value="/confirmBook", method=RequestMethod.POST)
//	public String confirmBook(@RequestParam("facilityNo") int facilityNo
//							, @RequestParam("")) {
//		user
//		return "redirect: book/bookView";
//	}
//	
}
