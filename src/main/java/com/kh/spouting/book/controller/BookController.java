package com.kh.spouting.book.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.activation.FileDataSource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.spouting.book.domain.Book;
import com.kh.spouting.book.domain.Facilities;
import com.kh.spouting.book.service.BookService;
import com.kh.spouting.common.PageInfo;
import com.kh.spouting.point.domain.PointDetail;
import com.kh.spouting.user.domain.User;


@Controller
public class BookController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	BookService bService;
	
	//admin 예약관리페이지 보이기
		@RequestMapping(value="/admin/bookingList")
		public String adminPage(Model model
							   ,@RequestParam(value="page", required=false, defaultValue="1") Integer page) {
			int totalCount = bService.getBookingCount();
			PageInfo pi = new PageInfo(page, 20, 5, totalCount);
			List<Book> bList = bService.selectAllBook(pi);
			model.addAttribute("bList", bList);
			return "/admin/bookingList";
		}
	
//////////////////////////////////////////////////////////////////////////////////////////회원
	
	//예약 완료 랜딩
	@RequestMapping(value="/book/confirmed")
	public String confirmedView() {
		return "book/thanksForBooking";
	}
		
		
	//시설예약페이지 보이기(시설정보 불러오기)
	@RequestMapping(value="/book/bookView")
	public String bookView(Model model) {
		List<Facilities> fList = bService.selectAllFacil();
		model.addAttribute("fList", fList);
		return "book/bookView";
	}
	
	//예약내역페이지(이용전) 보이기
	@RequestMapping(value="/book/myBooking", method=RequestMethod.GET)
	public String showMyBooking(@RequestParam("userNo") int userNo, Model model) {
		List<Book> myBookList = bService.getMyBooking(userNo);
		model.addAttribute("bList", myBookList);
		return "book/myBooking";
	}
	
	
	//기간만료 내역 보이기(에이젝스)
	@ResponseBody
	@RequestMapping(value="/book/myPastBooking", method=RequestMethod.GET, produces="application/json;charset=utf-8")
	public String showMyPassedBooking(@RequestParam("userNo") int userNo) {
		List<Book> myPastBookList = bService.getMyPBooking(userNo); 
		//model.addAttribute("pList", myPastBookList);
		return new Gson().toJson(myPastBookList);
	}
	
	
	//시설 리스트 예약페이지로 불러오기(에이젝스)
	@ResponseBody
	@RequestMapping(value="/book/getPrice", method=RequestMethod.GET, produces="application/json;charset=utf-8")
	public String getPrice(@RequestParam("facilityName") String facilityName) {
		List<Facilities> fList = bService.selectAllFacil();
		return new Gson().toJson(fList);
		
		}
	

	
	//예약정보 저장하기(paytime/paidPrice =null 상태)
	@RequestMapping(value="/book/confirm", method=RequestMethod.POST)
	public String confirmBook(HttpServletRequest request, Model model
							, @RequestParam("facilityNo") int facilityNo
							, @RequestParam("bookPrice") int bookPrice
							, @RequestParam("numPeople") int numPeople
							, @RequestParam("userNo") int userNo
							) throws Exception {
		Book book = null;
		
		//사용일 데이트타입으로 잘 받기
		String useDateParam = request.getParameter("useDate");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date useDate = format.parse(useDateParam);
		
		//데이트 타입 칼렌더 객체로 만들어서 년 월 일로 파싱하기(시작시간 종료시간에 같이 넣을 용도)
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
		/* 이걸 서버단에서 하는게 나은지 프론트에서 하는게 나은지....,,, 아 쿼리 그만해...
		int bookedPeople = bService.countBookedPpl(Timestamp startTime~ Timestamp endTime);
		if(bookedPeople>=numPeople) {
			//이 안에 요 밑에 내용들 저장ㅇㅇ
		}else{
			//이용가능인원초과
		}
		*/	
		book = new Book(facilityNo, userNo, useDate, startTime, endTime, bookPrice, numPeople);
		
		book.setBookNo(bService.getSequence());
		int result = bService.insertBooking(book);
		int bookNo = book.getBookNo();
		if(result>0) {
			
			//북넘버로 가예약정보 불러와서 뿌리기
			//a지점//시설이름//인원수//이용날짜//이용시간//총금액//포인트불러오기
			//--//사용포인트입력//결제금액//api
			Book bfbook = bService.selectBook(bookNo);
			model.addAttribute("book", bfbook);		
			return "book/confirm";
			
		}else {
			model.addAttribute("msg", "예약내역을 몬넣었쪙");
			return "common/error";
		}		
	}
	
	//예약확인->결제갈기기
	@RequestMapping(value="/book/bookUp", method=RequestMethod.POST)
	public String confirmView(@RequestParam("bookNo") int bookNo
							 ,@RequestParam(value="pointChange", defaultValue = "0") int pointChange 
							 ,@RequestParam("userNo") int userNo
							 ,@RequestParam("paidPrice") int paidPrice
							 , HttpServletRequest request
							 , Model model){
		
		
		
		//payTime paidPrice업뎃용
		Book book = new Book(bookNo, paidPrice);
		
		int result = bService.bookUp(book);
		if(result>0) {
			//결제 완료(페이타임업데이트)가 됐을때
			
			if(pointChange != 0) {
			//쓴 포인트가 있을때는 pDetailTbl에 업데이트해줘야함
				PointDetail pDetail = new PointDetail();
				//=null 해놓으면 널포인트익셉션 남ㅎ
				pDetail.setUserNo(userNo);
				pDetail.setPointChange(pointChange);
				
				int pResult = bService.insertPDtail(pDetail);
				if(pResult>0) {
					//sendMail(request, bookNo);
					model.addAttribute("msg", " 예 약 완 료 ");
					return "book/thanksForBooking"; 
				}else {
					model.addAttribute("msg", "포인트가 제대로 사용되지 않았어요!!");
					return "common/error";
				}
			}else {
				//sendMail(request, bookNo);
				//쓴포인트가 없을때
				model.addAttribute("msg", " 예 약 완 료 ");
				return "book/thanksForBooking";   
			}
			
			
		}else { //페이타임업데이트가 제대로 안됐을때
			model.addAttribute("msg", "결제실패!!");
			return "common/error";
		}
		
	}
	

	//예약취소(+포인트환급)
	@RequestMapping(value="/book/cancelBooking", method=RequestMethod.POST)
	public String cancelBooking(@RequestParam("bookNo") int bookNo
							   ,@RequestParam("bookPrice") int bookPrice
							   ,@RequestParam("paidPrice") int paidPrice
							   ,@RequestParam("userNo") int userNo
							   ,Model model, HttpSession session) {
				
		int loginUserNo = 0;
		User user = (User) session.getAttribute("loginUser");
		if(user !=null) {
			loginUserNo = user.getUserNo();
		} else {
			model.addAttribute("msg", "로그인을 해주세요!!");
			return "common/error";
		}
		int result = bService.deleteBook(bookNo);
		
		if(result>0) {
			//삭제성공하면->포인트사용취소(인서트)
			int pointChange = bookPrice - paidPrice; //사용한포인트
			if(pointChange>0) {
				PointDetail pDetail = new PointDetail();
				pDetail.setPointChange(pointChange);
				pDetail.setUserNo(userNo);
				int pResult = bService.cancelUsedPoint(pDetail);
				if(pResult>0) {
					//포인트 캔슬 성공하면
					System.out.println("포인트 환급 완료");
					
					if(loginUserNo == userNo) {
						return "redirect:/book/myBooking?userNo="+userNo;
					}else {
						return "redirect:/admin/bookingList";
					}
				}else {
					//포인트캔슬 실패하면 
					model.addAttribute("msg", "포인트 사용 취소 미반영 오류!!");
					return "common/error";
				}
			}else {
				//포인트 쓴거 없으면 바로 취소 완료
				System.out.println("사용포인트 0 / 환급 0");
				if(loginUserNo == userNo) {
					return "redirect:/book/myBooking?userNo="+userNo;
				}else {
					return "redirect:/admin/bookingList";
				}
			}
			
		}else {
			//예약취소실패
			model.addAttribute("msg", "예약 취소 실패!!");
			return "common/error";
		}
		
	}
	
	
	

	//풀캘린더실험
	//@ResponseBody
	@RequestMapping(value= "/book/calendar", method=RequestMethod.GET)
	public ModelAndView showCalendarList(ModelAndView mv, HttpServletRequest request) {
		List<Book> bListCal = null; 
		int facilityNo= 38; //일단하드코딩!!
		try {
			bListCal = bService.getBListCal(facilityNo);
			request.setAttribute("calendarList", bListCal);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		String viewPage = "/book/calendar";
		mv.setViewName(viewPage);
		return mv;
	}
	
	//에이젝스 풀캘린더
	@ResponseBody
	@RequestMapping(value="/book/calendarView", method=RequestMethod.GET, produces="application/json;charset=utf-8")
	public String getCalendar(@RequestParam("facilityNo") Integer facilityNo) {
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss.S").create();
		//데이터 그냥 넘기면 포맷이 이상하게 변해서 데이터가 안나옴
		List<Book> CurrBookings= bService.getBListCal(facilityNo);
		return gson.toJson(CurrBookings);
	}
	

}
