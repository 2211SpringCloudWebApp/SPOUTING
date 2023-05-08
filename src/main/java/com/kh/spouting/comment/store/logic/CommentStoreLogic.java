package com.kh.spouting.comment.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spouting.comment.domain.Comment;
import com.kh.spouting.comment.store.CommentStore;

@Repository
public class CommentStoreLogic implements CommentStore{

	// 댓글등록 
	@Override
	public void writeComment(SqlSession session, Comment comment) {
		session.insert("CommentMapper.writeComment", comment);
		
	}

	// 댓글목록 
	@Override
	public List<Comment> getCommentList(SqlSession session, int inquiriesNo) {
		List<Comment> cList = session.selectList("CommentMapper.getCommentList", inquiriesNo);
		return cList;
	}

	// 댓글삭제 
	@Override
	public int deleteComment(SqlSession session, Integer commentNo) {
		int result = session.delete("CommentMapper.deleteComment", commentNo);
		return result;
	}

}
