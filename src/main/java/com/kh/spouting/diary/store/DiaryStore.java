package com.kh.spouting.diary.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.diary.domain.Diary;

public interface DiaryStore {

	/**
	 * 글 작성 Store
	 * @param session
	 * @param diary
	 * @return int
	 */
	public int insertDiary(SqlSession session, Diary diary);

	/**
	 * 회원별 글 개수 Store
	 * @param session
	 * @param userNo
	 * @return int
	 */
	public int getTotalCount(SqlSession session, int userNo);

	/**
	 * 회원번호로 찾기 Store
	 * @param session
	 * @param userNo
	 * @param pi
	 * @return List<Diary>
	 */
	public List<Diary> selectByNo(SqlSession session, int userNo);

	/**
	 * 글번호로 찾기 Store
	 * @param session
	 * @param diaryNo
	 * @return Diary
	 */
	public Diary selectByDiaryNo(SqlSession session, Integer diaryNo);

	/**
	 * 글 삭제 Store
	 * @param session
	 * @param diaryNo
	 * @return int
	 */
	public int deleteDiary(SqlSession session, int diaryNo);

	/**
	 * 글 수정 Store
	 * @param session
	 * @param diary
	 * @return int
	 */
	public int modifyDiary(SqlSession session, Diary diary);

}
