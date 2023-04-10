package com.kh.spouting.notice.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.notice.domain.Notice;

public interface NoticeStore {

	List<Notice> selectAllNotice(SqlSession session);

}
