package com.kh.spouting.sns.service;

import com.kh.spouting.sns.domain.Sns;
import com.kh.spouting.sns.domain.SnsPhoto;

public interface SnsService {

	int insertPhoto(SnsPhoto snsPhoto);

	Sns selectOneById(int userNo);

}
