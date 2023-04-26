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
	 * @param book
	 * @return int
	 */
	public int updatePayTime(SqlSession session, Book book);

	/**
	 * 결제와 동시에 포인트디테일 인서트
	 * @param session
	 * @param pDetail
	 * @return int
	 */
	public int insertPDetail(SqlSession session, PointDetail pDetail);

	/**
	 * 캘린더용
	 * @param session
	 * @return List<Book>
	 */
	public List<Book> getBListCal(SqlSession session, int facilityNo);

	/**
	 * 나의 시설예약 내역조회
	 * @param session
	 * @param userNo
	 * @return List<Book>
	 */
	public List<Book> getMyBooking(SqlSession session, int userNo);
	
	/**
	 * 나의 만료된 옉약 내역 조회
	 * @param session
	 * @param userNo
	 * @return List<Book>
	 */
	public List<Book> getMyPBooking(SqlSession session, int userNo);

	/**
	 * 예약취소
	 * @param session
	 * @param bookNo
	 * @return result 
	 */
	public int deleteBook(SqlSession session, int bookNo);

	/**
	 * 예약취소시 포인트 환급
	 * @param session
	 * @param pDetail
	 * @return
	 */
	public int returnPoint(SqlSession session, PointDetail pDetail);

	/**
	 * (관리자)전체 예약내역 조회
	 * @param session
	 * @return
	 */
	public List<Book> selectAllBook(SqlSession session);

}
