package com.kh.spouting.inquiry.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.inquiry.domain.Inquiry;
import com.kh.spouting.inquiry.domain.InquiryJoin;
import com.kh.spouting.inquiry.store.InquiryStore;

@Repository
public class InquiryStoreLogic implements InquiryStore{

	// 문의사항 리스트 Store
	@Override
	public List<InquiryJoin> selectAllInquiry(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<InquiryJoin> iList = session.selectList("InquiryMapper.selectAllInquiry", null, rowBounds);
		return iList;
	}

	// 페이징처리
	@Override
	public int getInquiryCount(SqlSession session) {
		int result = session.selectOne("InquiryMapper.getInquiryCount");
		return result;
	}

	// 검색 페이징처리
	@Override
	public int getSearchInquiryCount(SqlSession session, Search search) {
		int result = session.selectOne("InquiryMapper.getSearchInquiryCount", search);
		return result;
	}

	// 문의사항 검색 Store
	@Override
	public List<Inquiry> searchInquiry(SqlSession session, Search search, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Inquiry> iList = session.selectList("InquiryMapper.searchInquiry", search, rowBounds);
		return iList;
	}

	// 문의사항 등록 Store
	@Override
	public int insertInquiry(SqlSession session, Inquiry inquiry) {
		int result = session.insert("InquiryMapper.insertInquiry", inquiry);
		return result;
	}

}
