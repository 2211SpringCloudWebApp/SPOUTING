package com.kh.spouting.sns.domain;

public class SnsCommentNew {
	
	int snsCommentNo;
	int snsPhotoNo;
	private int userNo;
	private String userName;
	private String profileFileRename;
	private String snsComment;
	
	public SnsCommentNew() {
		// TODO Auto-generated constructor stub
	}

	public SnsCommentNew(int snsCommentNo, int snsPhotoNo, int userNo, String userName, String profileFileRename,
			String snsComment) {
		super();
		this.snsCommentNo = snsCommentNo;
		this.snsPhotoNo = snsPhotoNo;
		this.userNo = userNo;
		this.userName = userName;
		this.profileFileRename = profileFileRename;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getProfileFileRename() {
		return profileFileRename;
	}

	public void setProfileFileRename(String profileFileRename) {
		this.profileFileRename = profileFileRename;
	}

	public String getSnsComment() {
		return snsComment;
	}

	public void setSnsComment(String snsComment) {
		this.snsComment = snsComment;
	}

	@Override
	public String toString() {
		return "SnsCommentNew [snsCommentNo=" + snsCommentNo + ", snsPhotoNo=" + snsPhotoNo + ", userNo=" + userNo
				+ ", userName=" + userName + ", profileFileRename=" + profileFileRename + ", snsComment=" + snsComment
				+ "]";
	}
	
	

}
