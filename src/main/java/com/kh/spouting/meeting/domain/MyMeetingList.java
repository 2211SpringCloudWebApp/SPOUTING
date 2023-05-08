package com.kh.spouting.meeting.domain;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

public class MyMeetingList {
	
	private int meetingNo;
	private String meetingName;
	private int leaderNo;
	private String leaderName;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Timestamp meetingDay;
	
	public MyMeetingList() {
		// TODO Auto-generated constructor stub
	}

	public MyMeetingList(int meetingNo, String meetingName, int leaderNo, String leaderName, Timestamp meetingDay) {
		super();
		this.meetingNo = meetingNo;
		this.meetingName = meetingName;
		this.leaderNo = leaderNo;
		this.leaderName = leaderName;
		this.meetingDay = meetingDay;
	}

	public int getMeetingNo() {
		return meetingNo;
	}

	public void setMeetingNo(int meetingNo) {
		this.meetingNo = meetingNo;
	}

	public String getMeetingName() {
		return meetingName;
	}

	public void setMeetingName(String meetingName) {
		this.meetingName = meetingName;
	}

	public int getLeaderNo() {
		return leaderNo;
	}

	public void setLeaderNo(int leaderNo) {
		this.leaderNo = leaderNo;
	}

	public String getLeaderName() {
		return leaderName;
	}

	public void setLeaderName(String leaderName) {
		this.leaderName = leaderName;
	}

	public Timestamp getMeetingDay() {
		return meetingDay;
	}

	public void setMeetingDay(Timestamp meetingDay) {
		this.meetingDay = meetingDay;
	}

	@Override
	public String toString() {
		return "MyMeetingList [meetingNo=" + meetingNo + ", meetingName=" + meetingName + ", leaderNo=" + leaderNo
				+ ", leaderName=" + leaderName + ", meetingDay=" + meetingDay + "]";
	}
	
	
	

}
