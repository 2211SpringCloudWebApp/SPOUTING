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

	// 문의사항 디테일 Store
	@Override
	public InquiryJoin detailInquiry(SqlSession session, Integer inquiriesNo) {
		InquiryJoin inquiry = session.selectOne("InquiryMapper.detailInquiry", inquiriesNo);
		return inquiry;
	}

	// 문의사항 비밀번호체크 Store
	@Override
	public InquiryJoin checkSecretNo(SqlSession session, InquiryJoin iParam) {
		InquiryJoin inquiry = session.selectOne("InquiryMapper.checkSecretNo", iParam);
		return inquiry;
	}

	// 문의사항 수정 Store
	@Override
	public int modifyInquiry(SqlSession session, Inquiry inquiry) {
		int result = session.update("InquiryMapper.modifyInquiry", inquiry);
		return result;
	}

	// 문의사항 삭제 Store
	@Override
	public int deleteInquiry(SqlSession session, int inquiriesNo) {
		int result = session.delete("InquiryMapper.deleteInquiry", inquiriesNo);
		return result;
	}

	// 좋아요 등록 Store
	@Override
	public void updateLike(SqlSession session, Inquiry inquiry) {
		session.update("InquiryMapper.updateLike", inquiry);
		
	}

	// 좋아요 리스트 Store
	@Override
	public Inquiry getTotalLike(SqlSession session, int inquiriesNo) {
		Inquiry inquiry = session.selectOne("InquiryMapper.getTotalLike", inquiriesNo);
		return inquiry;
	}

	// 상단고정 게시물 Store
	@Override
	public List<InquiryJoin> getTopInquiry(SqlSession session, int i) {
		List<InquiryJoin> iList = session.selectList("InquiryMapper.getTopInquiry", 5);
		return iList;
	}

	// 관리자페이지(페이징처리) Store
	@Override
	public int getAdminInquiryCount(SqlSession session) {
		int totalCount = session.selectOne("InquiryMapper.getAdminInquiryCount");
		return totalCount;
	}

	// 관리자페이지 Store
	@Override
	public List<InquiryJoin> selectAdminInquiry(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<InquiryJoin> iList = session.selectList("InquiryMapper.selectAdminInquiry", null, rowBounds);
		return iList;
	}

	// 마이페이지(페이징처리) Store
	@Override
	public int getMyInquiryCount(SqlSession session, int writerNo) {
		int totalCount = session.selectOne("InquiryMapper.getMyInquiryCount", writerNo);
		return totalCount;
	}

	// 마이페이지 Store
	@Override
	public List<Inquiry> myInquiryList(SqlSession session, PageInfo pi, int writerNo) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Inquiry> iList = session.selectList("InquiryMapper.myInquiryList", writerNo, rowBounds);
		return iList;
	}


}
