package com.kh.spouting.user.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.user.domain.User;

public interface UserStore {

	/**
	 * 회원가입 Store
	 * @param session
	 * @param user
	 * @return int
	 */
	public int insertUser(SqlSession session, User user);

}
