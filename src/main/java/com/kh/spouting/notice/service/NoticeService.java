package com.kh.spouting.notice.service;

import java.util.List;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.notice.domain.Notice;
import com.kh.spouting.notice.domain.NoticeJoin;

public interface NoticeService {

	List<NoticeJoin> selectAllNotice(PageInfo pi);

	Notice selectOneNotice(int noticeNo);

	int insertNotice(Notice notice);

	int getNoticeListCount();

}
