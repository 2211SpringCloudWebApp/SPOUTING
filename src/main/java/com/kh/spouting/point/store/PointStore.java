package com.kh.spouting.point.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.point.domain.Point;

public interface PointStore {

	/**
	 * 포인트 잔액 확인 Store
	 * @param session
	 * @param userNo
	 * @return int
	 */
	public Integer getUserPoint(SqlSession session, int userNo);

	/**
	 * 포인트 충전 Store
	 * @param session
	 * @param point
	 * @return int
	 */
	public int insertPoint(SqlSession session, Point point);

	/**
	 * 포인트 목록 Store
	 * @param session
	 * @param userNo
	 * @return List<Point>
	 */
	public List<Point> selectPointDetail(SqlSession session, int userNo, PageInfo pi);

	/**
	 * 회원별 포인트내역 개수 Store
	 * @param session
	 * @param userNo
	 * @return int
	 */
	public int getPointCount(SqlSession session, int userNo);

	/**
	 * 관리자 포인트 조정 Store
	 * @param session
	 * @param point
	 * @return int
	 */
	public int adminPoint(SqlSession session, Point point);

}
