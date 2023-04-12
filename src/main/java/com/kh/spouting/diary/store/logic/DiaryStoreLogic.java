package com.kh.spouting.diary.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.diary.domain.Diary;
import com.kh.spouting.diary.store.DiaryStore;

@Repository
public class DiaryStoreLogic implements DiaryStore{

	@Override //글 작성
	public int insertDiary(SqlSession session, Diary diary) {
		int result = session.insert("DiaryMapper.insertDiary", diary);
		return result;
	}

	@Override //회원별 글 개수
	public int getTotalCount(SqlSession session, int userNo) {
		int result = session.selectOne("DiaryMapper.getTotalCount", userNo);
		return result;
	}

	@Override //회원번호로 찾기
	public List<Diary> selectByNo(SqlSession session, int userNo) {
		List<Diary> dList = session.selectList("DiaryMapper.selectByNo", userNo);
		return dList;
	}

	@Override //글번호로 찾기
	public Diary selectByDiaryNo(SqlSession session, Integer diaryNo) {
		Diary diary = session.selectOne("DiaryMapper.selectByDiaryNo", diaryNo );
		return diary;
	}

	@Override //글 삭제
	public int deleteDiary(SqlSession session, int diaryNo) {
		int result = session.delete("DiaryMapper.deleteDiary", diaryNo);
		return result;
	}

	@Override //글 삭제
	public int modifyDiary(SqlSession session, Diary diary) {
		int result = session.delete("DiaryMapper.modifyDiary", diary);
		return result;
	}
	
	

}
