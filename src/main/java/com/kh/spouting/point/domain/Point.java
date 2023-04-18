package com.kh.spouting.point.domain;

import java.sql.Timestamp;

public class Point {
	
	private int pointNo;
	private int userNo;
	private Timestamp pointDate;
	private String pointDetail;
	private int pointChange;
	private int userPoint;
	private int pointBuy;
	
	
	public Point() {};
	

	
	public Point(int pointNo, int userNo, Timestamp pointDate, String pointDetail, int pointChange, int userPoint,
			int pointBuy) {
		super();
		this.pointNo = pointNo;
		this.userNo = userNo;
		this.pointDate = pointDate;
		this.pointDetail = pointDetail;
		this.pointChange = pointChange;
		this.userPoint = userPoint;
		this.pointBuy = pointBuy;
	}



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
	public int getUserPoint() {
		return userPoint;
	}
	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}

	public int getPointBuy() {
		return pointBuy;
	}

	public void setPointBuy(int pointBuy) {
		this.pointBuy = pointBuy;
	}


}
