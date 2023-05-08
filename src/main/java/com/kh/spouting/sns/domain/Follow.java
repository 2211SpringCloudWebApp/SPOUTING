package com.kh.spouting.sns.domain;

public class Follow {
	
	private int userNo;
	private int followNo;
	
	public Follow() {
		// TODO Auto-generated constructor stub
	}

	public Follow(int userNo, int followNo) {
		super();
		this.userNo = userNo;
		this.followNo = followNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getFollowNo() {
		return followNo;
	}

	public void setFollowNo(int followNo) {
		this.followNo = followNo;
	}

	@Override
	public String toString() {
		return "follow [userNo=" + userNo + ", followNo=" + followNo + "]";
	}
	
	

}
