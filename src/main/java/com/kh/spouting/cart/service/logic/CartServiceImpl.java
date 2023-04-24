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

	// 장바구니 목록 반환
	@Override
	public List<Cart> printCart(Cart cart) {
		List<Cart> cList = cStore.selectCart(session, cart);
		cList.stream().forEach(c->{
			Product product = new Product();
			product.setProductNo(c.getProductNo());
			c.setProduct(pStore.selectOneProduct(session, product));
		});
		return cList;
	}

}
