package com.kh.spouting.review.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.product.domain.Product;
import com.kh.spouting.review.domain.Review;
import com.kh.spouting.review.service.ReviewService;
import com.kh.spouting.review.store.ReviewStore;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewStore rStore;
	
	@Autowired
	private SqlSession session;

	// ********** 이용자 **********
	// 리뷰 등록
	@Override
	public int insertReview(Review review) {
		int result = rStore.insertReview(session, review);
		return result;
	}

	// 리뷰 수정
	@Override
	public int updateReview(Review review) {
		int result = rStore.updateReview(session, review);
		return result;
	}

	// 리뷰 삭제
	@Override
	public int deleteReview(int reviewNo) {
		int result = rStore.deleteReview(session, reviewNo);
		return result;
	}

	// 리뷰 목록 조회 + 페이징
	@Override
	public int getListCount() {
		int result = rStore.getListCount(session);
		return result;
	}

	// 회원별 리뷰 목록 조회 + 페이징
	@Override
	public int getListCount(String userId) {
		int result = rStore.getListCount(session, userId);
		return result;
	}

	// 리뷰 목록 조회
	@Override
	public List<Review> selectAllReview(PageInfo pi) {
		List<Review> rList = rStore.selectAllReview(session, pi);
		return rList;
	}

	// 리뷰 상세 조회
	@Override
	public Review selectOneByNo(int reviewNo) {
		Review review = rStore.selectOneByNo(session, reviewNo);
		return review;
	}

	// 회원별 리뷰 상세 조회 + 페이징
	@Override
	public List<Review> selectReview(PageInfo pi, String userId) {
		List<Review> rList = rStore.selectReview(session, pi, userId);
		return rList;
	}

	// 조건부 검색
	@Override
	public List<Review> selectListByKeyword(PageInfo pi, Search search) {
		List<Review> searchList = rStore.selectListByKeyword(session, pi, search);
		return searchList;
	}

	// 페이징 처리 (조건부 검색)
	@Override
	public int getListCount(Search search) {
		int totalCount = rStore.getListCount(session, search);
		return totalCount;
	}

	
	// ********** 관리자 **********
	
	
	
}
