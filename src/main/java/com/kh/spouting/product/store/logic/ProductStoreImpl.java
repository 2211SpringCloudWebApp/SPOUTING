package com.kh.spouting.product.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.product.domain.Product;
import com.kh.spouting.product.store.ProductStore;

@Repository
public class ProductStoreImpl implements ProductStore{

	@Override
	public List<Product> selectAllProduct(SqlSession session) {
		List<Product> pList = session.selectList("ProductMapper.selectProductList");
		return pList;
	}

}
