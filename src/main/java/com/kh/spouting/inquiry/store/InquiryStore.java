package com.kh.spouting.inquiry.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.inquiry.domain.Inquiry;

public interface InquiryStore {

	List<Inquiry> selectAllInquiry(SqlSession session);

}
