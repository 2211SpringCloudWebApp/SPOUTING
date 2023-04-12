package com.kh.spouting.diary.domain;

import java.sql.Date;

public class Diary {

	private int diaryNo;
	private int userNo;
	private String diaryTitle;
	private String diaryDetail;
	private Date diaryDate;
	private String diaryFilename;
	private String diaryFilepath;
	
	public Diary(int diaryNo, int userNo, String diaryTitle, String diaryDetail, Date diaryDate, String diaryFilename,
			String diaryFilepath) {
		super();
		this.diaryNo = diaryNo;
		this.userNo = userNo;
		this.diaryTitle = diaryTitle;
		this.diaryDetail = diaryDetail;
		this.diaryDate = diaryDate;
		this.diaryFilename = diaryFilename;
		this.diaryFilepath = diaryFilepath;
	}

	public int getDiaryNo() {
		return diaryNo;
	}

	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getDiaryTitle() {
		return diaryTitle;
	}

	public void setDiaryTitle(String diaryTitle) {
		this.diaryTitle = diaryTitle;
	}

	public String getDiaryDetail() {
		return diaryDetail;
	}

	public void setDiaryDetail(String diaryDetail) {
		this.diaryDetail = diaryDetail;
	}

	public Date getDiaryDate() {
		return diaryDate;
	}

	public void setDiaryDate(Date diaryDate) {
		this.diaryDate = diaryDate;
	}

	public String getDiaryFilename() {
		return diaryFilename;
	}

	public void setDiaryFilename(String diaryFilename) {
		this.diaryFilename = diaryFilename;
	}

	public String getDiaryFilepath() {
		return diaryFilepath;
	}

	public void setDiaryFilepath(String diaryFilepath) {
		this.diaryFilepath = diaryFilepath;
	}
	
	
	
}
