package com.kh.spouting.comment.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.comment.domain.Comment;
import com.kh.spouting.comment.store.CommentStore;

@Repository
public class CommentStoreLogic implements CommentStore{

	@Override
	public void writeComment(SqlSession session, Comment comment) {
		session.insert("CommentMapper.writeComment", comment);
		
	}

	@Override
	public List<Comment> getCommentList(SqlSession session, int inquiriesNo) {
		List<Comment> cList = session.selectList("CommentMapper.getCommentList", inquiriesNo);
		return cList;
	}

}
