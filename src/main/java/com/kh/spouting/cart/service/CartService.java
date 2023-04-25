package com.kh.spouting.cart.service;

import java.util.List;

import com.kh.spouting.cart.domain.Cart;

public interface CartService {

	// 장바구니 추가
	public int registerCart(Cart cart);

	// 장바구니 목록
	public List<Cart> printCart(Cart cart);
	
	// 선택 상품 장바구니 목록
	public List<Cart> printCheckedCart(String userId);
	
	// 장바구니 수량 변경
	public int modiftQtyCart(Cart cart);

	// 장바구니 삭제
	public int removeCart(Cart cart);

	// 장바구니 체크 상태 변경
	public int modifyCheckCart(Cart cart);

	// 장바구니 체크 상태 일괄 변경
	public int modifyAllCheckCart(Cart cart);

	// 장바구니 상태 마크
	public int getCountCart(String userId);

}
