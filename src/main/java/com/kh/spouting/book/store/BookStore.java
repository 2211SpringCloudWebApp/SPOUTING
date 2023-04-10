package com.kh.spouting.book.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.book.domain.Facilities;

public interface BookStore {

	/**
	 * 시설 정보 불러오기
	 * @param session
	 * @return List<Facilities>
	 */
	public List<Facilities> selectAllFacil(SqlSession session);

}
