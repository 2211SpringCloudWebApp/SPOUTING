package com.kh.spouting.sns.service;

import java.util.List;

import com.kh.spouting.meeting.domain.AllMemberProfile;
import com.kh.spouting.sns.domain.Follow;
import com.kh.spouting.sns.domain.Sns;
import com.kh.spouting.sns.domain.SnsComment;
import com.kh.spouting.sns.domain.SnsCommentNew;
import com.kh.spouting.sns.domain.SnsPhoto;
import com.kh.spouting.sns.domain.SnsProfile;

public interface SnsService {

	int insertPhoto(SnsPhoto snsPhoto);

	SnsProfile selectOneById(int userNo);

	Sns updateUserProfile(Sns userSns);

	List<SnsPhoto> morePhoto(Integer start, int userNo);

	int getTotalCount(int userNo);

	int insertPhoto(Sns sns);

	SnsPhoto snsDetailPage(int snsPhotoNo);

	int insertComment(SnsComment snsComment);

	List<SnsCommentNew> selectAllComment(Integer snsPhotoNo);

	int deleteComment(Integer snsCommentNo);

	int snsDelete(int snsPhotoNo);

	int followUser(Follow followUser);

	int getFollowingCount(int userNo);

	int getFollowerCount(int userNo);

	List<AllMemberProfile> getFollowingList(int userNo);

	List<AllMemberProfile> getFollowerList(int userNo);

	List<SnsPhoto> getPhotos(int userNo);


}
