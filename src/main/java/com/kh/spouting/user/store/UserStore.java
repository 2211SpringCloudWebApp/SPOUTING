package com.kh.spouting.user.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
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

	/**
	 * 회원정보 수정 Store
	 * @param session
	 * @param user
	 * @return int
	 */
	public int updateUser(SqlSession session, User user);

	/**
	 * 회원 탈퇴 Store
	 * @param session
	 * @param userId
	 * @return int
	 */
	public int deleteUser(SqlSession session, String userId);


	
/* **************** 관리자 **************** */
	
	/**
	 * 전체 회원 수 Store
	 * @param session
	 * @return int
	 */
	public int getUserCount(SqlSession session);
	
	/**
	 * 전체 회원 목록 Store
	 * @param session
	 * @param pi
	 * @return List<User>
	 */
	public List<User> selectAllUser(SqlSession session, PageInfo pi);

	/**
	 * 검색된 회원 수 Store
	 * @param session
	 * @param search
	 * @return
	 */
	public int getUserCount(SqlSession session, Search search);

	/**
	 * 회원 검색 Store
	 * @param session
	 * @param pi
	 * @param search
	 * @return List<User>
	 */
	public List<User> selectByKeyWord(SqlSession session, PageInfo pi, Search search);
}
