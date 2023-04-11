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
	
	
	@Override //로그인
	public User selectIdPw(User user) {
		User userOne = uStore.selectIdPw(session, user);
		return userOne;
	}
	
	@Override //회원가입
	public int insertUser(User user) {
		int result = uStore.insertUser(session, user);
		return result;
	}

	@Override //아이디로찾기
	public User selectOneById(String userId) {
		User user = uStore.selectOneById(session, userId);
		return user;
	}

	@Override //아이디찾기
	public User findId(User uParam) {
		User user = uStore.findId(session, uParam);
		return user;
	}

	@Override //비밀번호 찾기
	public User findPw(User uParam) {
		User user = uStore.findPw(session, uParam);
		return user;
	}

	@Override //회원정보 수정
	public int updateUser(User user) {
		int result = uStore.updateUser(session, user);
		return result;
	}

	@Override //회원 탈퇴
	public int deleteUser(String userId) {
		int result = uStore.deleteUser(session, userId);
		return result;
	}

	
}
