package com.kh.spouting.book.controller;

import java.util.List;

import javax.activation.FileDataSource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.spouting.book.domain.Book;
import com.kh.spouting.book.service.BookService;
import com.kh.spouting.user.domain.User;

@Controller
public class MailingController {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private BookService bService;
	
	@RequestMapping(value="/book/sendMail", method=RequestMethod.POST)
	public String sendMail(HttpServletRequest request, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		int userNo = user.getUserNo();
		List<Book> bList = bService.getMyBooking(userNo);
		String filepath ="";
		
		if(!bList.isEmpty()) {
			try {
				for (Book book : bList) {
		            long startTimestamp = book.getStartTime().getTime(); // 시작 시간 timestamp
		            long currentTimestamp = System.currentTimeMillis(); // 현재 시간 timestamp
		            long diff = startTimestamp - currentTimestamp; // 시작 시간과 현재 시간의 차이 계산 (밀리초 단위)
		            long diffHours = diff / (60 * 60 * 1000); // 시간 단위로 변환
		            
		            if (diffHours <= 24) { // 24시간 이내일 경우에만 메일 보내기
		                
		            	MimeMessage mail = mailSender.createMimeMessage(); //true=text말고 html메시지 쓰겠다
		            	MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
		            	
		            	String path = request.getSession().getServletContext().getRealPath("resources");
		            	StringBuilder sb = new StringBuilder();
		            	//메일내용담기(이용일이랑 현재 시간 비교해서....)
		            	
		            	filepath = path+"\\images\\homeImg\\logo.png";
		            	sb.append("<img src='cid:logos'/>");
		            	
		            	String subject = user.getUserName()+"님의 다가오는 SPOUTING!";
		            	String content = sb.toString();
		            	String from = "heoxuagac89@gmail.com";
		            	String to = "heomina89@gmail.com"; //테스트용내껑
		            	mailHelper.addInline("logos", new FileDataSource(filepath));
		            	mailHelper.setFrom(from);
		            	mailHelper.setSubject(subject);
		            	mailHelper.setText(content, true);
		            	mailHelper.setTo(to);
		            	mailHelper.setTo(user.getUserEmail());
		            	
		            	mailSender.send(mail);
		            }
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		return "redirect:/";
	}
}
