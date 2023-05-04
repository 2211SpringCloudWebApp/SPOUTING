package com.kh.spouting.inquiry.domain;

import java.sql.Timestamp;

public class InquiryJoin {

	private int inquiriesNo;
	private int bookNo;
	private int userNo;
	private String inquiriesCategory;
	private String inquiriesTitle;
	private String inquiriesContent;
	private Timestamp qCreateDate;
	private Timestamp qUpdateDate;
	private int inquiriesViews;
	private String inquiriesFilename;
	private String inquiriesFilepath;
	private String inquiriesFilerename;
	private String inquiriesSecret;
	private int inquiriesLikes;
	private String userName;
	private int secretNo;
	private String isAdminComment;
	
	public InquiryJoin() {}
	
	
	public InquiryJoin(int inquiriesNo, int secretNo) {
		super();
		this.inquiriesNo = inquiriesNo;
		this.secretNo = secretNo;
	}



	public int getInquiriesNo() {
		return inquiriesNo;
	}

	public void setInquiriesNo(int inquiriesNo) {
		this.inquiriesNo = inquiriesNo;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getInquiriesCategory() {
		return inquiriesCategory;
	}

	public void setInquiriesCategory(String inquiriesCategory) {
		this.inquiriesCategory = inquiriesCategory;
	}

	public String getInquiriesTitle() {
		return inquiriesTitle;
	}

	public void setInquiriesTitle(String inquiriesTitle) {
		this.inquiriesTitle = inquiriesTitle;
	}

	public String getInquiriesContent() {
		return inquiriesContent;
	}

	public void setInquiriesContent(String inquiriesContent) {
		this.inquiriesContent = inquiriesContent;
	}

	public Timestamp getqCreateDate() {
		return qCreateDate;
	}

	public void setqCreateDate(Timestamp qCreateDate) {
		this.qCreateDate = qCreateDate;
	}

	public Timestamp getqUpdateDate() {
		return qUpdateDate;
	}

	public void setqUpdateDate(Timestamp qUpdateDate) {
		this.qUpdateDate = qUpdateDate;
	}

	public int getInquiriesViews() {
		return inquiriesViews;
	}

	public void setInquiriesViews(int inquiriesViews) {
		this.inquiriesViews = inquiriesViews;
	}

	public String getInquiriesFilename() {
		return inquiriesFilename;
	}

	public void setInquiriesFilename(String inquiriesFilename) {
		this.inquiriesFilename = inquiriesFilename;
	}

	public String getInquiriesFilepath() {
		return inquiriesFilepath;
	}

	public void setInquiriesFilepath(String inquiriesFilepath) {
		this.inquiriesFilepath = inquiriesFilepath;
	}

	public String getInquiriesFilerename() {
		return inquiriesFilerename;
	}

	public void setInquiriesFilerename(String inquiriesFilerename) {
		this.inquiriesFilerename = inquiriesFilerename;
	}

	public String getInquiriesSecret() {
		return inquiriesSecret;
	}

	public void setInquiriesSecret(String inquiriesSecret) {
		this.inquiriesSecret = inquiriesSecret;
	}

	public int getInquiriesLikes() {
		return inquiriesLikes;
	}

	public void setInquiriesLikes(int inquiriesLikes) {
		this.inquiriesLikes = inquiriesLikes;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public int getSecretNo() {
		return secretNo;
	}

	public void setSecretNo(int secretNo) {
		this.secretNo = secretNo;
	}
	
	public String getIsAdminComment() {
		return isAdminComment;
	}
	
	public void setIsAdminComment(String isAdminComment) {
		this.isAdminComment = isAdminComment;
	}

	@Override
	public String toString() {
		return "InquiryJoin [inquiriesNo=" + inquiriesNo + ", bookNo=" + bookNo + ", userNo=" + userNo
				+ ", inquiriesCategory=" + inquiriesCategory + ", inquiriesTitle=" + inquiriesTitle
				+ ", inquiriesContent=" + inquiriesContent + ", qCreateDate=" + qCreateDate + ", qUpdateDate="
				+ qUpdateDate + ", inquiriesViews=" + inquiriesViews + ", inquiriesFilename=" + inquiriesFilename
				+ ", inquiriesFilepath=" + inquiriesFilepath + ", inquiriesFilerename=" + inquiriesFilerename
				+ ", inquiriesSecret=" + inquiriesSecret + ", inquiriesLikes=" + inquiriesLikes + ", userName="
				+ userName + ", secretNo=" + secretNo + ", isAdminComment=" + isAdminComment + "]";
	}
	
	
}
