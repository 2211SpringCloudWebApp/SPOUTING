package com.kh.spouting.point.service;

import java.util.List;

import com.kh.spouting.point.domain.Point;

public interface PointService {

	/**
	 * 포인트 잔액 확인 Service
	 * @param userNo
	 * @return int
	 */
	public int getUserPoint(int userNo);

	/**
	 * 포인트 충전 Service
	 * @param point
	 * @return int
	 */
	public int insertPoint(Point point);

	/**
	 * 포인트 목록 Service
	 * @param userNo
	 * @return List<Point>
	 */
	public List<Point> selectPointDetail(int userNo);

}
