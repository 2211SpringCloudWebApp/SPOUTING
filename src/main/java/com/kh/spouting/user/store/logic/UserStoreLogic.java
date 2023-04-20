package com.kh.spouting.user.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
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

	@Override //회원정보 수정
	public int updateUser(SqlSession session, User user) {
		int result = session.update("UserMapper.updateUser", user);
		return result;
	}

	@Override //회원 탈퇴
	public int deleteUser(SqlSession session, String userId) {
		int result = session.delete("UserMapper.deleteUser", userId);
		return result;
	}



/* **************** 관리자 **************** */	

	@Override //전체 회원 수
	public int getUserCount(SqlSession session) {
		int result = session.selectOne("UserMapper.getUserCount");
		return result;
	}
	
	@Override //전체 회원 목록
	public List<User> selectAllUser(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage -1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<User> uList = session.selectList("UserMapper.selectAllUser", null, rowBounds);
		return uList;
	}

	@Override //검색된 회원 수
	public int getUserCount(SqlSession session, Search search) {
		int result = session.selectOne("UserMapper.countBySearch", search);
		return result;
	}

	@Override //회원 검색
	public List<User> selectByKeyWord(SqlSession session, PageInfo pi, Search search) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<User> uList = session.selectList("UserMapper.selectByKeyWord", search, rowBounds);
		return uList;
	}
}
	