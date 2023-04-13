package com.kh.spouting.product.service;

import java.util.List;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.product.domain.Product;

public interface ProductService {

	// 게시글 전체 갯수
	public int getListCount();

	// 검색 게시글 갯수
	public int getListCount(Search search);
	
	// 전체 상품 목록 조회
	public List<Product> selectAllProduct(PageInfo pi);

	// 검색 상품 목록 조회
	public List<Product> selectListByKeyword(PageInfo pi, Search search);




}
