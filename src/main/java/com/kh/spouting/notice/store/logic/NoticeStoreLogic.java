package com.kh.spouting.notice.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.notice.domain.Notice;
import com.kh.spouting.notice.domain.NoticeJoin;
import com.kh.spouting.notice.store.NoticeStore;

@Repository
public class NoticeStoreLogic implements NoticeStore{

	// 공지사항 리스트 Store
	@Override
	public List<NoticeJoin> selectAllNotice(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<NoticeJoin> nList = session.selectList("NoticeMapper.selectAllNotice", null, rowBounds);
		return nList;
	}

	// 공지사항 디테일 Store
	@Override
	public NoticeJoin selectOneNotice(SqlSession session, int noticeNo) {
		NoticeJoin notice = session.selectOne("NoticeMapper.selectOneNotice", noticeNo);
		return notice;
	}

	// 공지사항 등록 Store
	@Override
	public int insertNotice(SqlSession session, Notice notice) {
		int result = session.insert("NoticeMapper.insertNotice", notice);
		return result;
	}

	// 페이징처리(총 공지사항 수)
	@Override
	public int getNoticeCount(SqlSession session) {
		int result = session.selectOne("NoticeMapper.getNoticeCount");
		return result;
	}

	// 페이징처리(검색한 공지사항 수)
	@Override
	public int getSearchNoticeCount(SqlSession session, Search search) {
		int result = session.selectOne("NoticeMapper.getSearchNoticeCount", search);
		return result;
	}

	// 공지사항 검색 Store
	@Override
	public List<NoticeJoin> searchNotice(SqlSession session, Search search, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<NoticeJoin> nList = session.selectList("NoticeMapper.searchNotice", search, rowBounds);
		return nList;
	}

	// 공지사항 수정 Store
	@Override
	public int modifyNotice(SqlSession session, Notice notice) {
		int result = session.update("NoticeMapper.modifyNotice", notice);
		return result;
	}

	// 공지사항 삭제 Store
	@Override
	public int deleteNotice(SqlSession session, Integer noticeNo) {
		int result = session.delete("NoticeMapper.deleteNotice", noticeNo);
		return result;
	}

	
}
