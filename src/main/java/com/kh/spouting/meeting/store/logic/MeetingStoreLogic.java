package com.kh.spouting.meeting.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.common.PageInfo;
import com.kh.spouting.meeting.domain.AllMemberProfile;
import com.kh.spouting.meeting.domain.Lineup;
import com.kh.spouting.meeting.domain.Meeting;
import com.kh.spouting.meeting.domain.ReaderProfile;
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

	@Override
	public Meeting selectOneByNumber(SqlSession session, int meetingNo) {
		// TODO Auto-generated method stub
		return session.selectOne("MeetingMapper.selectOneMeeting", meetingNo);
	}

	@Override
	public int joinMeeting(SqlSession session, Lineup joinMember) {
		// TODO Auto-generated method stub
		return session.insert("MeetingMapper.joinMeeting", joinMember);
	}

	@Override
	public int getLineupCount(SqlSession session, int meetingNo) {
		// TODO Auto-generated method stub
		return session.selectOne("MeetingMapper.getLineupCount", meetingNo);
	}

	@Override
	public String getReaderProfile(SqlSession session, ReaderProfile readerProfile) {
		// TODO Auto-generated method stub
		return session.selectOne("MeetingMapper.getReaderProfile", readerProfile);
	}

	@Override
	public List<AllMemberProfile> getAllMemberList(SqlSession session, int meetingNo) {
		// TODO Auto-generated method stub
		return session.selectList("MeetingMapper.getAllMemberList", meetingNo);
	}

	@Override
	public AllMemberProfile getReaderProfile2(SqlSession session, ReaderProfile readerProfile) {
		// TODO Auto-generated method stub
		return session.selectOne("MeetingMapper.getReaderProfile2", readerProfile);
	}

	@Override
	public int deleteMeeting(SqlSession session, int meetingNo) {
		// TODO Auto-generated method stub
		return session.delete("MeetingMapper.deleteMeeting", meetingNo);
	}

	
	//마이페이지 소셜링 리스트  + 페이징
	@Override
	public List<Meeting> selectMyMeeting(SqlSession session, PageInfo pi, int userNo) {
		// TODO Auto-generated method stub
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("MeetingMapper.selectMyList", userNo, rowBounds);
	}

	@Override
	public int getMeetingListCount(SqlSession session, int userNo) {
		// TODO Auto-generated method stub
		return session.selectOne("MeetingMapper.getMeetingListCount", userNo);
	}





}
