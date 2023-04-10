package com.kh.spouting.meeting.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.meeting.domain.Meeting;
import com.kh.spouting.meeting.store.MeetingStore;

@Repository
public class MeetingStoreLogic implements MeetingStore {

	@Override
	public List<Meeting> selectMeeting(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("MeetingMapper.selectMeeting");
	}

	@Override
	public int insertMeeting(SqlSession session, Meeting meeting) {
		// TODO Auto-generated method stub
		return session.insert("MeetingMapper.insertMeeting", meeting);
	}

}
