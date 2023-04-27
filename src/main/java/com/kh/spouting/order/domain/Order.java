package com.kh.spouting.order.domain;

import java.sql.Date;

import com.kh.spouting.cart.domain.Cart;
import com.kh.spouting.product.domain.Product;

public class Order {

	private Product product;
	private Cart cart;
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
	
	public Order() {}
	
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
	
	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "Order [product=" + product + ", cart=" + cart + ", orderNo=" + orderNo + ", cartNo=" + cartNo
				+ ", userId=" + userId + ", orderName=" + orderName + ", orderPhone=" + orderPhone + ", orderEmail="
				+ orderEmail + ", orderPostcode=" + orderPostcode + ", orderRoadaddr=" + orderRoadaddr
				+ ", orderDetailaddr=" + orderDetailaddr + ", orderRequest=" + orderRequest + ", orderDate=" + orderDate
				+ ", orderState=" + orderState + ", orderCost=" + orderCost + ", productNo=" + productNo + "]";
	}

	
	
}