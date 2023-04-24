package com.kh.spouting.cart.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.cart.domain.Cart;
import com.kh.spouting.cart.store.CartStore;

@Repository
public class CartStoreImpl implements CartStore{

	// 기존 장바구니 상품 체크
	@Override
	public int selectCheckCart(SqlSession session, Cart cart) {
		return session.selectOne("CartMapper.selectCheckCart",cart);
	}

	// 기존 장바구니 상품 업데이트
	@Override
	public int updateQtyCart(SqlSession session, Cart cart) {
		return session.update("CartMapper.updateQtyCart", cart);	
	}

	// 장바구니 추가
	@Override
	public int insertCart(SqlSession session, Cart cart) {
		return session.insert("CartMapper.insertCart", cart);
	}

	// 장바구니 목록 반환
	@Override
	public List<Cart> selectCart(SqlSession session, Cart cart) {
		return session.selectList("CartMapper.selectCart", cart);
	}

	
}
