package com.kh.spouting.user.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.user.domain.User;
import com.kh.spouting.user.store.UserStore;

@Repository
public class UserStoreLogic implements UserStore {

	@Override //회원가입
	public int insertUser(SqlSession session, User user) {
		int result = session.insert("UserMapper.insertUser", user);
		return result;
	}

}
	