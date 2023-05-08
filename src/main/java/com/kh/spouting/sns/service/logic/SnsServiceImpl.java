package com.kh.spouting.sns.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spouting.meeting.domain.AllMemberProfile;
import com.kh.spouting.sns.domain.Follow;
import com.kh.spouting.sns.domain.Sns;
import com.kh.spouting.sns.domain.SnsComment;
import com.kh.spouting.sns.domain.SnsCommentNew;
import com.kh.spouting.sns.domain.SnsPhoto;
import com.kh.spouting.sns.domain.SnsProfile;
import com.kh.spouting.sns.service.SnsService;
import com.kh.spouting.sns.store.SnsStore;

@Service
public class SnsServiceImpl implements SnsService {
	
	@Autowired
	private SnsStore snsStore;
	
	@Autowired
	private SqlSession session;

	@Override
	public int insertPhoto(SnsPhoto snsPhoto) {
		// TODO Auto-generated method stub
		return snsStore.insertPhoto(session, snsPhoto);
	}

	@Override
	public SnsProfile selectOneById(int userNo) {
		// TODO Auto-generated method stub
		return snsStore.selectOneById(session, userNo);
	}

	@Override
	public Sns updateUserProfile(Sns userSns) {
		// TODO Auto-generated method stub
		return snsStore.updateUserProfile(session, userSns);
	}

	@Override
	public List<SnsPhoto> morePhoto(Integer start, int userNo) {
		// TODO Auto-generated method stub
		return snsStore.morePhoto(session, start, userNo);
	}

	@Override
	public int getTotalCount(int userNo) {
		// TODO Auto-generated method stub
		return snsStore.getTotalCount(session, userNo);
	}

	@Override
	public int insertPhoto(Sns sns) {
		// TODO Auto-generated method stub
		return snsStore.updateProfilePhoto(session, sns);
	}

	@Override
	public SnsPhoto snsDetailPage(int snsPhotoNo) {
		// TODO Auto-generated method stub
		return snsStore.selectDetailPage(session, snsPhotoNo);
	}

	@Override
	public int insertComment(SnsComment snsComment) {
		// TODO Auto-generated method stub
		return snsStore.insertComment(session, snsComment);
	}

	@Override
	public List<SnsCommentNew> selectAllComment(Integer snsPhotoNo) {
		// TODO Auto-generated method stub
		return snsStore.selectAllComment(session, snsPhotoNo);
	}

	@Override
	public int deleteComment(Integer snsCommentNo) {
		// TODO Auto-generated method stub
		return snsStore.deleteComment(session, snsCommentNo);
	}

	@Override
	public int snsDelete(int snsPhotoNo) {
		// TODO Auto-generated method stub
		return snsStore.snsDelete(session, snsPhotoNo);
	}

	@Override
	public int followUser(Follow followUser) {
		// TODO Auto-generated method stub
		return snsStore.followUser(session, followUser);
	}

	@Override
	public int getFollowingCount(int userNo) {
		// TODO Auto-generated method stub
		return snsStore.getFollowingCount(session, userNo);
	}

	@Override
	public int getFollowerCount(int userNo) {
		// TODO Auto-generated method stub
		return snsStore.getFollowerCount(session, userNo);
	}

	@Override
	public List<AllMemberProfile> getFollowingList(int userNo) {
		// TODO Auto-generated method stub
		return snsStore.getFollowingList(session, userNo);
	}

	@Override
	public List<AllMemberProfile> getFollowerList(int userNo) {
		// TODO Auto-generated method stub
		return snsStore.getFollowerList(session, userNo);
	}


}
