package com.kh.spouting.meeting.service;

import java.util.List;

import com.kh.spouting.meeting.domain.AllMemberProfile;
import com.kh.spouting.meeting.domain.Lineup;
import com.kh.spouting.meeting.domain.Meeting;
import com.kh.spouting.meeting.domain.ReaderProfile;

public interface MeetingService {

	List<Meeting> selectMeeting();

	int insertMeeting(Meeting meeting);

	Meeting selectOneByNumber(int meetingNo);

	int joinMeeting(Lineup joinMember);

	int getLineupCount(int meetingNo);

	String getReaderProfile(ReaderProfile readerProfile);

	List<AllMemberProfile> getAllMemberList(int meetingNo);

	AllMemberProfile getReaderProfile2(ReaderProfile readerProfile);

	
}
