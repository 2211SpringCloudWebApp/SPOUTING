package com.kh.spouting.diary.service;

import java.util.List;

import com.kh.spouting.diary.domain.Diary;

public interface DiaryService {

	/**
	 * 글 작성 Service
	 * @param diary
	 * @return int
	 */
	public int insertDiary(Diary diary);

	/**
	 * 회원별 글 개수 Service
	 * @param userNo
	 * @return int
	 */
	public int getTotalCount(int userNo);

	/**
	 * 회원번호로 찾기 Service
	 * @param userNo
	 * @param start 
	 * @param pi
	 * @return List<Diary>
	 */
	public List<Diary> selectDiaryList(int userNo, Integer start);

	/**
	 * 글번호로 찾기 Service
	 * @param diaryNo
	 * @return Diary
	 */
	public Diary selectByDiaryNo(Integer diaryNo);

	/**
	 * 글 삭제 Service
	 * @param diaryNo
	 * @return int
	 */
	public int deleteDiary(int diaryNo);

	/**
	 * 글 수정 Service
	 * @param diary
	 * @return int
	 */
	public int modifyDiary(Diary diary);

}
