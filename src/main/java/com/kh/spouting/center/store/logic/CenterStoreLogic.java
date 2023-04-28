package com.kh.spouting.center.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.center.domain.Center;
import com.kh.spouting.center.domain.Search;
import com.kh.spouting.center.store.CenterStore;


@Repository
public class CenterStoreLogic implements CenterStore{

	
	/************************* 관리자 서비스 **************************/
	
	/* 지점등록 StoreLogic */
	@Override
	public int insertCenter(SqlSession session, Center center) {
		int result = session.insert("CenterMapper.insertCenter", center);
		return result;
	}

	/* 지점 상세조회 StoreLogic */
	@Override
	public Center selectOneCenter(SqlSession session, Integer centerNo) {
		Center center = session.selectOne("CenterMapper.selectCenterOne", centerNo);
		return center;
	}

	/* 지점 목록 조회 StoreLogic */
	@Override
	public List<Center> selectCenterList(SqlSession session, Center center) {
		List<Center> cList = session.selectList("CenterMapper.selectCenter", center);
		return cList;
	}

	/* 지점정보 수정 StoreLogic */
	@Override
	public int updateCenter(SqlSession session, Center center) {
		int result = session.update("CenterMapper.updateCenter", center);
		return result;
	}

	/* 지점정보 수정화면 페이지 StoreLogic */
	@Override
	public Center selectOneById(SqlSession session, Integer centerNo) {
		Center center = session.selectOne("CenterMapper.selectOneById", centerNo);
		return center;
	}

	/* 지점 삭제 StoreLogic */
	@Override
	public int deleteCenter(SqlSession session, int centerNo) {
		int result = session.delete("CenterMapper.deleteCenter", centerNo);
		return result;
	}

	
	
	
	/************************* 회원 서비스 **************************/
	
	/* 지점 목록 StoreLogic */
	@Override
	public List<Center> selectCenterList(SqlSession session, Search search) {
		List<Center> sList = session.selectList("CenterMapper.selectuserCenter", search);
		return sList;
	}

	
	/* 지점 검색 StoreLogic */
	@Override
	public List<Center> selectSearch(SqlSession session, Search search) {
		List<Center> searchResult = session.selectList("CenterMapper.selectSearch", search);
		return searchResult;
	}
	
	


}
