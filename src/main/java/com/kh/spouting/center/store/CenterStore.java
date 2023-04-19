package com.kh.spouting.center.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.center.domain.Center;
import com.kh.spouting.center.domain.Search;

public interface CenterStore {

	/**************** 관리자 *****************/
	
	/**
	 * 지점 등록 Store
	 * @param session
	 * @param center
	 * @return int
	 */
	public int insertCenter(SqlSession session, Center center);

	/**
	 * 지점 상세조회 Store
	 * @param session
	 * @param centerNo
	 * @return Center
	 */
	public Center selectOneCenter(SqlSession session, Integer centerNo);


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
	 * 지점정보 수정화면 페이지 Store
	 * @param session
	 * @param centerNo
	 * @return Center
	 */
	public Center selectOneById(SqlSession session, Integer centerNo);

	/**
	 * 지점 삭제 Store
	 * @param session
	 * @param centerNo
	 * @return int
	 */
	public int deleteCenter(SqlSession session, int centerNo);

	
	
	/************* 회원 ******************/
	
	/**
	 * 지점 목록 Store
	 * @param session
	 * @param search
	 * @return List<Search>
	 */
	public List<Search> selectCenterList(SqlSession session, Search search);

	/**
	 * 지점 검색(회원) Store
	 * @param session
	 * @param center
	 * @return
	 */
	public List<Search> selectSearch(SqlSession session, Search search);

}
