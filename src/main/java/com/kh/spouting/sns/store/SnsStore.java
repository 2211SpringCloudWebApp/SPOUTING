package com.kh.spouting.sns.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.sns.domain.Sns;
import com.kh.spouting.sns.domain.SnsPhoto;

public interface SnsStore {

	int insertPhoto(SqlSession session, SnsPhoto snsPhoto);

	Sns selectOneById(SqlSession session, int userNo);

}
