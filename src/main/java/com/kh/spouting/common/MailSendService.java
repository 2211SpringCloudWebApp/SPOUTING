package com.kh.spouting.common;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailSendService {
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	private int makeCode() {
		Random rand = new Random();
		int randCode = rand.nextInt(99999)+1;
		return randCode;
	}
	
	
	public String registerEmail(String userEmail) {
		int code = makeCode();
		String sender = "spoutingcheck@gmail.com";
		String receiver = userEmail;
		String title = "[Spouting] 회원가입 인증 코드";
		String content = "<h1>JOIN and Just Spouting!</h1>"
						+ "<h4>회원가입을 진심으로 환영합니다.</h4>"
						+ "인증코드 : <b><mark>" + code + "</mark></b>";
		mailSend(sender, receiver, title, content);
		return Integer.toString(code);
	}
	
	public void mailSend(String sender, String receiver, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(sender);
			helper.setTo(receiver);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
