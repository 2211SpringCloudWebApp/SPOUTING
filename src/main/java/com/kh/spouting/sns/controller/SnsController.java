package com.kh.spouting.sns.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spouting.common.FileUtil;
import com.kh.spouting.sns.domain.SnsPhoto;
import com.kh.spouting.sns.domain.SnsProfile;
import com.kh.spouting.sns.service.SnsService;

@Controller
public class SnsController {
	
	@Autowired
	private SnsService snsService;
	
	@Autowired
	@Qualifier("fileUtil")
	private FileUtil fileUtil;
	
	@RequestMapping(value="/sns", method=RequestMethod.GET)
	public String snsPage(Model model, @RequestParam("userNo") int userNo) {
		try {
			SnsProfile oneSns = snsService.selectOneById(userNo);
			if(oneSns != null) {
				model.addAttribute("oneSns", oneSns);
				return "sns/sns";
			} else {
				model.addAttribute("msg", "데이터가 존재하지 않습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	
	@RequestMapping(value="/sns/uploadPage", method=RequestMethod.GET)
	public ModelAndView snsPhotoInsertPage(ModelAndView mv) {
		mv.setViewName("/sns/sns-insert");
		return mv;
	}
	
	@RequestMapping(value="/sns/upload", method=RequestMethod.POST)
	public ModelAndView snsPhotoInsert(
						ModelAndView mv
						,@RequestParam(value="uploadFile", required=false) MultipartFile multi
						,HttpServletRequest request
						,@ModelAttribute SnsPhoto snsPhoto) {
		Map<String, String> fileInfo = null;
		try {
			fileInfo = fileUtil.saveFile(multi, request, "sns/photo");
			snsPhoto.setSnsFilename(fileInfo.get("original"));
			snsPhoto.setSnsFileRename(fileInfo.get("rename"));
			snsPhoto.setSnsFilepath(fileInfo.get("renameFilepath"));
			int result = snsService.insertPhoto(snsPhoto);
		} catch (Exception e) {
			// TODO: handle exception
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		mv.setViewName("redirect:/sns");
		return mv;
	}
	
	

}
