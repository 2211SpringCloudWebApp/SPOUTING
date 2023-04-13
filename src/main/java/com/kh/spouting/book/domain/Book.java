package com.kh.spouting.book.domain;

import java.sql.Timestamp;
import java.util.Date;

public class Book {

	private int bookNo; //시퀀스
	private int facilityNo; // 넣음
	private int userNo; //세션에서 가져오기(일단하드)
	private Date useDate;//입격
	private Timestamp startTime; //startParam
	private Timestamp endTime; //endParam
	private int bookPrice; //넣음
	private int numPeople; //입력
	private Timestamp payTime; //결제순 정렬
	//여기서부턴 예약확인페이지에서 보일것
	private String facilityName; //
	private String centerName; //centerNo로 조인한 뭔가를 하나 만들어놔야겠다
	private String userName; //userNo로 받아올것.. 폰, 메일, ?? 폰이 없네...?
	private String userEmail;
	private int pointChange; //사용포인트 (얜 입력만 포인트상세테이블에 하기)	
	
	public Book() {
		super();
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
	public int getPointChange() {
		return pointChange;
	}
	public void setPointChange(int pointChange) {
		this.pointChange = pointChange;
	}
	
	@Override
	public String toString() {
		return "Book [bookNo=" + bookNo + ", facilityNo=" + facilityNo + ", userNo=" + userNo + ", useDate=" + useDate
				+ ", startTime=" + startTime + ", endTime=" + endTime + ", bookPrice=" + bookPrice + ", numPeople="
				+ numPeople + ", payTime=" + payTime + ", facilityName=" + facilityName + ", userName=" + userName
				+ ", userEmail=" + userEmail + ", pointChange=" + pointChange + "]";
	}
	
	
	
	
	
}
