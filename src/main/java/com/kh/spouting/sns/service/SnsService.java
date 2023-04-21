package com.kh.spouting.sns.service;

import java.util.List;

import com.kh.spouting.sns.domain.Sns;
import com.kh.spouting.sns.domain.SnsPhoto;
import com.kh.spouting.sns.domain.SnsProfile;

public interface SnsService {

	int insertPhoto(SnsPhoto snsPhoto);

	SnsProfile selectOneById(int userNo);

	Sns updateUserProfile(Sns userSns);

	List<SnsPhoto> morePhoto(Integer start, int userNo);

	int getTotalCount(int userNo);

	int insertPhoto(Sns sns);


}
