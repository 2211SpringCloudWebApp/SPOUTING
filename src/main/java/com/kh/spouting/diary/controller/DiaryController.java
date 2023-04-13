package com.kh.spouting.diary.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spouting.common.FileUtil;
import com.kh.spouting.diary.domain.Diary;
import com.kh.spouting.diary.service.DiaryService;
import com.kh.spouting.user.domain.User;




@Controller
public class DiaryController {
	
	@Autowired
	private DiaryService dService;
	
	@Autowired
	private FileUtil fileUtil;

	/*===================================================
	 * 하루기록 기능
	 *===================================================*/	
	
	//글 등록
	@GetMapping("/diary/insert") //등록 View
	public String insertView() {
		return "diary/insert";
	}
	
	@PostMapping("/diary/insert")
	public ModelAndView insertLogic(
			ModelAndView mv
			, @RequestParam(name = "uploadFile", required = false) MultipartFile multi
			, HttpServletRequest request
			, @ModelAttribute Diary diary) {
		Map<String, String> fileInfo = null;
		try {
			HttpSession session = request.getSession();
			int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
			diary.setUserNo(userNo);
			
			fileInfo = fileUtil.saveFile(multi, request, "diary");
			diary.setDiaryFilename(fileInfo.get("rename"));
			diary.setDiaryFilepath(fileInfo.get("renameFilepath"));
			
			int result = dService.insertDiary(diary);
			if(result>0) {
				mv.setViewName("redirect:/diary/list");	
			} else {
				mv.setViewName("common/error");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	//글 목록
	
	@GetMapping("/diary/list") //글 목록 View
	public String diaryListView(
			HttpServletRequest request
			,Model model) {
		try {
			HttpSession session = request.getSession();
			int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
			List<Diary> dList = dService.selectByNo(userNo);
			model.addAttribute("dList", dList);
			return "diary/list";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	//글 수정
	
	@GetMapping("/diary/detail") //글 수정 View
	public String diaryModifyView( 
			@RequestParam("diaryNo") Integer diaryNo
			, Model model) {
			Diary diary = dService.selectByDiaryNo(diaryNo);
			model.addAttribute("diary", diary);
			return "diary/detail";
	}
	 
	@PostMapping("/diary/detail") //글 수정 Logic
	public String diaryModifyLogic( 
			@ModelAttribute Diary diary
			, HttpServletRequest request
			, Model model) {
		try {
			HttpSession session = request.getSession();
			int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
			diary.setUserNo(userNo);
			int result = dService.modifyDiary(diary);
			if(result>0) {
				return "redirect:/diary/detail?diaryNo="+diary.getDiaryNo();
			} else {
				model.addAttribute("msg", "레슨 수정 실패");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	//글 삭제
	@GetMapping("/diary/delete") 
	public String deleteDiary(
			@RequestParam("diaryNo") int diaryNo
			, Model model) {
		try {
			int result = dService.deleteDiary(diaryNo);
			model.addAttribute("diary", diaryNo);
			if(result > 0) {
				return "redirect:/diary/list";
			} else {
				model.addAttribute("msg", "삭제 실패");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	
	
}
