package com.kh.spouting.user.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
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

	
	
/* **************** 관리자 **************** */

	@Override //전체 회원 수
	public int getUserCount() {
		int result = uStore.getUserCount(session);
		return result;
	}
	
	@Override //전체 회원 목록
	public List<User> selectAllUser(PageInfo pi) {
		List<User> uList = uStore.selectAllUser(session, pi);
		return uList;
	}

	@Override //검색된 회원 수
	public int getUserCount(Search search) {
		int result = uStore.getUserCount(session, search);
		return result;
	}

	@Override //회원 검색
	public List<User> selectByKeyWord(PageInfo pi, Search search) {
		List<User> uList = uStore.selectByKeyWord(session, pi, search);
		return uList;
	}

	@Override //번호로 이름 찾기
	public User selectName(int userNo) {
		User user = uStore.selectName(session, userNo);
		return user;
	}
	
}
