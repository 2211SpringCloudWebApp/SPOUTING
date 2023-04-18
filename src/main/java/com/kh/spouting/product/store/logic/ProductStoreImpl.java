package com.kh.spouting.product.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.product.domain.Product;
import com.kh.spouting.product.store.ProductStore;

@Repository
public class ProductStoreImpl implements ProductStore{

	@Override
	public int getListCount(SqlSession session) {
		int result = session.selectOne("ProductMapper.getListCount");
		return result;
	}

	@Override
	public int getListCountByCate(SqlSession session, int[] categoryNos) {
		int result = session.selectOne("ProductMapper.getListCountByCate", categoryNos);
		return result;
	}

	@Override
	public int getListCount(SqlSession session, Search search) {
		int result = session.selectOne("ProductMapper.getSearchListCount", search);
		return result;
	}

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
	public List<Product> selectCateProduct1(SqlSession session, PageInfo pi, int[] categoryNos) {
	    int limit = pi.getBoardLimit();
	    int currentPage = pi.getCurrentPage();
	    int offset = (currentPage - 1) * limit;
	    RowBounds rowBounds = new RowBounds(offset, limit);
	    List<Product> cateList = session.selectList("ProductMapper.selectCateProduct1", categoryNos, rowBounds); // categoryNos 배열 전달
	    return cateList;
	}

	@Override
    public List<Product> selectCateProduct2(SqlSession session, int categoryNo) {
        List<Product> cateList = session.selectList("ProductMapper.selectCateProduct2", categoryNo);
        return cateList;
    }

	@Override
	public List<Product> selectListByKeyword(SqlSession session, PageInfo pi, Search search) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Product> searchList = session.selectList("ProductMapper.selectListByKeyword", search, rowBounds);
		return searchList;
	}

	@Override
	public Product selectOneByNo(SqlSession session, int productNo) {
		Product product = session.selectOne("ProductMapper.selectOneByNo", productNo);
		return product;
	}

}
