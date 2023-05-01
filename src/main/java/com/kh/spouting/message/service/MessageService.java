package com.kh.spouting.message.service;

import java.util.List;

import com.kh.spouting.message.domain.Message;
import com.kh.spouting.user.domain.User;

public interface MessageService {

	List<Message> getMessageList(int userNo);

	List<Message> getSendMessageList(int userNo);

	Message oneMessageDetail(int msgNo);

	List<User> searchUser(String word);

}
