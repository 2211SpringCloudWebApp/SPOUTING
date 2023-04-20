package com.kh.spouting.sns.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.sns.domain.Sns;
import com.kh.spouting.sns.domain.SnsPhoto;
import com.kh.spouting.sns.domain.SnsProfile;

public interface SnsStore {

	int insertPhoto(SqlSession session, SnsPhoto snsPhoto);

	SnsProfile selectOneById(SqlSession session, int userNo);

	Sns updateUserProfile(SqlSession session, Sns userSns);

	List<SnsPhoto> morePhoto(SqlSession session, Integer start, int userNo);


}
