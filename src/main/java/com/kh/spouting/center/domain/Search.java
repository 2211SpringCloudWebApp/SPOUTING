package com.kh.spouting.center.domain;

public class Search {

	private String centerName;
	private String centerAddr;
	private String centerTel;
	
	
	// getter/setter
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
	public String getCenterTel() {
		return centerTel;
	}
	public void setCenterTel(String centerTel) {
		this.centerTel = centerTel;
	}
	
	
	
	// toString()
	@Override
	public String toString() {
		return "Search [centerName=" + centerName + ", centerAddr=" + centerAddr + ", centerTel=" + centerTel + "]";
	}
	
	
	
	
	
	
}
