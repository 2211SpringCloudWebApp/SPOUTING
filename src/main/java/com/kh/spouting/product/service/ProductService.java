package com.kh.spouting.product.service;

import java.util.List;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.product.domain.Product;

public interface ProductService {

	List<Product> selectAllProduct(PageInfo pi);

	public int getListCount();



}
