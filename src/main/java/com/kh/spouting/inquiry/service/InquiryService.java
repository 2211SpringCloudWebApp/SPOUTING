package com.kh.spouting.inquiry.service;

import java.util.List;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.inquiry.domain.Inquiry;
import com.kh.spouting.inquiry.domain.InquiryJoin;

public interface InquiryService {

	List<InquiryJoin> selectAllInquiry(PageInfo pi);

	int getInquiryCount();

	int getSearchInquiryCount(Search search);

	List<Inquiry> searchInquiry(Search search, PageInfo pi);

	int insertInquiry(Inquiry inquiry);

	InquiryJoin detailInquiry(Integer inquiriesNo);

	InquiryJoin checkSecretNo(InquiryJoin iParam);

	int modifyInquiry(Inquiry inquiry);

	int deleteInquiry(int inquiriesNo);

	void updateLike(Inquiry inquiry);

	Inquiry getTotalLike(int inquiriesNo);

	List<InquiryJoin> getTopInquiry(int i);

	int getAdminInquiryCount();

	List<InquiryJoin> selectAdminInquiry(PageInfo pi);

	int getMyInquiryCount(int writerNo);

	List<Inquiry> myInquiryList(PageInfo pi, int writerNo);


}
