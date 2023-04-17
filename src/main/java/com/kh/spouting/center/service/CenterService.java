package com.kh.spouting.center.service;

import java.util.List;
import java.util.Map;

import com.kh.spouting.center.domain.Center;

public interface CenterService {

	/**
	 * 지점 등록 Service
	 * @param center
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
	 * 이미지 불러오기 Serivce
	 * @param centerNo
	 * @return Map<String, String>
	 */
	public Center loadImage(String centerNo);

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

}
