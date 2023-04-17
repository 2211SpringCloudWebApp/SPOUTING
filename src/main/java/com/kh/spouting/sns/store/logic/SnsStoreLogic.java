package com.kh.spouting.sns.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.sns.domain.Sns;
import com.kh.spouting.sns.domain.SnsPhoto;
import com.kh.spouting.sns.domain.SnsProfile;
import com.kh.spouting.sns.store.SnsStore;

@Repository
public class SnsStoreLogic implements SnsStore {

	@Override
	public int insertPhoto(SqlSession session, SnsPhoto snsPhoto) {
		// TODO Auto-generated method stub
		return session.insert("SnsMapper.insertPhoto", snsPhoto);
	}

	@Override
	public SnsProfile selectOneById(SqlSession session, int userNo) {
		// TODO Auto-generated method stub
		return session.selectOne("SnsMapper.selectOneSns", userNo);
	}


}
