package com.kh.spouting.order.store;

import java.util.List;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.order.domain.Order;
import com.kh.spouting.order.domain.OrderList;

public interface OrderStore {

	// ********** 이용자 **********
	// 주문 DB 등록 
	int insertOrder(Order order);

	// 해당 회원의 주문 목록 조회 + 페이징
	List<OrderList> selectOrderBoard(PageInfo pi, String userId);

	// 회원의 모든 주문 내역 조회
	List<Order> selectOrderList(String userId);

	// 주문 상세 조회
	Order selectOneByOrderNo(int orderNo);

	// 주문 상세 조회
	List<OrderList> selectOrderDetail(int orderNo);

	// 페이징 처리
	int getOrderListCount(String userId);

	// 주문 삭제
	int deleteOrder(int orderNo);


	// ********** 관리자 **********
	// 전체 주문 수
	int getListCount();
	
	// 주문 목록 + 페이징
	List<Order> selectAllOrder(PageInfo pi);

	// 검색 결과 수
	int getSearchOrderCount(Search search);

	// 조건부 검색
	List<Order> searchOrder(Search search, PageInfo pi);

}
