package com.kh.spouting.comment.service;

import java.util.List;

import com.kh.spouting.comment.domain.Comment;

public interface CommentService {

	void writeComment(Comment comment);

	List<Comment> getCommentList(int inquiriesNo);

	int deleteComment(Integer commentNo);

}
