package com.kh.spouting.notice.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spouting.notice.domain.Notice;
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
	public List<Notice> selectAllNotice() {
		List<Notice> nList = nStore.selectAllNotice(session);
		return nList;
	}

}
