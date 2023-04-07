package com.kh.spouting.user.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.user.domain.User;
import com.kh.spouting.user.store.UserStore;

@Repository
public class UserStoreLogic implements UserStore {

	@Override //로그인
	public User selectIdPw(SqlSession session, User user) {
		User userOne = session.selectOne("UserMapper.selectIdPw", user);
		return userOne;
	}
	
	@Override //회원가입
	public int insertUser(SqlSession session, User user) {
		int result = session.insert("UserMapper.insertUser", user);
		return result;
	}

	@Override //아이디로 회원찾기
	public User selectOneById(SqlSession session, String userId) {
		User user = session.selectOne("UserMapper.selectUserId", userId);
		return user;
	}

	@Override //아이디찾기
	public User findId(SqlSession session, User uParam) {
		User user = session.selectOne("UserMapper.findId", uParam);
		return user;
	}

	@Override //비밀번호찾기
	public User findPw(SqlSession session, User uParam) {
		User user = session.selectOne("UserMapper.findPw", uParam);
		return user;
	}

	

}
	