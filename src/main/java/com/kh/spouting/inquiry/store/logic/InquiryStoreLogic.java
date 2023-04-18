package com.kh.spouting.inquiry.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.inquiry.domain.Inquiry;
import com.kh.spouting.inquiry.store.InquiryStore;

@Repository
public class InquiryStoreLogic implements InquiryStore{

	@Override
	public List<Inquiry> selectAllInquiry(SqlSession session) {
		List<Inquiry> iList = session.selectList("InquiryMapper.selectAllInquiry");
		return iList;
	}

}
