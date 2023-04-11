package com.kh.spouting.product.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.product.domain.Product;

public interface ProductStore {

	List<Product> selectAllProduct(SqlSession session);

}
