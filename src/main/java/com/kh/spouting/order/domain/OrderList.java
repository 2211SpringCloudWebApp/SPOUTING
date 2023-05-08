package com.kh.spouting.order.domain;

import java.sql.Date;

public class OrderList {

	private int orderNo;
	private int cartNo;
	private String userId;
	private String orderName;
	private String orderPhone;
	private String orderEmail;
	private String orderPostcode;
	private String orderRoadaddr;
	private String orderDetailaddr;
	private String orderRequest;
	private Date orderDate;
	private String orderState;
	private int orderCost;
	private int productNo;
	
	private int categoryNo;
	private String productName;
	private String productFilename1;
	private String productPrice;
	private String productDescription;

	public OrderList() {}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getOrderPhone() {
		return orderPhone;
	}

	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}

	public String getOrderEmail() {
		return orderEmail;
	}

	public void setOrderEmail(String orderEmail) {
		this.orderEmail = orderEmail;
	}

	public String getOrderPostcode() {
		return orderPostcode;
	}

	public void setOrderPostcode(String orderPostcode) {
		this.orderPostcode = orderPostcode;
	}

	public String getOrderRoadaddr() {
		return orderRoadaddr;
	}

	public void setOrderRoadaddr(String orderRoadaddr) {
		this.orderRoadaddr = orderRoadaddr;
	}

	public String getOrderDetailaddr() {
		return orderDetailaddr;
	}

	public void setOrderDetailaddr(String orderDetailaddr) {
		this.orderDetailaddr = orderDetailaddr;
	}

	public String getOrderRequest() {
		return orderRequest;
	}

	public void setOrderRequest(String orderRequest) {
		this.orderRequest = orderRequest;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderState() {
		return orderState;
	}

	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}

	public int getOrderCost() {
		return orderCost;
	}

	public void setOrderCost(int orderCost) {
		this.orderCost = orderCost;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductFilename1() {
		return productFilename1;
	}

	public void setProductFilename1(String productFilename1) {
		this.productFilename1 = productFilename1;
	}

	public String getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	@Override
	public String toString() {
		return "OrderList [orderNo=" + orderNo + ", cartNo=" + cartNo + ", userId=" + userId + ", orderName="
				+ orderName + ", orderPhone=" + orderPhone + ", orderEmail=" + orderEmail + ", orderPostcode="
				+ orderPostcode + ", orderRoadaddr=" + orderRoadaddr + ", orderDetailaddr=" + orderDetailaddr
				+ ", orderRequest=" + orderRequest + ", orderDate=" + orderDate + ", orderState=" + orderState
				+ ", orderCost=" + orderCost + ", productNo=" + productNo + ", categoryNo=" + categoryNo
				+ ", productName=" + productName + ", productFilename1=" + productFilename1 + ", productPrice="
				+ productPrice + ", productDescription=" + productDescription + "]";
	}

	
	
}
