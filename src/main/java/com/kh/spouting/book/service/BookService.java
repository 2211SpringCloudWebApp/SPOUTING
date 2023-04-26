package com.kh.spouting.book.service;

import java.util.List;

import com.kh.spouting.book.domain.Book;
import com.kh.spouting.book.domain.Facilities;
import com.kh.spouting.point.domain.PointDetail;

public interface BookService {

	/**
	 * 시설 전체 정보 가져오기
	 * @return List<Facilities>
	 */
	public List<Facilities> selectAllFacil();

	/**
	 * 예약 정보 저장
	 * @param book
	 * @return int
	 */
	public int insertBooking(Book book);

	/**
	 * 글 저장용으로 번호 먼저 받아오기
	 * @return int
	 */
	public int getSequence();

	/**
	 * 결제 전 예약정보 정보 불러오기
	 * @param bookNo
	 * @return Book
	 */
	public Book selectBook(int bookNo);

	/**
	 * 결제하기(payTime업뎃)
	 * @param book
	 * @return int
	 */
	public int bookUp(Book book);

	/**
	 * 결제와 동시에 포인트디테일 테이블 인서트
	 * @param pDetail
	 * @return int
	 */
	public int insertPDtail(PointDetail pDetail);

	/**
	 * 캘린더용
	 * @return List<Book>
	 */
	public List<Book> getBListCal(int facilityNo);

	/**
	 * 나의 결제내역 조회
	 * @param userNo
	 * @return List<Book>
	 */
	public List<Book> getMyBooking(int userNo);
	
	/**
	 * 나의 이용만료 결제내역 조회
	 * @param userNo
	 * @return List<Book>
	 */
	public List<Book> getMyPBooking(int userNo);

	/**
	 * 예약 취소
	 * @param bookNo
	 * @return int
	 */
	public int deleteBook(int bookNo);

	/**
	 * 예약취소 시 포인트 환급
	 * @param pDetail
	 * @return
	 */
	public int cancelUsedPoint(PointDetail pDetail);

	/**
	 * 예약내역 전체 조회(관리자페이지)
	 * @return List<Book>
	 */
	public List<Book> selectAllBook();

}
