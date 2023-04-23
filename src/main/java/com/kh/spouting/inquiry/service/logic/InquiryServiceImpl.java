package com.kh.spouting.inquiry.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.inquiry.domain.Inquiry;
import com.kh.spouting.inquiry.domain.InquiryJoin;
import com.kh.spouting.inquiry.service.InquiryService;
import com.kh.spouting.inquiry.store.InquiryStore;

@Service
public class InquiryServiceImpl implements InquiryService{

	@Autowired
	private InquiryStore iStore;

	@Autowired
	private SqlSession session;
	
	// 문의사항 리스트 Service
	@Override
	public List<InquiryJoin> selectAllInquiry(PageInfo pi) {
		List<InquiryJoin> iList = iStore.selectAllInquiry(session, pi); 
		return iList;
	}

	// 페이징처리 Service
	@Override
	public int getInquiryCount() {
		int result = iStore.getInquiryCount(session);
		return result;
	}
	
	// 검색 페이징처리 Service
	@Override
	public int getSearchInquiryCount(Search search) {
		int result = iStore.getSearchInquiryCount(session, search);
		return result;
	}

	// 문의사항 검색 Service
	@Override
	public List<Inquiry> searchInquiry(Search search, PageInfo pi) {
		List<Inquiry> iList = iStore.searchInquiry(session, search, pi);
		return iList;
	}

	// 문의사항 등록 Service
	@Override
	public int insertInquiry(Inquiry inquiry) {
		int result = iStore.insertInquiry(session, inquiry);
		return result;
	}

	// 문의사항 디테일 Service
	@Override
	public InquiryJoin detailInquiry(Integer inquiriesNo) {
		InquiryJoin inquiry = iStore.detailInquiry(session, inquiriesNo);
		return inquiry;
	}

}
