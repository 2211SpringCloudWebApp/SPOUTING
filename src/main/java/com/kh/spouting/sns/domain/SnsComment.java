package com.kh.spouting.sns.domain;

public class SnsComment {
	
	int snsCommentNo;
	int snsPhotoNo;
	int userNo;
	String snsComment;
	
	public SnsComment() {
		// TODO Auto-generated constructor stub
	}

	public SnsComment(int snsCommentNo, int snsPhotoNo, int userNo, String snsComment) {
		super();
		this.snsCommentNo = snsCommentNo;
		this.snsPhotoNo = snsPhotoNo;
		this.userNo = userNo;
		this.snsComment = snsComment;
	}

	public int getSnsCommentNo() {
		return snsCommentNo;
	}

	public void setSnsCommentNo(int snsCommentNo) {
		this.snsCommentNo = snsCommentNo;
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

	public String getSnsComment() {
		return snsComment;
	}

	public void setSnsComment(String snsComment) {
		this.snsComment = snsComment;
	}

	@Override
	public String toString() {
		return "SnsComment [snsCommentNo=" + snsCommentNo + ", snsPhotoNo=" + snsPhotoNo + ", userNo=" + userNo
				+ ", snsComment=" + snsComment + "]";
	}
	
	

}
