package com.kh.spouting.center.store.logic;

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

}
