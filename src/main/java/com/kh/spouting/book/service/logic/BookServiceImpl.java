package com.kh.spouting.book.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spouting.book.domain.Book;
import com.kh.spouting.book.domain.Facilities;
import com.kh.spouting.book.service.BookService;
import com.kh.spouting.book.store.BookStore;
import com.kh.spouting.point.domain.PointDetail;
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
	public Book selectBook(int bookNo) {
		Book book = bStore.selectBook(session, bookNo);
		return book;
	}
	
	@Override
	public int getSequence() {	
		return bStore.getSequence(session);
	}

	@Override
	public int bookUp(int bookNo) {
		int result = bStore.updatePayTime(session, bookNo);
		return result;
	}

	@Override
	public int insertPDtail(PointDetail pDetail) {
		int result = bStore.insertPDetail(session, pDetail);
		return result;
	}

	

}
