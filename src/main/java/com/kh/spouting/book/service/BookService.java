package com.kh.spouting.book.service;

import java.util.List;

import com.kh.spouting.book.domain.Facilities;

public interface BookService {

	/**
	 * 시설 전체 정보 가져오기
	 * @return List<Facilities>
	 */
	public List<Facilities> selectAllFacil();

}
