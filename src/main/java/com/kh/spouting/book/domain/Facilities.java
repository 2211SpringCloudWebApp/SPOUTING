package com.kh.spouting.book.domain;

import java.sql.Timestamp;
import java.util.Date;

public class Facilities {
	
	private int facilityNo;
	private int centerNo;
	private String facilityName;
	private int maxPeople;
	private int facilityPrice;
	//여기서부턴 캘린더용 데이터
	private int timeNo;
	private Date useDate;
	private Timestamp startTime; 
	private Timestamp endTime; 
	private int currPeople; 
	
	
	public int getFacilityNo() {
		return facilityNo;
	}
	public void setFacilityNo(int facilityNo) {
		this.facilityNo = facilityNo;
	}
	public int getCenterNo() {
		return centerNo;
	}
	public void setCenterNo(int centerNo) {
		this.centerNo = centerNo;
	}
	public String getFacilityName() {
		return facilityName;
	}
	public void setFacilityName(String facilityName) {
		this.facilityName = facilityName;
	}
	public int getMaxPeople() {
		return maxPeople;
	}
	public void setMaxPeople(int maxPeople) {
		this.maxPeople = maxPeople;
	}
	public int getCurrPeople() {
		return currPeople;
	}
	public void setCurrPeople(int currPeople) {
		this.currPeople = currPeople;
	}
	public int getFacilityPrice() {
		return facilityPrice;
	}
	public void setFacilityPrice(int facilityPrice) {
		this.facilityPrice = facilityPrice;
	}
	public int getTimeNo() {
		return timeNo;
	}
	public void setTimeNo(int timeNo) {
		this.timeNo = timeNo;
	}
	public Date getUseDate() {
		return useDate;
	}
	public void setUseDate(Date useDate) {
		this.useDate = useDate;
	}
	public Timestamp getStartTime() {
		return startTime;
	}
	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	@Override
	public String toString() {
		return "Facilities [facilityNo=" + facilityNo + ", centerNo=" + centerNo + ", facilityName=" + facilityName
				+ ", maxPeople=" + maxPeople + ", facilityPrice=" + facilityPrice + ", timeNo=" + timeNo + ", useDate="
				+ useDate + ", startTime=" + startTime + ", endTime=" + endTime + ", currPeople=" + currPeople + "]";
	}
	
	
	
	
}
