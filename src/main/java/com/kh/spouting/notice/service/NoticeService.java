package com.kh.spouting.notice.service;

import java.util.List;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.notice.domain.Notice;
import com.kh.spouting.notice.domain.NoticeJoin;

public interface NoticeService {

	List<NoticeJoin> selectAllNotice(PageInfo pi);

	NoticeJoin selectOneNotice(int noticeNo);

	int insertNotice(Notice notice);

	int getNoticeCount();

	int getSearchNoticeCount(Search search);

	List<NoticeJoin> searchNotice(Search search, PageInfo pi);

	int modifyNotice(Notice notice);

	int deleteNotice(Integer noticeNo);

}
