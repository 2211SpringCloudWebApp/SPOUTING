package com.kh.spouting.notice.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.notice.domain.Notice;
import com.kh.spouting.notice.domain.NoticeJoin;

public interface NoticeStore {

	List<NoticeJoin> selectAllNotice(SqlSession session, PageInfo pi);

	Notice selectOneNotice(SqlSession session, int noticeNo);

	int insertNotice(SqlSession session, Notice notice);

	int getNoticeListCount(SqlSession session);

}
