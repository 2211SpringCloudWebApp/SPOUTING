package com.kh.spouting.message.domain;

import java.sql.Timestamp;

public class Message {
	
	private int msgNo;
	private int sendUser;
	private int receiveUser;
	private String userName;
	private Timestamp sendTime;
	private String msgContent;
	private int msgOpenCk;
	
	public Message() {
		// TODO Auto-generated constructor stub
	}

	public Message(int msgNo, int sendUser, int receiveUser, String userName, Timestamp sendTime, String msgContent,
			int msgOpenCk) {
		super();
		this.msgNo = msgNo;
		this.sendUser = sendUser;
		this.receiveUser = receiveUser;
		this.userName = userName;
		this.sendTime = sendTime;
		this.msgContent = msgContent;
		this.msgOpenCk = msgOpenCk;
	}

	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public int getSendUser() {
		return sendUser;
	}

	public void setSendUser(int sendUser) {
		this.sendUser = sendUser;
	}

	public int getReceiveUser() {
		return receiveUser;
	}

	public void setReceiveUser(int receiveUser) {
		this.receiveUser = receiveUser;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Timestamp getSendTime() {
		return sendTime;
	}

	public void setSendTime(Timestamp sendTime) {
		this.sendTime = sendTime;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public int getMsgOpenCk() {
		return msgOpenCk;
	}

	public void setMsgOpenCk(int msgOpenCk) {
		this.msgOpenCk = msgOpenCk;
	}

	@Override
	public String toString() {
		return "Message [msgNo=" + msgNo + ", sendUser=" + sendUser + ", receiveUser=" + receiveUser + ", userName="
				+ userName + ", sendTime=" + sendTime + ", msgContent=" + msgContent + ", msgOpenCk=" + msgOpenCk + "]";
	}
	
	

}
