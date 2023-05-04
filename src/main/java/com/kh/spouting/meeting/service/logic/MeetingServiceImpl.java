package com.kh.spouting.meeting.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spouting.meeting.domain.AllMemberProfile;
import com.kh.spouting.meeting.domain.Lineup;
import com.kh.spouting.meeting.domain.Meeting;
import com.kh.spouting.meeting.domain.ReaderProfile;
import com.kh.spouting.meeting.service.MeetingService;
import com.kh.spouting.meeting.store.MeetingStore;

@Service
public class MeetingServiceImpl implements MeetingService {
	
	@Autowired
	private MeetingStore meetingStore;
	
	@Autowired
	private SqlSession session;
	

	@Override
	public List<Meeting> selectMeeting() {
		// TODO Auto-generated method stub
		return meetingStore.selectMeeting(session);
	}


	@Override
	public int insertMeeting(Meeting meeting) {
		// TODO Auto-generated method stub
		return meetingStore.insertMeeting(session, meeting);
	}


	@Override
	public Meeting selectOneByNumber(int meetingNo) {
		// TODO Auto-generated method stub
		return meetingStore.selectOneByNumber(session, meetingNo);
	}


	@Override
	public int joinMeeting(Lineup joinMember) {
		// TODO Auto-generated method stub
		return meetingStore.joinMeeting(session, joinMember);
	}


	@Override
	public int getLineupCount(int meetingNo) {
		// TODO Auto-generated method stub
		return meetingStore.getLineupCount(session, meetingNo);
	}


	@Override
	public String getReaderProfile(ReaderProfile readerProfile) {
		// TODO Auto-generated method stub
		return meetingStore.getReaderProfile(session, readerProfile);
	}


	@Override
	public List<AllMemberProfile> getAllMemberList(int meetingNo) {
		// TODO Auto-generated method stub
		return meetingStore.getAllMemberList(session, meetingNo);
	}


	@Override
	public AllMemberProfile getReaderProfile2(ReaderProfile readerProfile) {
		// TODO Auto-generated method stub
		return meetingStore.getReaderProfile2(session, readerProfile);
	}


	@Override
	public int deleteMeeting(int meetingNo) {
		// TODO Auto-generated method stub
		return meetingStore.deleteMeeting(session, meetingNo);
	}



}