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

}
