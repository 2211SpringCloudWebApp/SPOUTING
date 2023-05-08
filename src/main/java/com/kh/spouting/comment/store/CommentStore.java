package com.kh.spouting.comment.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spouting.comment.domain.Comment;

public interface CommentStore {

	void writeComment(SqlSession session, Comment comment);

	List<Comment> getCommentList(SqlSession session, int inquiriesNo);

	int deleteComment(SqlSession session, Integer inquiryCommentNo);

}
