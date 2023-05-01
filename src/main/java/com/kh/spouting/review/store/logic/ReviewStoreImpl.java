package com.kh.spouting.review.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.order.domain.OrderList;
import com.kh.spouting.product.domain.Product;
import com.kh.spouting.review.domain.Review;
import com.kh.spouting.review.store.ReviewStore;

@Repository
public class ReviewStoreImpl implements ReviewStore{

	// ********** 이용자 **********
	// 리뷰 등록
	@Override
	public int insertReview(SqlSession session, Review review) {
		int result = session.insert("ReviewMapper.insertReview", review);
		return result;
	}

	// 리뷰 수정
	@Override
	public int updateReview(SqlSession session, Review review) {
		int result = session.update("ReviewMapper.updateReview", review); 
		return result;
	}

	// 리뷰 삭제
	@Override
	public int deleteReview(SqlSession session, int reviewNo) {
		int result = session.delete("ReviewMapper.deleteReview", reviewNo);
		return result;
	}

	// 리뷰 목록 조회 + 페이징
	@Override
	public int getListCount(SqlSession session) {
		int result = session.selectOne("ReviewMapper.getListCount");
		return result;
	}

	// 회원별 리뷰 목록 조회 + 페이징
	@Override
	public int getListCount(SqlSession session, String userId) {
		int result = session.selectOne("ReviewMapper.getReviewListCount", userId);
		return result;
	}

	// 리뷰 목록 조회
	@Override
	public List<Review> selectAllReview(SqlSession session, PageInfo pi) {int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> rList = session.selectList("ReviewMapper.selectAllReview", null, rowBounds);
		return rList;
	}

	// 리뷰 상세 조회
	@Override
	public Review selectOneByNo(SqlSession session, int reviewNo) {
		Review review = session.selectOne("ReviewMapper.selectOneByNo", reviewNo);
		return review;
	}

	// 아이디별 목록 조회
	@Override
	public List<Review> selectReview(SqlSession session, PageInfo pi, String userId) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> rList = session.selectList("ReviewMapper.selectReview", userId, rowBounds);
		return rList;
	}

	// 회원별 리뷰 상세 조회 + 페이징
	@Override
	public int getListCount(SqlSession session, Search search) {
		int result = session.selectOne("ReviewMapper.getSearchListCount", search);
		return result;
	}

	// 조건부 검색
	@Override
	public List<Review> selectListByKeyword(SqlSession session, PageInfo pi, Search search) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> searchList = session.selectList("ReviewMapper.selectListByKeyword", search, rowBounds);
		return searchList;
	}
	
	
	// ********** 관리자 **********
	

}
