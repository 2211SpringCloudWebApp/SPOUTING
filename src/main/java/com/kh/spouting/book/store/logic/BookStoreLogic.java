package com.kh.spouting.book.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.book.domain.Book;
import com.kh.spouting.book.domain.Facilities;
import com.kh.spouting.book.store.BookStore;
import com.kh.spouting.common.PageInfo;
import com.kh.spouting.point.domain.PointDetail;
@Repository
public class BookStoreLogic implements BookStore{

	@Override
	public List<Facilities> selectAllFacil(SqlSession session) {
		List<Facilities> fList = session.selectList("FacilitiesMapper.selectAllFacil"); 
		return fList;
	}

	@Override
	public int insertBooking(SqlSession session, Book book) {
		int result = session.insert("BookMapper.insertBook", book);
		return result;
	}

	@Override
	public Book selectBook(SqlSession session, int bookNo) {
		Book book = session.selectOne("BookMapper.selectBook", bookNo); 
		return book;
	}
	
	
	
	@Override
	public int getSequence(SqlSession session) {
		return  session.selectOne("BookMapper.getSequence");
		
	}

	@Override
	public int updatePayTime(SqlSession session, Book book) {
		int result = session.update("BookMapper.updatePayTime", book);
		return result;
	}

	@Override
	public int insertPDetail(SqlSession session, PointDetail pDetail) {
		int result = session.insert("BookMapper.insertPDetail", pDetail);
		return result;
	}

	@Override
	public List<Book> getBListCal(SqlSession session, int facilityNo) {
		List<Book> bListCal = session.selectList("BookMapper.selectBListCal", facilityNo);
		return bListCal;
	}

	@Override
	public List<Book> getMyBooking(SqlSession session, int userNo) {
		List<Book> myBList = session.selectList("BookMapper.selectMyBList", userNo);
		return myBList;
	}

	@Override
	public List<Book> getMyPBooking(SqlSession session, int userNo) {
		List<Book> myPBList = session.selectList("BookMapper.selectMyPBList", userNo);
		return myPBList;
	}

	@Override
	public int deleteBook(SqlSession session, int bookNo) {
		int result = session.delete("BookMapper.deleteBook", bookNo);
		return result;
	}

	@Override
	public int returnPoint(SqlSession session, PointDetail pDetail) {
		int result = session.insert("BookMapper.returnPoint", pDetail);
		return result;
	}

	@Override
	public List<Book> selectAllBook(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Book> bList = session.selectList("BookMapper.selectAllBookList", null, rowBounds);
		return bList;
	}

	@Override
	public int getBookingCount(SqlSession session) {
		int result =  session.selectOne("BookMapper.getBookingCount");
		return result;
	}

	@Override
	public int getfacilNo(SqlSession session, String facilityName) {
		int facilityNo = session.selectOne("FacilitiesMapper.getFacilityNo", facilityName);
		return facilityNo;
	}

}
