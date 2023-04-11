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

	// 공지사항 디테일 Store
	@Override
	public Notice selectOneNotice(SqlSession session, int noticeNo) {
		Notice notice = session.selectOne("NoticeMapper.selectOneNotice", noticeNo);
		return notice;
	}

	@Override
	public int insertNotice(SqlSession session, Notice notice) {
		int result = session.insert("NoticeMapper.insertNotice", notice);
		return result;
	}

	
}
