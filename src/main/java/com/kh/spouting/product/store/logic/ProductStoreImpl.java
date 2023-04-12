package com.kh.spouting.product.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.product.domain.Product;
import com.kh.spouting.product.store.ProductStore;

@Repository
public class ProductStoreImpl implements ProductStore{

	@Override
	public List<Product> selectAllProduct(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Product> pList = session.selectList("ProductMapper.selectProductList", null, rowBounds);
		return pList;
	}

	@Override
	public int getListCount(SqlSession session) {
		int result = session.selectOne("ProductMapper.getListCount");
		return result;
	}

}
