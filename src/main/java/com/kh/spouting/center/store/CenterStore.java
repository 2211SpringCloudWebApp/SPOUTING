package com.kh.spouting.center.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.center.domain.Center;

public interface CenterStore {

	/**
	 * 지점 등록 Store
	 * @param session
	 * @param center
	 * @return int
	 */
	public int insertCenter(SqlSession session, Center center);

	/**
	 * 지점 목록 조회 Store
	 * @param session
	 * @param center 
	 * @return List<Center>
	 */
	public List<Center> selectCenterList(SqlSession session, Center center);

	/**
	 * 지점정보 수정 Store
	 * @param session
	 * @param center
	 * @return int
	 */
	public int updateCenter(SqlSession session, Center center);

	/**
	 * 지점정보 상세 조회 Store
	 * @param session
	 * @param centerNo
	 * @return Center
	 */
	public Center selectOneById(SqlSession session, Integer centerNo);

}
