package com.kh.spouting.notice.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.notice.domain.Notice;
import com.kh.spouting.notice.store.NoticeStore;

@Repository
public class NoticeStoreLogic implements NoticeStore{

	// 공지사항 리스트 Store
	@Override
	public List<Notice> selectAllNotice(SqlSession session) {
		List<Notice> nList = session.selectList("NoticeMapper.selectAllNotice");
		return nList;
	}

	
}
