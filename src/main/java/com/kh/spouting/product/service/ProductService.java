package com.kh.spouting.product.service;

import java.util.List;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.product.domain.Product;

public interface ProductService {

	// ********** 사용자 기능 **********
	
	// 게시글 전체 갯수
	public int getListCount();

	// 카테고리 별 게시글 갯수
	public int getListCountByCate(int[] categoryNos);

	// 전체 상품 목록 조회
	public List<Product> selectAllProduct(PageInfo pi);

	// 상품 1차 카테고리 목록 조회
	public List<Product> selectCateProduct1(PageInfo pi, int[] categoryNos);
	
	// 상품 2차 카테고리 목록 조회
	public List<Product> selectCateProduct2(int categoryNo);

	// 상품 상세 조회
	public Product selectOneByNo(int productNo);

	// 주문 상세 내역
	public Product printOneProduct(Product product);
	
	// ********** 관리자 기능 **********
	
	// 상품 등록
	public int insertProduct(Product product);

	// 상품 수정
	public int updateProduct(Product product);

	// 상품 수정 페이지
	public Product selectOneById(int productNo);

	// 상품 삭제
	public int deleteProduct(int productNo);

	// 검색 페이징
	public int getSearchProductCount(Search search);

	// 상품 검색
	public List<Product> searchProduct(Search search, PageInfo pi);







}
