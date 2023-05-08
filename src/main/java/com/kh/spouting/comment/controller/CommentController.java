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
	
	// 댓글등록
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
	
	// 댓글목록
	@ResponseBody
	@RequestMapping(value="/list")
	public List<Comment> getCommentList(int inquiriesNo){
		List<Comment> cList = cService.getCommentList(inquiriesNo);
		return cList;
	}
	
	//댓글삭제
	@ResponseBody
	@RequestMapping(value="/deleteIComment", method=RequestMethod.POST)
	public String deleteComment(Integer commentNo) {
		try {
			System.out.println(commentNo);
			int result = cService.deleteComment(commentNo);
			if(result > 0) {
				return "success";
			} else {
				return "fail";
			}
		} catch (Exception e) {
			// TODO: handle exception
			return e.getMessage();
		}
	}
}
