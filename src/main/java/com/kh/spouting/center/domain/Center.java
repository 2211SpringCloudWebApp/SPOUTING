package com.kh.spouting.center.domain;

public class Center {

	private int centerNo;
	private String centerName;
	private String centerAddr;
	private String centerTel;
	private String centerFilename1;
	private String centerFilepath1;
	private String centerFilename2;
	private String centerFilepath2;
	
	// getter/setter
	public int getCenterNo() {
		return centerNo;
	}
	public void setCenterNo(int centerNo) {
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
	public String getCenterTel() {
		return centerTel;
	}
	public void setCenterTel(String centerTel) {
		this.centerTel = centerTel;
	}
	public String getCenterFilename1() {
		return centerFilename1;
	}
	public void setCenterFilename1(String centerFilename1) {
		this.centerFilename1 = centerFilename1;
	}
	public String getCenterFilepath1() {
		return centerFilepath1;
	}
	public void setCenterFilepath1(String centerFilepath1) {
		this.centerFilepath1 = centerFilepath1;
	}
	public String getCenterFilename2() {
		return centerFilename2;
	}
	public void setCenterFilename2(String centerFilename2) {
		this.centerFilename2 = centerFilename2;
	}
	public String getCenterFilepath2() {
		return centerFilepath2;
	}
	public void setCenterFilepath2(String centerFilepath2) {
		this.centerFilepath2 = centerFilepath2;
	}
	
	// toString()
	@Override
	public String toString() {
		return "Center [centerNo=" + centerNo + ", centerName=" + centerName + ", centerAddr=" + centerAddr
				+ ", centerTel=" + centerTel + ", centerFilename1=" + centerFilename1 + ", centerFilepath1="
				+ centerFilepath1 + ", centerFilename2=" + centerFilename2 + ", centerFilepath2=" + centerFilepath2
				+ "]";
	}
	
	
	
}
