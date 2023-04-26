package com.kh.spouting.meeting.domain;

public class ReaderProfile {
	
	private int meetingNo;
	private int readerNo;
	
	public ReaderProfile() {
		// TODO Auto-generated constructor stub
	}

	public ReaderProfile(int meetingNo, int readerNo) {
		super();
		this.meetingNo = meetingNo;
		this.readerNo = readerNo;
	}

	public int getMeetingNo() {
		return meetingNo;
	}

	public void setMeetingNo(int meetingNo) {
		this.meetingNo = meetingNo;
	}

	public int getReaderNo() {
		return readerNo;
	}

	public void setReaderNo(int readerNo) {
		this.readerNo = readerNo;
	}

	@Override
	public String toString() {
		return "ReaderProfile [meetingNo=" + meetingNo + ", readerNo=" + readerNo + "]";
	}
	
	

}
