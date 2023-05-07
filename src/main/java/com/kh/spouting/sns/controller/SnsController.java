package com.kh.spouting.sns.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.kh.spouting.common.FileUtil;
import com.kh.spouting.meeting.domain.AllMemberProfile;
import com.kh.spouting.sns.domain.Follow;
import com.kh.spouting.sns.domain.Sns;
import com.kh.spouting.sns.domain.SnsComment;
import com.kh.spouting.sns.domain.SnsCommentNew;
import com.kh.spouting.sns.domain.SnsPhoto;
import com.kh.spouting.sns.domain.SnsProfile;
import com.kh.spouting.sns.service.SnsService;
import com.kh.spouting.user.domain.User;

@Controller
public class SnsController {
	
	@Autowired
	private SnsService snsService;
	
	@Autowired
	@Qualifier("fileUtil")
	private FileUtil fileUtil;
	
	//개인 sns 페이지 화면
	@RequestMapping(value="/sns", method=RequestMethod.GET)
	public String snsPage(Model model, HttpServletRequest request, @RequestParam("userNo") int userNo
							,@SessionAttribute("loginUser") User loginUser) {
		//작성자 userNo 가져오기
		HttpSession session = request.getSession();
		/*
		 * int userNo = 0; if((User)session.getAttribute("loginUser")!= null) { userNo =
		 * ((User)session.getAttribute("loginUser")).getUserNo(); }
		 */
		int totalCount = snsService.getTotalCount(userNo);
		model.addAttribute("totalCount", totalCount);
		
		//팔로잉 수 가져오기
		int followingCount = snsService.getFollowingCount(userNo);
		model.addAttribute("followingCount", followingCount);
		
		//팔로워 수 가져오기
		int followerCount = snsService.getFollowerCount(userNo);
		model.addAttribute("followerCount", followerCount);
		
		//팔로잉 목록 가져오기
		List<AllMemberProfile> followingCheckList = snsService.getFollowingList(loginUser.getUserNo());
		model.addAttribute("followingCheckList", followingCheckList);
		
		//sns 사진 가져오기
		List<SnsPhoto> oneSnsPhoto = snsService.getPhotos(userNo);
		model.addAttribute("oneSnsPhoto", oneSnsPhoto);
		
		try {
			SnsProfile oneSns = snsService.selectOneById(userNo);
//			model.addAttribute("loginUser",loginUser);
			if(oneSns != null) {
//				model.addAttribute("loginUser",loginUser);
				model.addAttribute("oneSns", oneSns);
			} else {
//				model.addAttribute("loginUser",loginUser);
				model.addAttribute("msg", "데이터가 존재하지 않습니다.");
				return "common/error";
			}
			return "sns/sns";
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	
	//사진 업로드 페이지
	@RequestMapping(value="/sns/uploadPage", method=RequestMethod.GET)
	public ModelAndView snsPhotoInsertPage(ModelAndView mv) {
		mv.setViewName("/sns/sns-insert");
		return mv;
	}
	
	// 사진 업로드 기능
	@RequestMapping(value="/sns/upload", method=RequestMethod.POST)
	public ModelAndView snsPhotoInsert(
						ModelAndView mv
						,@RequestParam(value="uploadFile", required=false) MultipartFile multi
						,HttpServletRequest request
						,@ModelAttribute SnsPhoto snsPhoto) {
		Map<String, String> fileInfo = null;
		try {
			fileInfo = fileUtil.saveFile(multi, request, "sns");
			
			//작성자 userNo 가져오기
			HttpSession session = request.getSession();
			int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
			snsPhoto.setUserNo(userNo);
			
			//작성한 글 데이터 넘겨주기
			String snsContent = request.getParameter("snsContent");
			snsPhoto.setSnsContent(snsContent);
			
			snsPhoto.setSnsFilename(fileInfo.get("original"));
			snsPhoto.setSnsFileRename(fileInfo.get("rename"));
			snsPhoto.setSnsFilepath(fileInfo.get("renameFilepath"));
			
			int result = snsService.insertPhoto(snsPhoto);
			if(result > 0) {
				mv.setViewName("redirect:/sns?userNo="+userNo);
			} else {
				mv.addObject("msg","데이터가 삽입되지 않았습니다.").setViewName("common/error");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	
	//프로필 사진 업로드
	@ResponseBody
	@RequestMapping(value="/sns/profileImgUpload", method=RequestMethod.POST)
	public ModelAndView profileImgUpload(
						ModelAndView mv
						,@RequestParam(value="uploadFile", required=false) MultipartFile multi
						,HttpServletRequest request
						,@ModelAttribute Sns sns) {
		Map<String, String> fileInfo = null;
		try {
			fileInfo = fileUtil.saveFile(multi, request, "profile");
			
			//작성자 userNo 가져오기
			HttpSession session = request.getSession();
			int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
			sns.setUserNo(userNo);
	
			sns.setProfileFilename(fileInfo.get("original"));
			sns.setProfileFileRename(fileInfo.get("rename"));
			sns.setProfileFilepath(fileInfo.get("renameFilepath"));
			
			int result = snsService.insertPhoto(sns);
			
			if(result > 0) {
				mv.setViewName("redirect:/sns?userNo="+userNo);
			} else {
				mv.addObject("msg","프로필 사진 변경에 실패했습니다..").setViewName("common/error");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	
	
	// 프로필 수정하기
	@ResponseBody
	@RequestMapping(value="/ajaxProfileModify", method=RequestMethod.POST)
	public String ajaxProfileModify(int userNo, String profileIntro, @SessionAttribute("loginUser") User loginUser, HttpSession session) {
		Sns userSns = new Sns(userNo, null, null, profileIntro, null);
		userSns = snsService.updateUserProfile(userSns);
		ObjectMapper objectMapper = new ObjectMapper();
        String jsonString = "";
        
        try {
            jsonString = objectMapper.writeValueAsString(userSns);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return jsonString;
        }
        session.setAttribute("loginUser",loginUser);
        return jsonString;
	}
	
	
	//업로드한 사진 불러오기
	@ResponseBody
	@RequestMapping(value="/sns", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	public String viewPhotoList(Integer userNo, Integer start) {
//		int userNo = request.getParameter("userNo");
		List<SnsPhoto> pList = snsService.morePhoto(start, userNo);
		return new Gson().toJson(pList);
		}
	
	
	//sns상세 페이지
	@RequestMapping(value="/sns/detail", method=RequestMethod.GET)
	public String snsDetailPage(@RequestParam("snsPhotoNo") int snsPhotoNo, Model model) {
		SnsPhoto snsDetail = snsService.snsDetailPage(snsPhotoNo);
		SnsProfile oneSns = snsService.selectOneById(snsDetail.getUserNo());
		List<SnsCommentNew> commentList = snsService.selectAllComment(snsPhotoNo);
		model.addAttribute("snsDetail", snsDetail);
		model.addAttribute("oneSns", oneSns);
		model.addAttribute("commentList",commentList);
		return "sns/detail";
	}
	
	
	//sns 글 삭제
	@RequestMapping(value="/sns/snsDelete", method=RequestMethod.GET)
	public String snsDelete(@RequestParam("snsPhotoNo") int snsPhotoNo, Model model
							,@SessionAttribute("loginUser") User loginUser) {
		try {
			int result = snsService.snsDelete(snsPhotoNo);
			if(result > 0) {
				return "redirect:/sns?userNo="+loginUser.getUserNo();
			} else {
				model.addAttribute("msg", "삭제가 완료되지 않았습니다.");
				return "common/error";
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	
	//sns 댓글 등록
	@ResponseBody
	@RequestMapping(value="/comment/register", method=RequestMethod.POST)
		public String registerComment(@ModelAttribute SnsComment snsComment) {

		try {
			int result = snsService.insertComment(snsComment);
			if(result > 0) {
				return "1";
			} else {
				return "0";
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			return e.getMessage();
		}
		
	}
	
	
	//sns 댓글 목록 불러오기
	@ResponseBody
	@RequestMapping(value="/comment/list2", method=RequestMethod.GET, produces="application/json;charset=utf-8")
	public String viewCommentList(Integer snsPhotoNo) {
		List<SnsCommentNew> commentList = snsService.selectAllComment(snsPhotoNo);
		return new Gson().toJson(commentList);
	}
	
	
	
	//댓글 삭제
	@ResponseBody
	@RequestMapping(value="/comment/delete", method=RequestMethod.GET)
	public String deleteComment(Integer snsCommentNo) {
		try {
			int result = snsService.deleteComment(snsCommentNo);
			if(result > 0) {
				return "1";
			} else {
				return "0";
			}
		} catch (Exception e) {
			// TODO: handle exception
			return e.getMessage();
		}
	}
	
	
	//유저 팔로우
	@RequestMapping(value="/sns/follow", method=RequestMethod.GET)
	public String userFollow(@SessionAttribute("loginUser") User loginUser, @RequestParam("userNo") int followNo, Model model) {
		int userNo = loginUser.getUserNo();
		try {
			Follow followUser = new Follow(userNo, followNo);
			int result = snsService.followUser(followUser);
			if(result > 0) {
				return "redirect:/sns?userNo="+loginUser.getUserNo();
			} else {
				model.addAttribute("msg", "팔로우 실패");
				return "common/error";
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
		
	}
	
	//팔로잉 페이지 뷰
	@RequestMapping(value="/sns/followingPage", method=RequestMethod.GET)
	public String followingPage(@RequestParam("userNo") int userNo, Model model) {
		List<AllMemberProfile> followingList = snsService.getFollowingList(userNo);
		model.addAttribute("followingList", followingList);
		return "sns/followingPage";
	}
	
	
	//팔로워 페이지 뷰
	@RequestMapping(value="/sns/followerPage", method=RequestMethod.GET)
	public String followerPage(@RequestParam("userNo") int userNo, Model model) {
		List<AllMemberProfile> followerList = snsService.getFollowerList(userNo);
		model.addAttribute("followerList", followerList);
		return "sns/followerPage";
	}

}
