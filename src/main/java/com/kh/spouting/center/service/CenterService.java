package com.kh.spouting.center.service;

import java.util.List;
import java.util.Map;

import com.kh.spouting.center.domain.Center;
import com.kh.spouting.center.domain.Search;

public interface CenterService {

	/**************** 관리자 ***********************/
	
	/**
	 * 지점 등록 Service
	 * @param center
	 * @param userNo 
	 * @return int
	 */
	public int insertCenter(Center center);

	/**
	 * 지점 상세조회 Service
	 * @param centerNo
	 * @return Center
	 */
	public Center seletOneCenter(Integer centerNo);


	/**
	 * 지점 목록 조회 Service
	 * @param center 
	 * @return List<Center>
	 */
	public List<Center> selectCenterList(Center center);

	/**
	 * 지점정보 수정 Service
	 * @param center
	 * @return int
	 */
	public int updateCenter(Center center);

	/**
	 * 지점정보 수정화면 페이지 Service
	 * @param centerNo
	 * @return Center
	 */
	public Center selectOneById(Integer centerNo);

	/**
	 * 지점 삭제 Service
	 * @param centerNo
	 * @return int
	 */
	public int deleteCenter(int centerNo);



	
	/*************** 회원 *****************/
	
	/**
	 * 지점 목록(회원) Service
	 * @param search
	 * @return
	 */
	public List<Search> selectCenterList(Search search);

	/**
	 * 지점 검색 Service
	 * @param search
	 * @return List<Center>
	 */
	public List<Search> selectSearch(Search search);
	
	
}
