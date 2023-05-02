package com.kh.spouting.inquiry.service.logic;

import java.util.ArrayList;
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

	// 문의사항 비밀번호체크 Service
	@Override
	public InquiryJoin checkSecretNo(InquiryJoin iParam) {
		InquiryJoin inquiry = iStore.checkSecretNo(session, iParam);
		return inquiry;
	}

	// 문의사항 수정 Service
	@Override
	public int modifyInquiry(Inquiry inquiry) {
		int result = iStore.modifyInquiry(session, inquiry);
		return result;
	}

	// 문의사항 삭제 Service
	@Override
	public int deleteInquiry(int inquiriesNo) {
		int result = iStore.deleteInquiry(session, inquiriesNo);
		return result;
	}

	@Override
	public void updateLike(Inquiry inquiry) {
		iStore.updateLike(session, inquiry);
	}

	@Override
	public Inquiry getTotalLike(int inquiriesNo) {
		Inquiry inquiry = iStore.getTotalLike(session, inquiriesNo);
		return inquiry;
	}

	@Override
	public List<InquiryJoin> getTopInquiry(int i) {
		List<InquiryJoin> iList = iStore.getTopInquiry(session, 5);
		return iList;
	}

//	@Override
//	public List<InquiryJoin> selectInquiryWithTop5(PageInfo pi) {
//	    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
//	    int limit = pi.getBoardLimit();
//	    List<InquiryJoin> topInquiries = iStore.selectTopInquiries(5);
//	    List<InquiryJoin> inquiries = iStore.selectInquiriesWithPaging(offset, limit);
//	    List<InquiryJoin> result = new ArrayList<>();
//	    // 상단 고정 게시물 추가
//	    result.addAll(topInquiries);
//	    // 일반 게시물 추가
//	    for (InquiryJoin inquiry : inquiries) {
//	        boolean isTop = false;
//	        for (InquiryJoin topInquiry : topInquiries) {
//	            if (inquiry.getInquiriesNo() == topInquiry.getInquiriesNo()) {
//	                isTop = true;
//	                break;
//	            }
//	        }
//	        if (!isTop) {
//	            result.add(inquiry);
//	        }
//	    }
//	    return result;
//	}


}
