package com.kh.spouting.sns.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
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

	@Override
	public Sns updateUserProfile(SqlSession session, Sns userSns) {
		// TODO Auto-generated method stub
		session.update("SnsMapper.updateUserProfile", userSns);
		return session.selectOne("SnsMapper.selectOnsProfile", userSns);
	}

	@Override
	public List<SnsPhoto> morePhoto(SqlSession session, Integer start, int userNo) {
		// TODO Auto-generated method stub
		int limit = 3;
		int offset = (start - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("SnsMapper.morePhotoList", userNo, rowBounds);
	}


}
