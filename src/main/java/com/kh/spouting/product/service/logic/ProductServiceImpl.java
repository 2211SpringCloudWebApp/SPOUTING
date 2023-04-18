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

	@Override
	public int getListCount() {
		int result = pStore.getListCount(session);
		return result;
	}

	@Override
	public int getListCountByCate(int[] categoryNos) {
		int result = pStore.getListCountByCate(session, categoryNos);
		return result;
	}

	@Override
	public int getListCount(Search search) {
		int totalCount = pStore.getListCount(session, search);
		return totalCount;
	}

	@Override
	public List<Product> selectAllProduct(PageInfo pi) {
		List<Product> pList = pStore.selectAllProduct(session, pi);
		return pList;
	}

	@Override
	public List<Product> selectCateProduct1(PageInfo pi, int[] categoryNos) {
	    List<Product> cateList = pStore.selectCateProduct1(session, pi, categoryNos);
	    return cateList;
	}
	
	@Override
	public List<Product> selectCateProduct2(int categoryNo) {
		List<Product> cateList = pStore.selectCateProduct2(session, categoryNo);
		return cateList;
	}

	@Override
	public List<Product> selectListByKeyword(PageInfo pi, Search search) {
		List<Product> searchList = pStore.selectListByKeyword(session, pi, search);
		return searchList;
	}

	@Override
	public Product selectOneByNo(int productNo) {
		Product product = pStore.selectOneByNo(session, productNo);
		return product;
	}

}
