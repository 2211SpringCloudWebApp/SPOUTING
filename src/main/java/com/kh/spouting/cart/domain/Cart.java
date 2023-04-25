package com.kh.spouting.cart.domain;

import com.kh.spouting.product.domain.Product;

public class Cart {
	
	private Product product;
	private int cartNo;
	private String userId;
	private int cartQuantity;
	private int productNo;
	private String cartCheck;
	
	public Cart() {}
	
	
	public Cart(Product product, int productNo, int cartQuantity) {
		super();
		this.product = product;
		this.productNo = productNo;
		this.cartQuantity = cartQuantity;
	}
	
	public Cart(int productNo, int cartQuantity) {
		super();
		this.productNo = productNo;
		this.cartQuantity = cartQuantity;
	}

	public Cart(Product product, int cartQuantity) {
		super();
		this.product = product;
		this.cartQuantity = cartQuantity;
	}

	public Cart(Product product, int productNo, String userId, int cartQuantity, String cartCheck) {
		super();
		this.product = product;
		this.productNo = productNo;
		this.userId = userId;
		this.cartQuantity = cartQuantity;
		this.cartCheck = cartCheck;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
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

	public int getCartQuantity() {
		return cartQuantity;
	}

	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getCartCheck() {
		return cartCheck;
	}

	public void setCartCheck(String cartCheck) {
		this.cartCheck = cartCheck;
	}

	@Override
	public String toString() {
		return "Cart [product=" + product + ", cartNo=" + cartNo + ", userId=" + userId + ", cartQuantity="
				+ cartQuantity + ", productNo=" + productNo + ", cartCheck=" + cartCheck + "]";
	}

	
	
	
	
}
