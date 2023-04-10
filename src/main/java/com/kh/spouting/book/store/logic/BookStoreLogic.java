package com.kh.spouting.book.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.book.domain.Facilities;
import com.kh.spouting.book.store.BookStore;
@Repository
public class BookStoreLogic implements BookStore{

	@Override
	public List<Facilities> selectAllFacil(SqlSession session) {
		List<Facilities> fList = session.selectList("FacilitiesMapper.selectAllFacil"); 
		return fList;
	}

}
