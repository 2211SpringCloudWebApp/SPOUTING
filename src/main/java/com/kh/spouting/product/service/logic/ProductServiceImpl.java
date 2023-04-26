package com.kh.spouting.product.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.product.domain.Product;
import com.kh.spouting.product.service.ProductService;
import com.kh.spouting.product.store.ProductStore;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductStore pStore;
	
	@Autowired
	private SqlSession session;

	// ********** 사용자 기능 **********
	// 게시글 전체 갯수
	@Override
	public int getListCount() {
		int result = pStore.getListCount(session);
		return result;
	}

	// 카테고리 별 게시글 갯수
	@Override
	public int getListCountByCate(int[] categoryNos) {
		int result = pStore.getListCountByCate(session, categoryNos);
		return result;
	}

	// 검색 게시글 갯수
	@Override
	public int getListCount(Search search) {
		int totalCount = pStore.getListCount(session, search);
		return totalCount;
	}

	// 전체 상품 목록 조회
	@Override
	public List<Product> selectAllProduct(PageInfo pi) {
		List<Product> pList = pStore.selectAllProduct(session, pi);
		return pList;
	}

	// 상품 1차 카테고리 목록 조회
	@Override
	public List<Product> selectCateProduct1(PageInfo pi, int[] categoryNos) {
	    List<Product> cateList = pStore.selectCateProduct1(session, pi, categoryNos);
	    return cateList;
	}
	
	// 상품 2차 카테고리 목록 조회
	@Override
	public List<Product> selectCateProduct2(int categoryNo) {
		List<Product> cateList = pStore.selectCateProduct2(session, categoryNo);
		return cateList;
	}

	// 검색 상품 목록 조회
	@Override
	public List<Product> selectListByKeyword(PageInfo pi, Search search) {
		List<Product> searchList = pStore.selectListByKeyword(session, pi, search);
		return searchList;
	}

	// 상품 상세 조회
	@Override
	public Product selectOneByNo(int productNo) {
		Product product = pStore.selectOneByNo(session, productNo);
		return product;
	}
	
	// 주문 상세 내역
	@Override
	public Product printOneProduct(Product product) {
		return pStore.selectOneProduct(session, product);
	}

	
	// ********** 관리자 기능 **********
	// 상품 등록
	@Override
	public int insertProduct(Product product) {
		int result = pStore.insertProduct(session, product);
		return result;
	}

	// 상품 수정
	@Override
	public int updateProduct(Product product) {
		int result = pStore.updateProduct(session, product);
		return result;
	}

	// 상품 수정 페이지
	@Override
	public Product selectOneById(int productNo) {
		Product product = pStore.selectOneById(session, productNo);
		return product;
	}

	// 상품 삭제
	@Override
	public int deleteProduct(int productNo) {
		int result = pStore.deleteProduct(session, productNo);
		return result;
	}

}
