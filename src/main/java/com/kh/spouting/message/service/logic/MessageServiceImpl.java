package com.kh.spouting.message.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spouting.message.domain.Message;
import com.kh.spouting.message.service.MessageService;
import com.kh.spouting.message.store.MessageStore;
import com.kh.spouting.user.domain.User;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private SqlSession session;
	
	@Autowired
	private MessageStore messageStore;

	@Override
	public List<Message> getMessageList(int userNo) {
		// TODO Auto-generated method stub
		return messageStore.getMessageList(session, userNo);
	}

	@Override
	public List<Message> getSendMessageList(int userNo) {
		// TODO Auto-generated method stub
		return messageStore.getSendMessageList(session, userNo);
	}

	@Override
	public Message oneMessageDetail(int msgNo) {
		// TODO Auto-generated method stub
		return messageStore.oneMessageDetail(session, msgNo);
	}

	@Override
	public List<User> searchUser(String word) {
		// TODO Auto-generated method stub
		return messageStore.searchUser(session, word);
	}

}
