package com.kh.spouting.book.domain;

import java.sql.Timestamp;
import java.util.Date;

public class Book {

	private int bookNo; 
	private int facilityNo;
	private int userNo; 
	private Date useDate;
	private Timestamp startTime; 
	private Timestamp endTime; 
	private int bookPrice; 
	private int numPeople; 
	private Timestamp payTime; 
	private int paidPrice;
	//여기서부턴 예약확인페이지에서 보일것
	private String facilityName; 
	private String centerName; 
	private String centerFilepath1; //예약확인페이지에서 지점 사진 보이게할것
	private String userName; //userNo로 받아올것.. 폰, 메일, ?? 폰이 없네...?
	private String userEmail;
	private int userPoint; //가용포인트
	private int inquiryStatus;
	
	private boolean MailSent; //메일발송체킹용. 서버에 저장 안해놓으면 서버 재시작시 필드값초기화ㅠ
	
	




	public Book() {
		super();
	}
	
	
	
	
	public Book(int bookNo, int paidPrice) {
		super();
		this.bookNo = bookNo;
		this.paidPrice = paidPrice;
	}




	public Book(int facilityNo, int userNo, Date useDate, Timestamp startTime, Timestamp endTime, int bookPrice,
			int numPeople) {
		super();
		this.facilityNo = facilityNo;
		this.userNo = userNo;
		this.useDate = useDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.bookPrice = bookPrice;
		this.numPeople = numPeople;
	}


	public boolean isMailSent() {
		return MailSent;
	}

	public void setMailSent(boolean mailSent) {
		MailSent = mailSent;
	}


	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public int getFacilityNo() {
		return facilityNo;
	}
	public void setFacilityNo(int facilityNo) {
		this.facilityNo = facilityNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public Date getUseDate() {
		return useDate;
	}
	public void setUseDate(Date useDate) {
		this.useDate = useDate;
	}
	public Timestamp getStartTime() {
		return startTime;
	}
	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	public int getBookPrice() {
		return bookPrice;
	}
	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}
	public int getNumPeople() {
		return numPeople;
	}
	public void setNumPeople(int numPeople) {
		this.numPeople = numPeople;
	}
	public Timestamp getPayTime() {
		return payTime;
	}
	public void setPayTime(Timestamp payTime) {
		this.payTime = payTime;
	}
	public String getFacilityName() {
		return facilityName;
	}
	public void setFacilityName(String facilityName) {
		this.facilityName = facilityName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getUserPoint() {
		return userPoint;
	}
	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}
	public String getCenterName() {
		return centerName;
	}
	
	public void setCenterName(String centerName) {
		this.centerName = centerName;
	}
	
	
	
	public String getCenterFilepath1() {
		return centerFilepath1;
	}




	public void setCenterFilepath1(String centerFilepath1) {
		this.centerFilepath1 = centerFilepath1;
	}




	public int getPaidPrice() {
		return paidPrice;
	}




	public void setPaidPrice(int paidPrice) {
		this.paidPrice = paidPrice;
	}

	


	public int getInquiryStatus() {
		return inquiryStatus;
	}




	public void setInquiryStatus(int inquiryStatus) {
		this.inquiryStatus = inquiryStatus;
	}




	@Override
	public String toString() {
		return "Book [bookNo=" + bookNo + ", facilityNo=" + facilityNo + ", userNo=" + userNo + ", useDate=" + useDate
				+ ", startTime=" + startTime + ", endTime=" + endTime + ", bookPrice=" + bookPrice + ", numPeople="
				+ numPeople + ", payTime=" + payTime + ", paidPrice=" + paidPrice + ", facilityName=" + facilityName
				+ ", centerName=" + centerName + ", centerFilepath1=" + centerFilepath1 + ", userName=" + userName
				+ ", userEmail=" + userEmail + ", userPoint=" + userPoint + "]";
	}




	
	
	
}
