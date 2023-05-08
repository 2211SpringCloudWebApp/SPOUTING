package com.kh.spouting.meeting.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.meeting.domain.AllMemberProfile;
import com.kh.spouting.meeting.domain.Lineup;
import com.kh.spouting.meeting.domain.Meeting;
import com.kh.spouting.meeting.domain.ReaderProfile;

public interface MeetingStore {

	List<Meeting> selectMeeting(SqlSession session);

	int insertMeeting(SqlSession session, Meeting meeting);

	Meeting selectOneByNumber(SqlSession session, int meetingNo);

	int joinMeeting(SqlSession session, Lineup joinMember);

	int getLineupCount(SqlSession session, int meetingNo);

	String getReaderProfile(SqlSession session, ReaderProfile readerProfile);

	List<AllMemberProfile> getAllMemberList(SqlSession session, int meetingNo);

	AllMemberProfile getReaderProfile2(SqlSession session, ReaderProfile readerProfile);

	int deleteMeeting(SqlSession session, int meetingNo);

	List<Meeting> selectMyMeeting(SqlSession session, PageInfo pi, int userNo);

	int getMeetingListCount(SqlSession session, int userNo);

	

	



}
