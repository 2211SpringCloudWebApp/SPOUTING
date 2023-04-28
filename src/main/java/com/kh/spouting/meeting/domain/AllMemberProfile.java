package com.kh.spouting.meeting.domain;

public class AllMemberProfile {
	
	private int userNo;
	private String userName;
	private String profileFileRename;
	private String profileIntoduce;
	
	public AllMemberProfile() {
		// TODO Auto-generated constructor stub
	}

	public AllMemberProfile(int userNo, String userName, String profileFileRename, String profileIntoduce) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.profileFileRename = profileFileRename;
		this.profileIntoduce = profileIntoduce;
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

	public String getProfileIntoduce() {
		return profileIntoduce;
	}

	public void setProfileIntoduce(String profileIntoduce) {
		this.profileIntoduce = profileIntoduce;
	}

	@Override
	public String toString() {
		return "AllMemberProfile [userNo=" + userNo + ", userName=" + userName + ", profileFileRename="
				+ profileFileRename + ", profileIntoduce=" + profileIntoduce + "]";
	}
	
	

}
