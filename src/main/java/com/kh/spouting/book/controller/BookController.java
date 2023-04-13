package com.kh.spouting.book.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.spouting.book.domain.Book;
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
	
	//시설 리스트 예약페이지로 불러오기(에이젝스)
	@ResponseBody
	@RequestMapping(value="/getPrice", method=RequestMethod.GET, produces="application/json;charset=utf-8")
	public String getPrice(@RequestParam("facilityName") String facilityName) {
		List<Facilities> fList = bService.selectAllFacil();
		return new Gson().toJson(fList);
		
		}
	

	
	//예약정보 저장하기(paytime=null상태)
	@RequestMapping(value="/confirm", method=RequestMethod.POST)
	public String confirmBook(HttpServletRequest request, Model model
							, @RequestParam("facilityNo") int facilityNo
							//, @RequestParam("useDate") int useDate
							, @RequestParam("bookPrice") int bookPrice
							, @RequestParam("numPeople") int numPeople
							) throws Exception {
		Book book = null;
		
		//데이트타입으로 잘 받기
		String useDateParam = request.getParameter("useDate");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date useDate = format.parse(useDateParam);
		
		//데이트 타입 칼렌더 객체로 만들어서 년 월 일로 파싱하기
		Calendar calUseDate = Calendar.getInstance();
		calUseDate.setTime(useDate);
		int year = calUseDate.get(Calendar.YEAR);
		int month = calUseDate.get(Calendar.MONTH);
		int day = calUseDate.get(Calendar.DAY_OF_MONTH);
				
		//startTIme~endTIme timestamp로 형변환 해주기
		int getStartTime = Integer.parseInt(request.getParameter("startParam"));
		int getEndTime = Integer.parseInt(request.getParameter("endParam"));
		
		Calendar calStart = Calendar.getInstance();
		calStart.set(year, month, day);
		calStart.set(Calendar.HOUR_OF_DAY, getStartTime);
		calStart.set(Calendar.MINUTE ,0);
		calStart.set(Calendar.SECOND, 0);
		calStart.set(Calendar.MILLISECOND, 0);
		Calendar calEnd = Calendar.getInstance();
		calEnd.set(year, month, day);
		calEnd.set(Calendar.HOUR_OF_DAY, getEndTime);
		calEnd.set(Calendar.MINUTE ,0);
		calEnd.set(Calendar.SECOND, 0);
		calEnd.set(Calendar.MILLISECOND, 0);
		
		Timestamp startTime = new Timestamp(calStart.getTimeInMillis());
		Timestamp endTime = new Timestamp(calEnd.getTimeInMillis());
		
		//일단하드코딩(바꾸기)
		int userNo = 21;
		
			
		book = new Book(facilityNo, userNo, useDate, startTime, endTime, bookPrice, numPeople);
		
		book.setBookNo(bService.getSequence());
		
		int result = bService.insertBooking(book);
		if(result>0) {
			//북넘버 먼저 받아와서 저장하기
			model.addAttribute("bookNo", book.getBookNo());
			return "book/confirm?bookNo="+book.getBookNo();
			
		}else {
			model.addAttribute("msg", "예약내역을 몬넣었쪙");
			return "common/error";
		}
		
	}
	
	@RequestMapping(value="/confirm", method=RequestMethod.GET)
	public String confirmView(@RequestParam("bookNo") int bookNo){
		return "/book/confirm?bookNo="+bookNo;
	}
	
}
