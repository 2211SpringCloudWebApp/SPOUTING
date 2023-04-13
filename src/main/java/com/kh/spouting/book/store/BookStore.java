package com.kh.spouting.book.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.book.domain.Book;
import com.kh.spouting.book.domain.Facilities;

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

}
