package com.kh.spouting.message.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.message.domain.Message;
import com.kh.spouting.user.domain.User;

public interface MessageStore {

	List<Message> getMessageList(SqlSession session, int userNo);

	List<Message> getSendMessageList(SqlSession session, int userNo);

	Message oneMessageDetail(SqlSession session, int msgNo);

	List<User> searchUser(SqlSession session, String word);

}
