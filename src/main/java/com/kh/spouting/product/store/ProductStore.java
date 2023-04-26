package com.kh.spouting.product.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.cart.domain.Cart;
import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.product.domain.Product;

public interface ProductStore {
	// ********** 사용자 기능 **********
	// 게시글 전체 갯수
	int getListCount(SqlSession session);

	// 카테고리 별 게시글 갯수
	int getListCountByCate(SqlSession session, int[] categoryNos);

	// 검색 게시글 갯수
	int getListCount(SqlSession session, Search search);

	// 전체 상품 목록 조회
	List<Product> selectAllProduct(SqlSession session, PageInfo pi);

	// 상품 1차 카테고리 목록 조회
	List<Product> selectCateProduct1(SqlSession session, PageInfo pi, int[] categoryNos);
	
	// 상품 2차 카테고리 목록 조회
	List<Product> selectCateProduct2(SqlSession session, int categoryNo);

	// 검색 상품 목록 조회
	List<Product> selectListByKeyword(SqlSession session, PageInfo pi, Search search);

	// 상품 상세 조회
	Product selectOneByNo(SqlSession session, int productNo);

	// 장바구니용 상품 상세 조회
	public Product selectOneProduct(SqlSession session, Product product);

	
	// ********** 관리자 기능 **********
	// 상품 등록
	int insertProduct(SqlSession session, Product product);

	// 상품 수정
	int updateProduct(SqlSession session, Product product);

	// 상품 수정 페이지
	Product selectOneById(SqlSession session, int productNo);

	// 상품 삭제
	int deleteProduct(SqlSession session, int productNo);
	


}
