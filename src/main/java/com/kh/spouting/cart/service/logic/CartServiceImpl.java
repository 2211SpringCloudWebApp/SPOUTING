package com.kh.spouting.cart.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spouting.cart.domain.Cart;
import com.kh.spouting.cart.service.CartService;
import com.kh.spouting.cart.store.CartStore;
import com.kh.spouting.product.domain.Product;
import com.kh.spouting.product.store.ProductStore;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	SqlSession session;
	
	@Autowired
	CartStore cStore;
	
	@Autowired
	ProductStore pStore;
	
	
	// 장바구니 추가
	@Override
	public int registerCart(Cart cart) {
		// 기존 장바구니에 상품이 있으면 수량 업데이트 -> 업데이트 성공 시 2 반환, 실패 시 0 반환
		if(cStore.selectCheckCart(session, cart) > 0) {
			return cStore.updateQtyCart(session, cart);
		} else { 
			// 기존 장바구니에 상품이 없으면 인서트 -> 인서트 성공 시 1 반환, 실패 시 0 반환
			return cStore.insertCart(session, cart);
		}
	}

	// 장바구니 목록
	@Override
	public List<Cart> printCart(Cart cart) {
		List<Cart> cList = cStore.selectCart(session, cart); // 카트 안에 상품을 넣어야 하기 때문에 select 메소드 호출
		cList.stream().forEach(c->{
			Product product = new Product();
			product.setProductNo(c.getProductNo());
			c.setProduct(pStore.selectOneProduct(session, product));
		});
		return cList;
	}
	
	// 선택 상품 장바구니 목록
	@Override
	public List<Cart> printCheckedCart(String userId) {
		return cStore.selectCheckedCart(session, userId);
	}

	// 장바구니 수량 증가
	@Override
	public int modifyQtyCartPlus(Cart cart) {
		return cStore.updateQtyCartPlus(session, cart);
	}

	// 장바구니 수량 감소
	@Override
	public int modifyQtyCartMinus(Cart cart) {
		return cStore.updateQtyCartMinus(session, cart);
	}
	
	// 장바구니 삭제
	@Override
	public int removeCart(Cart cart) {
		return cStore.deleteCart(session, cart);
	}

	// 장바구니 체크 상태 변경
	@Override
	public int modifyCheckCart(Cart cart) {
		return cStore.modifyCheckCart(session, cart);
	}

	// 장바구니 체크 상태 일괄 변경
	@Override
	public int modifyAllCheckCart(Cart cart) {
		return cStore.modifyAllCheckCart(session, cart);
	}

	// 장바구니 상태 마크
	@Override
	public int getCountCart(String userId) {
		return cStore.getCountCart(session, userId);
	}




}
