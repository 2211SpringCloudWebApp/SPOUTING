package com.kh.spouting.cart.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.cart.domain.Cart;

public interface CartStore {

	// 기존 장바구니 상품 체크
	int selectCheckCart(SqlSession session, Cart cart);

	// 기존 장바구니 상품 업데이트
	int updateQtyCart(SqlSession session, Cart cart);

	// 장바구니 추가
	int insertCart(SqlSession session, Cart cart);

	// 장바구니 목록 반환
	List<Cart> selectCart(SqlSession session, Cart cart);

}
