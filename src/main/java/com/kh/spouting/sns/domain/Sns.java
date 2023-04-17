package com.kh.spouting.sns.domain;

public class Sns {
	
	private int userNo;
	private String profileFilename;
	private String profileFilepath;
	private String profileIntoduce;
	
	public Sns() {
		// TODO Auto-generated constructor stub
	}

	public Sns(int userNo, String profileFilename, String profileFilepath, String profileIntoduce) {
		super();
		this.userNo = userNo;
		this.profileFilename = profileFilename;
		this.profileFilepath = profileFilepath;
		this.profileIntoduce = profileIntoduce;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getProfileFilename() {
		return profileFilename;
	}

	public void setProfileFilename(String profileFilename) {
		this.profileFilename = profileFilename;
	}

	public String getProfileFilepath() {
		return profileFilepath;
	}

	public void setProfileFilepath(String profileFilepath) {
		this.profileFilepath = profileFilepath;
	}

	public String getProfileIntoduce() {
		return profileIntoduce;
	}

	public void setProfileIntoduce(String profileIntoduce) {
		this.profileIntoduce = profileIntoduce;
	}

	@Override
	public String toString() {
		return "Sns [userNo=" + userNo + ", profileFilename=" + profileFilename + ", profileFilepath=" + profileFilepath
				+ ", profileIntoduce=" + profileIntoduce + "]";
	}
	
	

}
