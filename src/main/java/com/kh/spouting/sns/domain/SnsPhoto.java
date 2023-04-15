package com.kh.spouting.sns.domain;

import java.sql.Timestamp;

public class SnsPhoto {
	
	private int snsPhotoNo;
	private int userNo;
	private String snsContent;
	private String snsFilename;
	private String snsFileRename;
	private String snsFilepath;
	private Timestamp snsDate;
	
	public SnsPhoto() {
		// TODO Auto-generated constructor stub
	}

	public SnsPhoto(int snsPhotoNo, int userNo, String snsContent, String snsFilename, String snsFileRename,
			String snsFilepath, Timestamp snsDate) {
		super();
		this.snsPhotoNo = snsPhotoNo;
		this.userNo = userNo;
		this.snsContent = snsContent;
		this.snsFilename = snsFilename;
		this.snsFileRename = snsFileRename;
		this.snsFilepath = snsFilepath;
		this.snsDate = snsDate;
	}

	public int getSnsPhotoNo() {
		return snsPhotoNo;
	}

	public void setSnsPhotoNo(int snsPhotoNo) {
		this.snsPhotoNo = snsPhotoNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getSnsContent() {
		return snsContent;
	}

	public void setSnsContent(String snsContent) {
		this.snsContent = snsContent;
	}

	public String getSnsFilename() {
		return snsFilename;
	}

	public void setSnsFilename(String snsFilename) {
		this.snsFilename = snsFilename;
	}

	public String getSnsFileRename() {
		return snsFileRename;
	}

	public void setSnsFileRename(String snsFileRename) {
		this.snsFileRename = snsFileRename;
	}

	public String getSnsFilepath() {
		return snsFilepath;
	}

	public void setSnsFilepath(String snsFilepath) {
		this.snsFilepath = snsFilepath;
	}

	public Timestamp getSnsDate() {
		return snsDate;
	}

	public void setSnsDate(Timestamp snsDate) {
		this.snsDate = snsDate;
	}

	@Override
	public String toString() {
		return "SnsPhoto [snsPhotoNo=" + snsPhotoNo + ", userNo=" + userNo + ", snsContent=" + snsContent
				+ ", snsFilename=" + snsFilename + ", snsFileRename=" + snsFileRename + ", snsFilepath=" + snsFilepath
				+ ", snsDate=" + snsDate + "]";
	}
	
	

}
