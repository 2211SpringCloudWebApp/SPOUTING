package com.kh.spouting.meeting.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.meeting.domain.Lineup;
import com.kh.spouting.meeting.domain.Meeting;

public interface MeetingStore {

	List<Meeting> selectMeeting(SqlSession session);

	int insertMeeting(SqlSession session, Meeting meeting);

	Meeting selectOneByNumber(SqlSession session, int meetingNo);

	int joinMeeting(SqlSession session, Lineup joinMember);


}
