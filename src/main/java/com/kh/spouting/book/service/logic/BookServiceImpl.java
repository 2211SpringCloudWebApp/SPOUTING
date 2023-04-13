package com.kh.spouting.book.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spouting.book.domain.Book;
import com.kh.spouting.book.domain.Facilities;
import com.kh.spouting.book.service.BookService;
import com.kh.spouting.book.store.BookStore;
@Service
public class BookServiceImpl implements BookService{

	@Autowired
	BookStore bStore;
	@Autowired
	SqlSession session;
	
	@Override
	public List<Facilities> selectAllFacil() {
		List<Facilities> fList = bStore.selectAllFacil(session);
		return fList;
	}

	@Override
	public int insertBooking(Book book) {
		int result = bStore.insertBooking(session, book);
		return result;
	}

	
	
	@Override
	public int getSequence() {	
		return bStore.getSequence(session);
	}

}
