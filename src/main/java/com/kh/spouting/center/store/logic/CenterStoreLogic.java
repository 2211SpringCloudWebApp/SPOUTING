package com.kh.spouting.center.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.center.domain.Center;
import com.kh.spouting.center.store.CenterStore;


@Repository
public class CenterStoreLogic implements CenterStore{

	/* 지점등록 StoreLogic */
	@Override
	public int insertCenter(SqlSession session, Center center) {
		int result = session.insert("CenterMapper.insertCenter", center);
		return result;
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
		int result = session.update("CenterMapper.updateCenter");
		return result;
	}

}
