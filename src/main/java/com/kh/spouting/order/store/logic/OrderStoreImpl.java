package com.kh.spouting.order.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.order.domain.Order;
import com.kh.spouting.order.domain.OrderList;
import com.kh.spouting.order.store.OrderStore;
import com.kh.spouting.product.domain.Product;

@Repository
public class OrderStoreImpl implements OrderStore{

	@Autowired
	private SqlSession session;

	// ********** 이용자 **********
	// 주문 DB 등록
	@Override
	public int insertOrder(Order order) {
		int result = session.insert("OrderMapper.insertOrder", order);
		return result;
	}

	// 해당 회원의 주문 목록 조회 + 페이징
	@Override
	public List<OrderList> selectOrderBoard(PageInfo pi, String userId) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<OrderList> oList = session.selectList("OrderMapper.selectOrderBoard", userId, rowBounds);
		return oList;
	}

	// 해당 회원의 모든 주문 내역 조회
	@Override
	public List<Order> selectOrderList(String userId) {
		List<Order> oList = session.selectList("OrderMapper.selectOrderList", userId);
		return oList;
	}

	// 주문 내역 상세 조회
	@Override
	public Order selectOneByOrderNo(int orderNo) {
		Order order = session.selectOne("OrderMapper.selectOneByOrderNo", orderNo);
		return order;
	}

	// 주문 상세 조회
	@Override
	public List<OrderList> selectOrderDetail(int orderNo) {
		List<OrderList> oList = session.selectList("OrderMapper.selectOrderDetail", orderNo);
		return oList;
	}

	// 페이징 처리
	@Override
	public int getOrderListCount(String userId) {
		int result = session.selectOne("OrderMapper.getOrderListCount", userId);
		return result;
	}

	// 주문 삭제
	@Override
	public int deleteOrder(int orderNo) {
		int result = session.delete("OrderMapper.deleteOrder", orderNo);
		return result;
	}

	

	// ********** 관리자 **********
	// 전체 주문 수
	@Override
	public int getListCount() {
		int result = session.selectOne("OrderMapper.getListCount");
		return result;
	}
	
	// 주문 목록 + 페이징
	@Override
	public List<Order> selectAllOrder(PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Order> oList = session.selectList("OrderMapper.selectAllOrder", null, rowBounds);
		return oList;
	}

	// 검색 결과 수
	@Override
	public int getSearchOrderCount(Search search) {
		int result = session.selectOne("OrderMapper.getSearchOrderCount", search);
		return result;
	}

	// 조건부 검색
	@Override
	public List<Order> searchOrder(Search search, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Order> oList = session.selectList("OrderMapper.searchOrder", search, rowBounds);
		return oList;
	}

	
	
}
