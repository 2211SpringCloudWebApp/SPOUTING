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
	public List<Product> selectListByKeyword(PageInfo pi, Search search) {
		List<Product> searchList = pStore.selectListByKeyword(session, pi, search);
		return searchList;
	}
}
