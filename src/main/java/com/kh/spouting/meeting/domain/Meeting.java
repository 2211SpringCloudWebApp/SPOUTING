package com.kh.spouting.meeting.domain;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

public class Meeting {
	
	private int meetingNo;
	private int readerNo;
	private String meetingName;
	private String meetingDetail;
	private int meetingPeople;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Timestamp meetingDay;
	private String meetingFilename;
	private String meetingFileRename;
	private String meetingFilepath;
	
	public Meeting() {
		// TODO Auto-generated constructor stub
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

	public String getMeetingName() {
		return meetingName;
	}

	public void setMeetingName(String meetingName) {
		this.meetingName = meetingName;
	}

	public String getMeetingDetail() {
		return meetingDetail;
	}

	public void setMeetingDetail(String meetingDetail) {
		this.meetingDetail = meetingDetail;
	}

	public int getMeetingPeople() {
		return meetingPeople;
	}

	public void setMeetingPeople(int meetingPeople) {
		this.meetingPeople = meetingPeople;
	}

	public Timestamp getMeetingDay() {
		return meetingDay;
	}

	public void setMeetingDay(Timestamp meetingDay) {
		this.meetingDay = meetingDay;
	}

	public String getMeetingFilename() {
		return meetingFilename;
	}

	public void setMeetingFilename(String meetingFilename) {
		this.meetingFilename = meetingFilename;
	}

	public String getMeetingFileRename() {
		return meetingFileRename;
	}

	public void setMeetingFileRename(String meetingFileRename) {
		this.meetingFileRename = meetingFileRename;
	}

	public String getMeetingFilepath() {
		return meetingFilepath;
	}

	public void setMeetingFilepath(String meetingFilepath) {
		this.meetingFilepath = meetingFilepath;
	}

	public Meeting(int meetingNo, int readerNo, String meetingName, String meetingDetail, int meetingPeople,
			Timestamp meetingDay, String meetingFilename, String meetingFileRename, String meetingFilepath) {
		super();
		this.meetingNo = meetingNo;
		this.readerNo = readerNo;
		this.meetingName = meetingName;
		this.meetingDetail = meetingDetail;
		this.meetingPeople = meetingPeople;
		this.meetingDay = meetingDay;
		this.meetingFilename = meetingFilename;
		this.meetingFileRename = meetingFileRename;
		this.meetingFilepath = meetingFilepath;
	}

	@Override
	public String toString() {
		return "Meeting [meetingNo=" + meetingNo + ", readerNo=" + readerNo + ", meetingName=" + meetingName
				+ ", meetingDetail=" + meetingDetail + ", meetingPeople=" + meetingPeople + ", meetingDay=" + meetingDay
				+ ", meetingFilename=" + meetingFilename + ", meetingFileRename=" + meetingFileRename
				+ ", meetingFilepath=" + meetingFilepath + "]";
	}
	
	

}
