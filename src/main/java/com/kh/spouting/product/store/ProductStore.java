package com.kh.spouting.product.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.product.domain.Product;

public interface ProductStore {

	int getListCount(SqlSession session);

	int getListCountByCate(SqlSession session, int[] categoryNos);

	int getListCount(SqlSession session, Search search);

	List<Product> selectAllProduct(SqlSession session, PageInfo pi);

	List<Product> selectCateProduct1(SqlSession session, PageInfo pi, int[] categoryNos);
	
	List<Product> selectCateProduct2(SqlSession session, int categoryNo);

	List<Product> selectListByKeyword(SqlSession session, PageInfo pi, Search search);

	Product selectOneByNo(SqlSession session, int productNo);

}
