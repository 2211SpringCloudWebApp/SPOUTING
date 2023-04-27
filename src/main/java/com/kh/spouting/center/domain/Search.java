package com.kh.spouting.center.domain;

public class Search {

	private String centerNo;
	private String centerName;
	private String centerAddr;
	private String centerSnaddr;
	private String centerTel;
	
	
	// getter/setter()
	public String getCenterNo() {
		return centerNo;
	}
	public void setCenterNo(String centerNo) {
		this.centerNo = centerNo;
	}
	public String getCenterName() {
		return centerName;
	}
	public void setCenterName(String centerName) {
		this.centerName = centerName;
	}
	public String getCenterAddr() {
		return centerAddr;
	}
	public void setCenterAddr(String centerAddr) {
		this.centerAddr = centerAddr;
	}
	public String getCenterSnaddr() {
		return centerSnaddr;
	}
	public void setCenterSnaddr(String centerSnaddr) {
		this.centerSnaddr = centerSnaddr;
	}
	public String getCenterTel() {
		return centerTel;
	}
	public void setCenterTel(String centerTel) {
		this.centerTel = centerTel;
	}
	
	
	
	// toString()
	@Override
	public String toString() {
		return "Search [centerNo=" + centerNo + ", centerName=" + centerName + ", centerAddr=" + centerAddr
				+ ", centerSnaddr=" + centerSnaddr + ", centerTel=" + centerTel + "]";
	}
	
	
	
	
}
