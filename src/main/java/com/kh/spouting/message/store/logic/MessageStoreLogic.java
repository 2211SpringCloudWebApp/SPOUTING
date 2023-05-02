package com.kh.spouting.message.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.message.domain.Message;
import com.kh.spouting.message.store.MessageStore;

@Repository
public class MessageStoreLogic implements MessageStore{

	@Override
	public List<Message> getMessageList(SqlSession session, int userNo) {
		// TODO Auto-generated method stub
		return session.selectList("MessageMapper.getMessageList", userNo);
	}

	@Override
	public List<Message> getSendMessageList(SqlSession session, int userNo) {
		// TODO Auto-generated method stub
		return session.selectList("MessageMapper.getSendMessageList", userNo);
	}

	@Override
	public Message oneMessageDetail(SqlSession session, int msgNo) {
		// TODO Auto-generated method stub
		session.update("MessageMapper.msgOpenUpdate",msgNo);
		return session.selectOne("MessageMapper.oneMessageDetail", msgNo);
	}

}
