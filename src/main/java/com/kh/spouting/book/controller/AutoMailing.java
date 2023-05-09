package com.kh.spouting.book.controller;


import java.text.SimpleDateFormat;
import java.util.List;

import javax.mail.Session;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.kh.spouting.book.domain.Book;
import com.kh.spouting.book.service.BookService;


@Configuration
@EnableScheduling
public class AutoMailing {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private BookService bService;

	@Scheduled(fixedDelay = 60 * 60 * 1000) // 1시간마다 스케줄링
	public void sendMail() {
		List<Book> bList = bService.selectAllBook(); // 24시간 이내에 예약된 예약목록 조회
		String filepath = "";

		Session session;

		try {
			for (Book book : bList) {
				if (!book.isMailSent()) { // 이메일 발송 여부 체크
					long startTimestamp = book.getStartTime().getTime(); // 시작 시간 timestamp
					long currentTimestamp = System.currentTimeMillis(); // 현재 시간 timestamp
					long diff = startTimestamp - currentTimestamp; // 시작 시간과 현재 시간의 차이 계산 (밀리초 단위)
					long diffHours = diff / (60 * 60 * 1000); // 시간 단위로 변환

					if (diffHours <= 24) { // 24시간 이내일 경우에만 메일 보내기
						MimeMessage mail = mailSender.createMimeMessage(); // true=text말고 html메시지 쓰겠다
						MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
						//MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");



						StringBuilder sb = new StringBuilder();
						// 메일내용담기(이용일이랑 현재 시간 비교해서....)

						// sb.append("<img src='cid:logos'/>");
						String startTime = new SimpleDateFormat("MM / dd HH시 ").format(book.getStartTime());
						String endTime = new SimpleDateFormat("MM / dd HH시 ").format(book.getEndTime());

						String subject = book.getUserName() + "님의 다가오는 SPOUTING!";
						String content = "<br><br><br>-------------------------------------------<br>[시설 예약일이 다가오고있습니다.]<br>" + book.getCenterName() +"-"+ book.getFacilityName() +"<br>"+ startTime+"  ~  "+endTime+"<br>-------------------------------------------<br><br><br><br><br>";
						//String from = "heoxuagac89@gmail.com";
						//String to = "heomina89@gmail.com"; // 테스트용내껑
						//mailHelper.setFrom(from);
						mailHelper.setSubject(subject);
						
						mailHelper.setText(content, true);
						//mailHelper.setTo(to);
						mailHelper.setTo(book.getUserEmail());

						mailSender.send(mail);

						book.setMailSent(true); // 이메일 발송 여부(중복발송방지)
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


}
