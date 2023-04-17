package com.kh.spouting.sns.service;

import com.kh.spouting.sns.domain.Sns;
import com.kh.spouting.sns.domain.SnsPhoto;
import com.kh.spouting.sns.domain.SnsProfile;

public interface SnsService {

	int insertPhoto(SnsPhoto snsPhoto);

	SnsProfile selectOneById(int userNo);


}
