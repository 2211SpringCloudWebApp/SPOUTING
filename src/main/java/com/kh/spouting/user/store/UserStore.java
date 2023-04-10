package com.kh.spouting.user.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.user.domain.User;

public interface UserStore {

	/**
	 * 로그인 Store
	 * @param session
	 * @param user
	 * @return User
	 */
	public User selectIdPw(SqlSession session, User user);

	
	/**
	 * 회원가입 Store
	 * @param session
	 * @param user
	 * @return int
	 */
	public int insertUser(SqlSession session, User user);

	/**
	 * 아이디로 회원 조회 Store
	 * @param session
	 * @param userId
	 * @return User
	 */
	public User selectOneById(SqlSession session, String userId);

	/**
	 * 회원 아이디찾기 Store
	 * @param session
	 * @param uParam
	 * @return User
	 */
	public User findId(SqlSession session, User uParam);

	/**
	 * 회원 비밀번호찾기 Store
	 * @param session
	 * @param uParam
	 * @return User
	 */
	public User findPw(SqlSession session, User uParam);

	
}
