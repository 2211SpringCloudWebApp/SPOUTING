package com.kh.spouting.center.service.logic;

import java.util.List;
import java.util.Map;

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

	/* 지점 상세조회 ServiceImpl */
	@Override
	public Center seletOneCenter(Integer centerNo) {
		Center center = cStore.selectOneCenter(session, centerNo);
		return center;
	}

	/* 이미지 불러오기 ServiceImpl */
	@Override
	public Center loadImage(String centerNo) {
		Center center = cStore.loadImage(session, centerNo);
		return center;
	}

	/* 지점 목록 조회 SerivceImpl */
	@Override
	public List<Center> selectCenterList(Center center) {
		List<Center> cList = cStore.selectCenterList(session, center);
		return cList;
	}

	/* 지점정보 수정 ServiceImpl */
	@Override
	public int updateCenter(Center center) {
		int result = cStore.updateCenter(session, center);
		return result;
	}

	/* 지점정보 수정화면 페이지 ServiceImpl */
	@Override
	public Center selectOneById(Integer centerNo) {
		Center center = cStore.selectOneById(session, centerNo);
		return center;
	}

	/* 지점 삭제 ServiceImpl */
	@Override
	public int deleteCenter(int centerNo) {
		int result = cStore.deleteCenter(session, centerNo);
		return result;
	}


}
