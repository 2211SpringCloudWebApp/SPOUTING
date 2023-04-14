package com.kh.spouting.notice.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.notice.domain.Notice;
import com.kh.spouting.notice.domain.NoticeJoin;
import com.kh.spouting.notice.service.NoticeService;
import com.kh.spouting.notice.store.NoticeStore;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeStore nStore;
	@Autowired
	private SqlSession session;
	
	// 공지사항 리스트 Service
	@Override
	public List<NoticeJoin> selectAllNotice(PageInfo pi) {
		List<NoticeJoin> nList = nStore.selectAllNotice(session, pi);
		return nList;
	}

	// 공지사항 디테일 Service
	@Override
	public Notice selectOneNotice(int noticeNo) {
		Notice notice = nStore.selectOneNotice(session, noticeNo);
		return notice;
	}

	// 공지사항 등록 Service
	@Override
	public int insertNotice(Notice notice) {
		int result = nStore.insertNotice(session, notice);
		return result;
	}

	// 페이징처리(총 공지사항 수)
	@Override
	public int getNoticeCount() {
		int result = nStore.getNoticeCount(session);
		return result;
	}

	// 페이징처리(검색한 공지사항 수)
	@Override
	public int getSearchNoticeCount(Search search) {
		int result = nStore.getSearchNoticeCount(session, search);
		return result;
	}

	// 공지사항 검색 Service
	@Override
	public List<NoticeJoin> searchNotice(Search search, PageInfo pi) {
		List<NoticeJoin> nList = nStore.searchNotice(session, search, pi);
		return nList;
	}

	// 공지사항 수정 Service
	@Override
	public int modifyNotice(Notice notice) {
		int result = nStore.modifyNotice(session, notice);
		return result;
	}

}
