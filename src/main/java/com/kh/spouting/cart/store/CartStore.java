package com.kh.spouting.cart.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.cart.domain.Cart;

public interface CartStore {

	// 기존 장바구니 상품 체크
	int selectCheckCart(SqlSession session, Cart cart);

	// 기존 장바구니 상품 업데이트
	int updateQtyCart(SqlSession session, Cart cart);

	// 장바구니 수량 증가
	int updateQtyCartPlus(SqlSession session, Cart cart);
	
	// 장바구니 수량 감소
	int updateQtyCartMinus(SqlSession session, Cart cart);
	
	// 장바구니 추가
	int insertCart(SqlSession session, Cart cart);

	// 장바구니 목록 반환
	List<Cart> selectCart(SqlSession session, Cart cart);

	// 선택 상품 장바구니 목록
	List<Cart> selectCheckedCart(SqlSession session, String userId);

	// 장바구니 삭제
	int deleteCart(SqlSession session, Cart cart);

	// 장바구니 체크 상태 변경
	int modifyCheckCart(SqlSession session, Cart cart);

	// 장바구니 체크 상태 일괄 변경
	int modifyAllCheckCart(SqlSession session, Cart cart);

	// 장바구니 상태 마크
	int getCountCart(SqlSession session, String userId);


}
