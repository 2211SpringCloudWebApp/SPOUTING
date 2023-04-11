package com.kh.spouting.product.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<Product> selectAllProduct() {
		List<Product> pList = pStore.selectAllProduct(session);
		return pList;
	}
}
