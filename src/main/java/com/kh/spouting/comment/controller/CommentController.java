package com.kh.spouting.comment.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.spouting.comment.domain.Comment;
import com.kh.spouting.comment.service.CommentService;
import com.kh.spouting.user.domain.User;

@Controller
@RequestMapping(value="/comment")
public class CommentController {

	@Autowired
	private CommentService cService;
	
	@ResponseBody
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writeComment(Comment comment) {
		try {
			cService.writeComment(comment);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	
	// 댓글작성
//	@ResponseBody
//	@RequestMapping(value="/commentList", produces="application/json;charset=utf-8")
//	public String commentList(@RequestParam int inquiriesNo) {
//			String commentContent = request.getParameter("commentContent");
//			int inquiriesNo = Integer.parseInt(request.getParameter("inquiriesNo"));
//			int userNo = Integer.parseInt(request.getParameter("userNo"));
			
//			Comment newComment = new Comment();
//			newComment.setCommentContent(commentContent);
//			newComment.setInquiriesNo(inquiriesNo);
//			newComment.setUserNo(userNo);
			
//			int result = cService.insertComment(newComment);
//			return null;
//		List<Comment> cList = cService.printAllComment(inquiriesNo);
//		if(!cList.isEmpty()) {
//			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
//			return gson.toJson(cList);
//		}
//		return null;
//	}
	
	@ResponseBody
	@RequestMapping(value="/list")
	public List<Comment> getCommentList(int inquiriesNo){
		List<Comment> cList = cService.getCommentList(inquiriesNo);
		return cList;
	}
}
