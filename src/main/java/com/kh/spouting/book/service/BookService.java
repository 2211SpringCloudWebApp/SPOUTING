package com.kh.spouting.book.service;

import java.util.List;

import com.kh.spouting.book.domain.Book;
import com.kh.spouting.book.domain.Facilities;

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

}
