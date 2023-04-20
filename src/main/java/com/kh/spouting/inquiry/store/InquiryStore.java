package com.kh.spouting.inquiry.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.inquiry.domain.Inquiry;
import com.kh.spouting.inquiry.domain.InquiryJoin;

public interface InquiryStore {

	List<InquiryJoin> selectAllInquiry(SqlSession session, PageInfo pi);

	int getInquiryCount(SqlSession session);

	int getSearchInquiryCount(SqlSession session, Search search);

	List<Inquiry> searchInquiry(SqlSession session, Search search, PageInfo pi);

	int insertInquiry(SqlSession session, Inquiry inquiry);

}
