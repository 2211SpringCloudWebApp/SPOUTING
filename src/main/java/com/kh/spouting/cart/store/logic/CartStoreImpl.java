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

	// 선택 상품 장바구니 목록
	@Override
	public List<Cart> selectCheckedCart(SqlSession session, String userId) {
		return session.selectList("CartMapper.selectCheckedCart", userId);
	}

	// 장바구니 삭제
	@Override
	public int deleteCart(SqlSession session, Cart cart) {
		return session.delete("CartMapper.deleteCart", cart);
	}

	// 장바구니 체크 상태 변경
	@Override
	public int modifyCheckCart(SqlSession session, Cart cart) {
		return session.update("CartMapper.modifyCheckCart", cart);
	}

	// 장바구니 체크 상태 일괄 변경
	@Override
	public int modifyAllCheckCart(SqlSession session, Cart cart) {
		return session.update("CartMapper.modifyAllCheckCart", cart);
	}

	// 장바구니 상태 마크
	@Override
	public int getCountCart(SqlSession session, String userId) {
		return session.selectOne("CartMapper.getCountCart", userId);
	}

	
}
