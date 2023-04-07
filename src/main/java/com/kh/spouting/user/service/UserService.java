package com.kh.spouting.user.service;

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

	

}
