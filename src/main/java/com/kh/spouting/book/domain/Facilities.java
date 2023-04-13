package com.kh.spouting.book.domain;

public class Facilities {
	
	private int facilityNo;
	private int centerNo;
	private String facilityName;
	private int maxPeople;
	private int currPeople; //일단 내비둬 나중에수정해
	private int facilityPrice;
	
	
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
	@Override
	public String toString() {
		return "Facilities [facilityNo=" + facilityNo + ", centerNo=" + centerNo + ", facilityName=" + facilityName
				+ ", maxPeople=" + maxPeople + ", currPeople=" + currPeople + ", facilityPrice=" + facilityPrice + "]";
	}
	
	
}
