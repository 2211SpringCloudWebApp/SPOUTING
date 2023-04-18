package com.kh.spouting.inquiry.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spouting.inquiry.domain.Inquiry;
import com.kh.spouting.inquiry.service.InquiryService;
import com.kh.spouting.inquiry.store.InquiryStore;

@Service
public class InquiryServiceImpl implements InquiryService{

	@Autowired
	private InquiryStore iStore;

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Inquiry> selectAllInquiry() {
		List<Inquiry> iList = iStore.selectAllInquiry(session); 
		return iList;
	}

}
