package com.kh.spouting.center.service;

import java.util.List;

import com.kh.spouting.center.domain.Center;

public interface CenterService {

	/**
	 * 지점 등록 Service
	 * @param center
	 * @return int
	 */
	public int insertCenter(Center center);

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
	 * 지점정보 상세 조회 Service
	 * @param centerNo
	 * @return Center
	 */
	public Center selectOnById(Integer centerNo);

	/**
	 * 지점 삭제 Service
	 * @param centerNo
	 * @return int
	 */
	public int deleteCenter(int centerNo);

}
