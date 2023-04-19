package com.kh.spouting.point.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.point.domain.Point;
import com.kh.spouting.point.store.PointStore;

@Repository 
public class PointStoreLogic implements PointStore{

	@Override //포인트 잔액 확인
	public Integer getUserPoint(SqlSession session, int userNo) {
		Integer userPoint = session.selectOne("PointMapper.selectUserPoint", userNo);
		return userPoint;
	}

	@Override //포인트 충전
	public int insertPoint(SqlSession session, Point point) {
		int result = session.insert("PointMapper.insertPoint", point);
		return result;
	}

	@Override //포인트 목록
	public List<Point> selectPointDetail(SqlSession session, int userNo, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Point> pList = session.selectList("PointMapper.selectPointDetail", userNo, rowBounds);
		return pList;
	}

	@Override //회원별 포인트내역 개수
	public int getPointCount(SqlSession session, int userNo) {
		int result = session.selectOne("PointMapper.getPointCount", userNo);
		return result;
	}

}
