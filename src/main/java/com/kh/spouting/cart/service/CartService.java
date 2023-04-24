package com.kh.spouting.cart.service;

import java.util.List;

import com.kh.spouting.cart.domain.Cart;

public interface CartService {

	// 장바구니 추가
	public int registerCart(Cart cart);

	// 장바구니 목록 반환
	public List<Cart> printCart(Cart cart);

}
