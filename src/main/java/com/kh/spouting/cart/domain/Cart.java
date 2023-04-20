package com.kh.spouting.cart.domain;

public class Cart {
	
	private int cartNo;
	private String userId;
	private int cartQuantity;
	private String cartPrice;
	private int productNo;
	
	
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
	public int getCartQuantity() {
		return cartQuantity;
	}
	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}
	public String getCartPrice() {
		return cartPrice;
	}
	public void setCartPrice(String cartPrice) {
		this.cartPrice = cartPrice;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	
	
	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", userId=" + userId + ", cartQuantity=" + cartQuantity + ", cartPrice="
				+ cartPrice + ", productNo=" + productNo + "]";
	}
	
	
	
}
