package com.kh.spouting.notice.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.notice.domain.Notice;
import com.kh.spouting.notice.domain.NoticeJoin;

public interface NoticeStore {

	List<NoticeJoin> selectAllNotice(SqlSession session, PageInfo pi);

	NoticeJoin selectOneNotice(SqlSession session, int noticeNo);

	int insertNotice(SqlSession session, Notice notice);

	int getNoticeCount(SqlSession session);

	int getSearchNoticeCount(SqlSession session, Search search);

	List<NoticeJoin> searchNotice(SqlSession session, Search search, PageInfo pi);

	int modifyNotice(SqlSession session, Notice notice);

	int deleteNotice(SqlSession session, Integer noticeNo);

}
