package com.kh.spouting.diary.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spouting.diary.domain.Diary;
import com.kh.spouting.diary.service.DiaryService;
import com.kh.spouting.diary.store.DiaryStore;

@Service
public class DiaryServiceImpl implements DiaryService{

	@Autowired
	private DiaryStore dStore;
	
	@Autowired
	private SqlSession session;
	
	@Override //글 작성
	public int insertDiary(Diary diary) {
		int result = dStore.insertDiary(session, diary);
		return result;
	}

	@Override //회원별 글 개수
	public int getTotalCount(int userNo) {
		int result = dStore.getTotalCount(session, userNo);
		return result;
	}

	@Override //회원번호로 찾기
	public List<Diary> selectDiaryList(int userNo, Integer start) {
		List<Diary> dList = dStore.selectDiaryList(session, userNo, start);
		return dList;
	}

	@Override //글번호로 찾기
	public Diary selectByDiaryNo(Integer diaryNo) {
		Diary diary = dStore.selectByDiaryNo(session, diaryNo);
		return diary;
	}
	
	@Override //글 삭제
	public int deleteDiary(int diaryNo) {
		int result = dStore.deleteDiary(session, diaryNo);
		return result;
	}

	@Override //글 수정
	public int modifyDiary(Diary diary) {
		int result = dStore.modifyDiary(session, diary);
		return result;
	}

}
