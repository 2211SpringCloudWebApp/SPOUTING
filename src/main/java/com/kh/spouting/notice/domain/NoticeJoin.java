package com.kh.spouting.notice.domain;

import java.sql.Timestamp;

public class NoticeJoin {

	private int noticeNo;
	private int userNo;
	private String noticeTitle;
	private String noticeContent;
	private Timestamp nCreateDate;
	private Timestamp nUpdateDate;
	private int noticeViews;
	private String noticeFilename;
	private String noticeFilepath;
	private String noticeFilerename;
	private String userId;
	
	public NoticeJoin() {}
	
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public Timestamp getnCreateDate() {
		return nCreateDate;
	}
	public void setnCreateDate(Timestamp nCreateDate) {
		this.nCreateDate = nCreateDate;
	}
	public Timestamp getnUpdateDate() {
		return nUpdateDate;
	}
	public void setnUpdateDate(Timestamp nUpdateDate) {
		this.nUpdateDate = nUpdateDate;
	}
	public int getNoticeViews() {
		return noticeViews;
	}
	public void setNoticeViews(int noticeViews) {
		this.noticeViews = noticeViews;
	}
	public String getNoticeFilename() {
		return noticeFilename;
	}
	public void setNoticeFilename(String noticeFilename) {
		this.noticeFilename = noticeFilename;
	}
	public String getNoticeFilepath() {
		return noticeFilepath;
	}
	public void setNoticeFilepath(String noticeFilepath) {
		this.noticeFilepath = noticeFilepath;
	}
	public String getNoticeFilerename() {
		return noticeFilerename;
	}
	public void setNoticeFilerename(String noticeFilerename) {
		this.noticeFilerename = noticeFilerename;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "NoticeJoin [noticeNo=" + noticeNo + ", userNo=" + userNo + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", nCreateDate=" + nCreateDate + ", nUpdateDate=" + nUpdateDate
				+ ", noticeViews=" + noticeViews + ", noticeFilename=" + noticeFilename + ", noticeFilepath="
				+ noticeFilepath + ", noticeFilerename=" + noticeFilerename + ", userId=" + userId + "]";
	}
	
	
}
