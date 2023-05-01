package com.kh.spouting.review.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.review.domain.Review;

public interface ReviewStore {

	// ********** 이용자 **********
	// 리뷰 등록
	int insertReview(SqlSession session, Review review);

	// 리뷰 수정
	int updateReview(SqlSession session, Review review);

	// 리뷰 삭제
	int deleteReview(SqlSession session, int reviewNo);

	// 리뷰 목록 조회 + 페이징
	int getListCount(SqlSession session);

	// 회원별 리뷰 목록 조회 + 페이징
	int getListCount(SqlSession session, String userId);

	// 리뷰 목록 조회
	List<Review> selectAllReview(SqlSession session, PageInfo pi);

	// 리뷰 상세 조회
	Review selectOneByNo(SqlSession session, int reviewNo);

	// 회원별 리뷰 상세 조회 + 페이징
	List<Review> selectReview(SqlSession session, PageInfo pi, String userId);

	// 조건부 검색
	List<Review> selectListByKeyword(SqlSession session, PageInfo pi, Search search);

	// 페이징 처리 (조건부 검색)
	int getListCount(SqlSession session, Search search);
	
	
	// ********** 관리자 **********

}
