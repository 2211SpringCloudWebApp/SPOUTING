package com.kh.spouting.user.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spouting.user.domain.User;
import com.kh.spouting.user.service.UserService;
import com.kh.spouting.user.store.UserStore;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserStore uStore;
	@Autowired
	private SqlSession session;
	
	
	@Override //회원가입
	public int insertUser(User user) {
		int result = uStore.insertUser(session, user);
		return result;
	}
}
