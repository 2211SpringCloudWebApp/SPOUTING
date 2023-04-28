package com.kh.spouting.order.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.order.domain.Order;
import com.kh.spouting.order.domain.OrderList;
import com.kh.spouting.order.service.OrderService;
import com.kh.spouting.order.store.OrderStore;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderStore oStore;

	// 주문 DB 등록
	@Override
	public int insertOrder(Order order) {
		int result = oStore.insertOrder(order);
		return result;
	}

	// 해당 회원의 주문 목록 조회 + 페이징
	@Override
	public List<OrderList> selectOrderBoard(PageInfo pi, String userId) {
		List<OrderList> oList = oStore.selectOrderBoard(pi, userId);
		return oList;
	}

	// 회원의 모든 주문 내역 조회
	@Override
	public List<Order> selectOrderList(String userId) {
		List<Order> oList = oStore.selectOrderList(userId);
		return oList;
	}

	// 주문 내역 상세 조회
	@Override
	public Order selectOneByOrderNo(int orderNo) {
		Order order = oStore.selectOneByOrderNo(orderNo);
		return order;
	}

	// 페이징 처리
	@Override
	public int getOrderListCount(String userId) {
		int result = oStore.getOrderListCount(userId);
		return result;
	}
	
	
	
}
