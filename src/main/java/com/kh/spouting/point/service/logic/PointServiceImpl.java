package com.kh.spouting.point.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.point.domain.Point;
import com.kh.spouting.point.service.PointService;
import com.kh.spouting.point.store.PointStore;

@Service
public class PointServiceImpl implements PointService{

	@Autowired
	private PointStore pStore;
	@Autowired
	private SqlSession session;
	
	@Override //포인트 잔액 확인
	public Integer getUserPoint(int userNo) {
		return pStore.getUserPoint(session, userNo);
	}

	@Override //포인트 충전
	public int insertPoint(Point point) {
		return pStore.insertPoint(session, point);
	}

	@Override //포인트 목록
	public List<Point> selectPointDetail(int userNo, PageInfo pi) {
		return pStore.selectPointDetail(session, userNo, pi);
	}

	@Override //회원별 포인트내역 개수
	public int getPointCount(int userNo) {
		return pStore.getPointCount(session, userNo);
	}

	@Override //관리자 포인트 조정
	public int adminPoint(Point point) {	
		return pStore.adminPoint(session, point);
	}


}
