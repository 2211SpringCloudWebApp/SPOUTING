package com.kh.spouting.sns.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spouting.sns.domain.Sns;
import com.kh.spouting.sns.domain.SnsPhoto;
import com.kh.spouting.sns.domain.SnsProfile;
import com.kh.spouting.sns.service.SnsService;
import com.kh.spouting.sns.store.SnsStore;

@Service
public class SnsServiceImpl implements SnsService {
	
	@Autowired
	private SnsStore snsStore;
	
	@Autowired
	private SqlSession session;

	@Override
	public int insertPhoto(SnsPhoto snsPhoto) {
		// TODO Auto-generated method stub
		return snsStore.insertPhoto(session, snsPhoto);
	}

	@Override
	public SnsProfile selectOneById(int userNo) {
		// TODO Auto-generated method stub
		return snsStore.selectOneById(session, userNo);
	}

	@Override
	public Sns updateUserProfile(Sns userSns) {
		// TODO Auto-generated method stub
		return snsStore.updateUserProfile(session, userSns);
	}

	@Override
	public List<SnsPhoto> morePhoto(Integer start, int userNo) {
		// TODO Auto-generated method stub
		return snsStore.morePhoto(session, start, userNo);
	}


}
