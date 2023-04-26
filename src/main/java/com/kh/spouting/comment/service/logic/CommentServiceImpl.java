package com.kh.spouting.comment.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spouting.comment.domain.Comment;
import com.kh.spouting.comment.service.CommentService;
import com.kh.spouting.comment.store.CommentStore;

@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	private CommentStore cStore;
	
	@Autowired
	private SqlSession session;

	@Override
	public void writeComment(Comment comment) {
		cStore.writeComment(session, comment);
		
	}

	@Override
	public List<Comment> getCommentList(int inquiriesNo) {
		List<Comment> cList = cStore.getCommentList(session, inquiriesNo);
		return cList;
	}


}
