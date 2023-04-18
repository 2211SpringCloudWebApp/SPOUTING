package com.kh.spouting.book.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.book.domain.Book;
import com.kh.spouting.book.domain.Facilities;
import com.kh.spouting.point.domain.PointDetail;

public interface BookStore {

	/**
	 * 시설 정보 불러오기
	 * @param session
	 * @return List<Facilities>
	 */
	public List<Facilities> selectAllFacil(SqlSession session);

	/**
	 * 예약정보 저장하기
	 * @param session
	 * @param book
	 * @return
	 */
	public int insertBooking(SqlSession session, Book book);

	/**
	 * 글 가저장용 예약번호 가져오기
	 * @param session
	 * @return int
	 */
	public int getSequence(SqlSession session);

	/**
	 * 결제 전 예약 정보 가져오기
	 * @param session
	 * @param bookNo
	 * @return Book
	 */
	public Book selectBook(SqlSession session, int bookNo);

	/**
	 * 결제하기
	 * @param session
	 * @param bookNo
	 * @return int
	 */
	public int updatePayTime(SqlSession session, int bookNo);

	/**
	 * 결제와 동시에 포인트디테일 인서트
	 * @param session
	 * @param pDetail
	 * @return int
	 */
	public int insertPDetail(SqlSession session, PointDetail pDetail);

}
