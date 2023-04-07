package com.kh.spouting.center.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spouting.center.domain.Center;
import com.kh.spouting.center.service.CenterService;
import com.kh.spouting.center.store.CenterStore;

@Service
public class CenterServiceImpl implements CenterService{
	
	@Autowired
	private SqlSession session;
	@Autowired
	private CenterStore cStore;

	/* 지점 등록 ServiceImpl */
	@Override
	public int insertCenter(Center center) {
		int result = cStore.insertCenter(session, center);
		return result;
	}

}
