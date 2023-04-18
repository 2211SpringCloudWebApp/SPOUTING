package com.kh.spouting.point.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.point.domain.Point;

public interface PointStore {

	/**
	 * 포인트 잔액 확인 Store
	 * @param session
	 * @param userNo
	 * @return int
	 */
	public int getUserPoint(SqlSession session, int userNo);

	/**
	 * 포인트 충전 Store
	 * @param session
	 * @param point
	 * @return int
	 */
	public int insertPoint(SqlSession session, Point point);

	/**
	 * 포인트 목록
	 * @param session
	 * @param userNo
	 * @return List<Point>
	 */
	public List<Point> selectPointDetail(SqlSession session, int userNo);

}
