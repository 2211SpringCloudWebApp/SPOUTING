package com.kh.spouting.user.service;

import java.util.List;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.user.domain.User;

public interface UserService {

	/**
	 * 로그인 Service
	 * @param uParam
	 * @return User
	 */
	public User selectIdPw(User user);
	
	/**
	 * 회원가입 Service
	 * @param user
	 * @return int
	 */
	public int insertUser(User user);

	/**
	 * 아이디로 회원 조회 Service
	 * @param userId
	 * @return User
	 */
	public User selectOneById(String userId);

	/**
	 * 회원 아이디찾기 Service
	 * @param uParam
	 * @return User
	 */
	public User findId(User uParam);

	/**
	 * 회원 비밀번호 찾기 Service
	 * @param uParam
	 * @return User
	 */
	public User findPw(User uParam);

	/** 
	 * 회원정보 수정 Service
	 * @param user
	 * @return int
	 */
	public int updateUser(User user);

	/**
	 * 회원 탈퇴 Service
	 * @param userId
	 * @return int
	 */
	public int deleteUser(String userId);

	
/* **************** 관리자 **************** */
	
	/**
	 * 전체 회원 수 Service
	 * @return int
	 */
	public int getUserCount();

	/**
	 * 전체 회원 목록 Service
	 * @param pi
	 * @return List<User>
	 */
	public List<User> selectAllUser(PageInfo pi);

	/**
	 * 검색된 회원 수 Service
	 * @param search
	 * @return int
	 */
	public int getUserCount(Search search);

	/**
	 * 회원 검색 Service
	 * @param pi
	 * @param search
	 * @return List<User>
	 */
	public List<User> selectByKeyWord(PageInfo pi, Search search);

	/**
	 * 번호로 이름 찾기
	 * @param userNo
	 * @return User
	 */
	public User selectName(int userNo);

	

}
