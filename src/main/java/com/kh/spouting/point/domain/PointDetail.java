package com.kh.spouting.point.domain;

import java.sql.Timestamp;

public class PointDetail {

	private int pointNo;
	private int userNo;
	private Timestamp pointDate;
	private String pointDetail;
	private int pointChange;
	
	public int getPointNo() {
		return pointNo;
	}
	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public Timestamp getPointDate() {
		return pointDate;
	}
	public void setPointDate(Timestamp pointDate) {
		this.pointDate = pointDate;
	}
	public String getPointDetail() {
		return pointDetail;
	}
	public void setPointDetail(String pointDetail) {
		this.pointDetail = pointDetail;
	}
	public int getPointChange() {
		return pointChange;
	}
	public void setPointChange(int pointChange) {
		this.pointChange = pointChange;
	}
	@Override
	public String toString() {
		return "PointDetail [pointNo=" + pointNo + ", userNo=" + userNo + ", pointDate=" + pointDate + ", pointDetail="
				+ pointDetail + ", pointChange=" + pointChange + "]";
	}
	
	
}
