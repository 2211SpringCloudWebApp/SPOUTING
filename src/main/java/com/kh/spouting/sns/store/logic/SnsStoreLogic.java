package com.kh.spouting.sns.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.meeting.domain.AllMemberProfile;
import com.kh.spouting.sns.domain.Follow;
import com.kh.spouting.sns.domain.Sns;
import com.kh.spouting.sns.domain.SnsComment;
import com.kh.spouting.sns.domain.SnsCommentNew;
import com.kh.spouting.sns.domain.SnsPhoto;
import com.kh.spouting.sns.domain.SnsProfile;
import com.kh.spouting.sns.store.SnsStore;

@Repository
public class SnsStoreLogic implements SnsStore {

	@Override
	public int insertPhoto(SqlSession session, SnsPhoto snsPhoto) {
		// TODO Auto-generated method stub
		return session.insert("SnsMapper.insertPhoto", snsPhoto);
	}

	@Override
	public SnsProfile selectOneById(SqlSession session, int userNo) {
		// TODO Auto-generated method stub
		return session.selectOne("SnsMapper.selectOneSns", userNo);
	}

	@Override
	public Sns updateUserProfile(SqlSession session, Sns userSns) {
		// TODO Auto-generated method stub
		session.update("SnsMapper.updateUserProfile", userSns);
		return session.selectOne("SnsMapper.selectOnsProfile", userSns);
	}

	@Override
	public List<SnsPhoto> morePhoto(SqlSession session, Integer start, int userNo) {
		// TODO Auto-generated method stub
		int limit = 3; //한 페이지당 몇개를 보여줄 것인가
		int offset = (start - 1) * limit; //커런트 페이지에 따라서 몇번째부터 갖고 올 것인가
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("SnsMapper.morePhotoList", userNo, rowBounds);
	}

	@Override
	public int getTotalCount(SqlSession session, int userNo) {
		// TODO Auto-generated method stub
		return session.selectOne("SnsMapper.getTotalCount", userNo);
	}

	@Override
	public int updateProfilePhoto(SqlSession session, Sns sns) {
		// TODO Auto-generated method stub
		return session.update("SnsMapper.updateProfilePhoto", sns);
	}

	@Override
	public SnsPhoto selectDetailPage(SqlSession session, int snsPhotoNo) {
		// TODO Auto-generated method stub
		return session.selectOne("SnsMapper.selectDetailPage", snsPhotoNo);
	}

	@Override
	public int insertComment(SqlSession session, SnsComment snsComment) {
		// TODO Auto-generated method stub
		return session.insert("SnsMapper.insertComment", snsComment);
	}

	@Override
	public List<SnsCommentNew> selectAllComment(SqlSession session, Integer snsPhotoNo) {
		// TODO Auto-generated method stub
		return session.selectList("SnsMapper.selectAllCommentList", snsPhotoNo);
	}

	@Override
	public int deleteComment(SqlSession session, Integer snsCommentNo) {
		// TODO Auto-generated method stub
		return session.delete("SnsMapper.deleteComment",snsCommentNo);
	}

	@Override
	public int snsDelete(SqlSession session, int snsPhotoNo) {
		// TODO Auto-generated method stub
		return session.delete("SnsMapper.snsDelete",snsPhotoNo);
	}

	@Override
	public int followUser(SqlSession session, Follow followUser) {
		// TODO Auto-generated method stub
		return session.insert("SnsMapper.followUser", followUser);
	}

	@Override
	public int getFollowingCount(SqlSession session, int userNo) {
		// TODO Auto-generated method stub
		return session.selectOne("SnsMapper.getFollowingCount", userNo);
	}

	@Override
	public int getFollowerCount(SqlSession session, int userNo) {
		// TODO Auto-generated method stub
		return session.selectOne("SnsMapper.getFollowerCount", userNo);
	}

	@Override
	public List<AllMemberProfile> getFollowingList(SqlSession session, int userNo) {
		// TODO Auto-generated method stub
		return session.selectList("SnsMapper.getFollowingList", userNo);
	}

	@Override
	public List<AllMemberProfile> getFollowerList(SqlSession session, int userNo) {
		// TODO Auto-generated method stub
		return session.selectList("SnsMapper.getFollowerList", userNo);
	}

	@Override
	public List<SnsPhoto> getPhotos(SqlSession session, int userNo) {
		// TODO Auto-generated method stub
		return session.selectList("SnsMapper.getPhotos", userNo);
	}


}
