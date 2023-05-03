package com.kh.spouting.review.service;

import java.util.List;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.review.domain.Review;

public interface ReviewService {

	// ********** 이용자 **********
	// 리뷰 등록
	int insertReview(Review review);

	// 리뷰 수정
	int updateReview(Review review);

	// 리뷰 삭제
	int deleteReview(int reviewNo);

	// 리뷰 목록 조회 + 페이징
	int getListCount();

	// 회원별 리뷰 목록 조회 + 페이징
	int getListCount(String userId);
	
	// 페이징 처리 (조건부 검색)
	int getListSearchCount(Search search);
	
	// 조건부 검색
	List<Review> selectListByKeyword(PageInfo pi, Search search);

	// 회원별 리뷰 상세 조회 + 페이징
	List<Review> selectReview(PageInfo pi, String userId);
	
	
	// ********** 관리자 **********
	// 리뷰 목록 조회
	List<Review> selectAllReview(PageInfo pi);
	
	// 리뷰 상세 조회
	Review selectOneByNo(int reviewNo);


	
	
	
	
}
