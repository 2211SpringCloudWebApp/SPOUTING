package com.kh.spouting.user.service;

import com.kh.spouting.user.domain.User;

public interface UserService {

	/**
	 * 회원가입 Service
	 * @param user
	 * @return int
	 */
	public int insertUser(User user);

}
