package com.kh.spouting.center.store;

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

}
