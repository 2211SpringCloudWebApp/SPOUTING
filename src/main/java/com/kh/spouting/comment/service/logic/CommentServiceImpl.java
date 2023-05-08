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

	// 댓글등록
	@Override
	public void writeComment(Comment comment) {
		cStore.writeComment(session, comment);
		
	}

	// 댓글목록 
	@Override
	public List<Comment> getCommentList(int inquiriesNo) {
		List<Comment> cList = cStore.getCommentList(session, inquiriesNo);
		return cList;
	}

	// 댓글삭제 
	@Override
	public int deleteComment(Integer commentNo) {
		int result = cStore.deleteComment(session, commentNo);
		return result;
	}


}
