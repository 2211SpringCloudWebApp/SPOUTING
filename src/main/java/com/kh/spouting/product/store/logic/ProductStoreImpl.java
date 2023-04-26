package com.kh.spouting.product.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.cart.domain.Cart;
import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.product.domain.Product;
import com.kh.spouting.product.store.ProductStore;

@Repository
public class ProductStoreImpl implements ProductStore{

	// ********** 사용자 기능 **********
	// 게시글 전체 갯수
	@Override
	public int getListCount(SqlSession session) {
		int result = session.selectOne("ProductMapper.getListCount");
		return result;
	}

	// 카테고리 별 게시글 갯수
	@Override
	public int getListCountByCate(SqlSession session, int[] categoryNos) {
		int result = session.selectOne("ProductMapper.getListCountByCate", categoryNos);
		return result;
	}

	// 검색 게시글 갯수
	@Override
	public int getListCount(SqlSession session, Search search) {
		int result = session.selectOne("ProductMapper.getSearchListCount", search);
		return result;
	}

	// 전체 상품 목록 조회
	@Override
	public List<Product> selectAllProduct(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Product> pList = session.selectList("ProductMapper.selectProductList", null, rowBounds);
		return pList;
	}

	// 상품 1차 카테고리 목록 조회
	@Override
	public List<Product> selectCateProduct1(SqlSession session, PageInfo pi, int[] categoryNos) {
	    int limit = pi.getBoardLimit();
	    int currentPage = pi.getCurrentPage();
	    int offset = (currentPage - 1) * limit;
	    RowBounds rowBounds = new RowBounds(offset, limit);
	    List<Product> cateList = session.selectList("ProductMapper.selectCateProduct1", categoryNos, rowBounds); // categoryNos 배열 전달
	    return cateList;
	}

	// 상품 2차 카테고리 목록 조회
	@Override
    public List<Product> selectCateProduct2(SqlSession session, int categoryNo) {
        List<Product> cateList = session.selectList("ProductMapper.selectCateProduct2", categoryNo);
        return cateList;
    }

	// 검색 상품 목록 조회
	@Override
	public List<Product> selectListByKeyword(SqlSession session, PageInfo pi, Search search) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Product> searchList = session.selectList("ProductMapper.selectListByKeyword", search, rowBounds);
		return searchList;
	}

	// 상품 상세 조회
	@Override
	public Product selectOneByNo(SqlSession session, int productNo) {
		Product product = session.selectOne("ProductMapper.selectOneByNo", productNo);
		return product;
	}

	// 장바구니용 상품 조회 
	@Override
	public Product selectOneProduct(SqlSession session, Product product) {
		return session.selectOne("ProductMapper.selectOneProduct", product);
	}
	
	
	
	// ********** 관리자 기능 **********
	// 상품 등록
	@Override
	public int insertProduct(SqlSession session, Product product) {
		int result = session.insert("ProductMapper.insertProduct", product);
		return result;
	}

	// 상품 수정
	@Override
	public int updateProduct(SqlSession session, Product product) {
		int result = session.update("ProductMapper.updateProduct", product);
		return result;
	}

	// 상품 수정 페이지
	@Override
	public Product selectOneById(SqlSession session, int productNo) {
		Product product = session.selectOne("ProductMapper.selectOneById", productNo);
		return product;
	}

	// 상품 삭제
	@Override
	public int deleteProduct(SqlSession session, int productNo) {
		int result = session.delete("ProductMapper.deleteProduct", productNo);
		return result;
	}

	

}
