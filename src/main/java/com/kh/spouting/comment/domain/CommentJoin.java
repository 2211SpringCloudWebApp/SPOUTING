package com.kh.spouting.comment.domain;

import java.sql.Timestamp;

public class CommentJoin {

	private int commentNo;
	private int userNo;
	private int inquiriesNo;
	private String commentContent;
	private Timestamp cCreateDate;
	private String userName;
	
	public CommentJoin() {}
	
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getInquiriesNo() {
		return inquiriesNo;
	}
	public void setInquiriesNo(int inquiriesNo) {
		this.inquiriesNo = inquiriesNo;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Timestamp getcCreateDate() {
		return cCreateDate;
	}
	public void setcCreateDate(Timestamp cCreateDate) {
		this.cCreateDate = cCreateDate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", userNo=" + userNo + ", inquiriesNo=" + inquiriesNo
				+ ", commentContent=" + commentContent + ", cCreateDate=" + cCreateDate + ", userName=" + userName + "]";
	}
	
	
}
