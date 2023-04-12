package com.kh.spouting.meeting.domain;

public class Lineup {
	
	private int meetingNo;
	private int userNo;
	
	public Lineup() {
		// TODO Auto-generated constructor stub
	}

	public Lineup(int meetingNo, int userNo) {
		super();
		this.meetingNo = meetingNo;
		this.userNo = userNo;
	}

	public int getMeetingNo() {
		return meetingNo;
	}

	public void setMeetingNo(int meetingNo) {
		this.meetingNo = meetingNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Lineup [meetingNo=" + meetingNo + ", userNo=" + userNo + "]";
	}
	
	

}
