package com.kh.spouting.order.service;

import java.util.List;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.order.domain.Order;
import com.kh.spouting.order.domain.OrderList;

public interface OrderService {

	// ********** 이용자 **********
	// 주문 DB 등록
	int insertOrder(Order order);

	// 해당 회원의 주문 목록 조회
	List<OrderList> selectOrderBoard(PageInfo pi, String userId);

	// 회원의 모든 주문 내역 조회
	List<Order> selectOrderList(String userId);

	// 주문 번호에 따른 주문 내역 조회
	Order selectOneByOrderNo(int orderNo);

	// 페이징 처리
	int getOrderListCount(String userId);

	// 주문 취소
	int deleteOrder(int orderNo);

	
	// ********** 관리자 **********
	// 주문 목록 조회
	List<Order> orderView();


}
