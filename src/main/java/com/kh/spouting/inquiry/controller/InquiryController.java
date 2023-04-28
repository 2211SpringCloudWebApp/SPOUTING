package com.kh.spouting.inquiry.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.kh.spouting.book.domain.Book;
import com.kh.spouting.book.service.BookService;
import com.kh.spouting.common.Alert;
import com.kh.spouting.common.FileUtil;
import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.inquiry.domain.Inquiry;
import com.kh.spouting.inquiry.domain.InquiryJoin;
import com.kh.spouting.inquiry.service.InquiryService;
import com.kh.spouting.user.domain.User;

@Controller
@RequestMapping(value="/inquiry")
public class InquiryController {

	@Autowired
	private InquiryService iService;
	
	@Autowired
	private BookService bService;
	
	@Autowired
	@Qualifier("fileUtil")
	private FileUtil fileUtil;
	
	/**
	 * 문의사항 리스트 Controller
	 * @param mv
	 * @param session
	 * @param page
	 * @return mv
	 */
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView viewInquiryList(
			ModelAndView mv
			, HttpSession session
			, @RequestParam(value="page", required = false, defaultValue = "1") Integer page) {
		try {
			// 페이징처리
			int totalCount = iService.getInquiryCount();
			PageInfo pi = this.getPageInfo(page, totalCount);
			// 로그인유저정보 보내기
			User user = (User) session.getAttribute("loginUser");
			List<InquiryJoin> iList = iService.selectAllInquiry(pi);
			mv.addObject("iList", iList).addObject("user", user).addObject("pi", pi).setViewName("inquiry/list");
		} catch (Exception e) {
			mv.addObject("msg", "문의사항 페이지 에러발생").setViewName("common/error");
		}
		return mv;
	}
	
	/**
	 * 문의사항 검색 Controller
	 * @param mv
	 * @param search
	 * @param page
	 * @return mv
	 */
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public ModelAndView searchInquiry(
			ModelAndView mv
			, @ModelAttribute Search search
			, @RequestParam(value="page", required=false, defaultValue="1") Integer page) {
		try {
			int totalCount = iService.getSearchInquiryCount(search);
			PageInfo pi = this.getPageInfo(page, totalCount);
			
			List<Inquiry> iList = iService.searchInquiry(search, pi);
			
			if(!iList.isEmpty()) {
				mv.addObject("iList", iList).addObject("pi", pi).addObject("search", search).setViewName("inquiry/search");
			}else {
				mv.addObject("msg", "검색하신 문의사항이 존재하지 않습니다.").setViewName("common/error");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	// 페이징 처리하기
	private PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		int boardLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		
		maxPage = (int) Math.ceil((double)totalCount / boardLimit);
		startNavi = (((int)((double)currentPage / naviLimit + 0.9)) - 1) * naviLimit +  1;
		endNavi = startNavi + naviLimit - 1;
		if(endNavi > maxPage) {
			endNavi = maxPage;
		}
		pi = new PageInfo(currentPage, boardLimit, naviLimit, startNavi, endNavi, totalCount, maxPage);
		return pi;
	}
	
	/**
	 * 문의사항 등록 View Controller
	 * @param mv
	 * @return mv
	 */
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public ModelAndView viewInquiryWrite(ModelAndView mv, HttpSession session) {
		//츄가|문의게시판용: 예약내역페이지(이용전) 보이기
		User user = (User) session.getAttribute("loginUser");
		List<Book> myBookList = bService.getMyBooking(user.getUserNo());
		// 썸머노트테스트중(쏘야)
		mv.addObject("id",UUID.randomUUID());
		//
		mv.addObject("bList", myBookList).setViewName("inquiry/write");
		return mv;
	}
	
	/**
	 * 문의사항 등록 Controller
	 * @param mv
	 * @param session
	 * @param request
	 * @param inquiry
	 * @param multi
	 * @return mv
	 */
//	@RequestMapping(value="/write", method=RequestMethod.POST)
//	public ModelAndView writeInquiry(
//			ModelAndView mv
//			, HttpSession session
//			, HttpServletRequest request
//			, @ModelAttribute Inquiry inquiry
//			, @RequestParam(value="bookNo", required=false) Integer bookNo
//			//int는 null로 받아올수 없고 래퍼클래스는 가능!
//			, @RequestParam(value="uploadFile", required=false) MultipartFile multi) {
//		// 파일전송
//		Map<String, String> fileInfo = null;
//		try {
//			// 로그인한 정보 가져와서 작성자로 넣기
//			User user = (User) session.getAttribute("loginUser"); 
//			int inquiryWriterNo = user.getUserNo();
//			
//			// 첨부파일이 있는 경우
//			if(multi.getSize() != 0 && !multi.getOriginalFilename().equals("")) {
//				fileInfo = fileUtil.saveFile(multi, request, "inquiry");
//				inquiry.setInquiriesFilename(fileInfo.get("original"));
//				inquiry.setInquiriesFilerename(fileInfo.get("rename"));
//				inquiry.setInquiriesFilepath(fileInfo.get("renameFilepath"));
//			}
//			inquiry.setUserNo(inquiryWriterNo);
//			int result = iService.insertInquiry(inquiry);
//			if(result > 0) {
//				mv.addObject("msg", "문의사항이 등록완료되었습니다!😎").setViewName("notice/success");
//			}else {
//				mv.addObject("msg", "문의사항이 등록되지 않았습니다.").setViewName("common/error");
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			mv.addObject("msg", e.getMessage()).setViewName("common/error");
//		}
//		return mv;
//	}
	
	// 썸머노트로 파일추가하여 문의사항등록 테스트중
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public ModelAndView writeInquiry(ModelAndView mv, HttpServletRequest request, @ModelAttribute Inquiry inquiry
			,@RequestParam("id") String id, HttpSession session) {
		try {
			// 로그인한 정보 가져와서 작성자로 넣기
			User user = (User) session.getAttribute("loginUser"); 
			int inquiryWriterNo = user.getUserNo();
			inquiry.setUserNo(inquiryWriterNo);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			// 뭔가 회원번호와 날짜를 붙여서 코드로 만들고 이걸 파일이름으로 쓰는듯하다.
		    String code = inquiry.getUserNo() + sdf.format(new Date(System.currentTimeMillis()));
			String content = inquiry.getInquiriesContent();
			inquiry.setInquiriesContent(content.replaceAll(id , ""+code));
			inquiry.setInquiriesFilename(code);
			int result = iService.insertInquiry(inquiry);
			String[] iList = content.split("/");
			List<String> fileList = new ArrayList<String>();
			for(String aa : iList){
			    if(aa.startsWith(".")){
			        fileList.add(aa);
			    }
			}
			String wasRoot = request.getSession().getServletContext().getRealPath("/resources/images");
			String savePath = wasRoot + "/" + "inquiry/";
			File diretory = new File(savePath + id);
			File folder = new File(savePath + code);
			if(!folder.exists()){
				folder.mkdirs();
			}
			
			if(!diretory.exists()){
			    diretory.mkdirs();
			}
			if(diretory.exists()){ //파일존재여부확인
			    if(diretory.isDirectory()){ //파일이 디렉토리인지 확인
			        File[] files = diretory.listFiles();
			        for(int i = 0; i < files.length; i++){
			            for(String fileName : fileList) {
			                if (("../../../resources/images/inquiry/"+id + "/" + files[i].getName()).equals(fileName)) {
			                    files[i].renameTo(new File(savePath + code +"/" +files[i].getName()));
			                }
			            }
			            if (files[i].delete()) {
			                // 폴더 안 파일 삭제 성공시
			            } else {
			                // 삭제 실패시
			            }
			        }
			    }
			    if(diretory.delete()){
			        // 폴더 삭제시
			    }else{
			        // 폴더 삭제 실패시
			    }
			}else{
			    // 임시 폴더가 없을 시
			}
			
			if (result > 0) {
				Alert alert = new Alert("/inquiry/list", "등록이 완료되었습니다.");
				mv.addObject("alert", alert);
				mv.setViewName("common/alert");
			} else {
				Alert alert = new Alert("/inquiry/list", "등록에 실패하였습니다.");
				mv.addObject("alert", alert);
				mv.setViewName("common/alert");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}

		return mv;
	}
	
	/**
	 * 문의사항 디테일 Controller
	 * @param mv
	 * @param inquiriesNo
	 * @param session
	 * @return mv
	 */
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public ModelAndView detailInquiry(
			ModelAndView mv, @RequestParam Integer inquiriesNo
			, HttpSession session) {
		try {
			//글 작성자 확인
			User user = (User) session.getAttribute("loginUser");
			InquiryJoin inquiry = iService.detailInquiry(inquiriesNo);
			mv.addObject("user", user).addObject("inquiry", inquiry).setViewName("inquiry/detail");
		} catch (Exception e) {
			mv.addObject("msg", "해당 문의사항이 존재하지 않습니다.").setViewName("common/error");
		}
		return mv;
	}
	
	/**
	 * 문의사항 비밀번호체크 View Controller
	 * @param mv
	 * @param inquiriesNo
	 * @return mv
	 */
	@RequestMapping(value="/checkSecretNo", method=RequestMethod.GET)
	public ModelAndView viewCheckSecretNo(ModelAndView mv, @RequestParam Integer inquiriesNo) {
		InquiryJoin inquiry = iService.detailInquiry(inquiriesNo);
		mv.addObject("inquiry", inquiry).setViewName("inquiry/checkSecretNo");
		return mv;
	}
	
	/**
	 * 문의사항 비밀번호체크 Controller
	 * @param mv
	 * @param inquiriesNo
	 * @param secretNo
	 * @return mv
	 */
	@RequestMapping(value="/checkSecretNo", method=RequestMethod.POST)
	public ModelAndView checkSecretNo(ModelAndView mv, int inquiriesNo, int secretNo) {
		try {
			InquiryJoin iParam = new InquiryJoin(inquiriesNo, secretNo);
			InquiryJoin inquiry = iService.checkSecretNo(iParam);
			if(inquiry != null) {
				mv.addObject("inquiry", inquiry).setViewName("redirect:/inquiry/detail?inquiriesNo=" + inquiriesNo);
			}else {
				mv.addObject("msg", "비밀번호틀림").setViewName("common/error");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	/**
	 * 문의사항 수정 View Controller
	 * @param mv
	 * @param inquiry
	 * @return mv
	 */
	@RequestMapping(value="/modifyView", method=RequestMethod.POST)
	public ModelAndView viewModifyInquiry(ModelAndView mv, @ModelAttribute Inquiry inquiry) {
		InquiryJoin inquiryResult = iService.detailInquiry(inquiry.getInquiriesNo());
		mv.addObject("inquiry", inquiryResult).setViewName("inquiry/modify");
		return mv;
	}
	
	/**
	 * 문의사항 수정 Controller
	 * @param mv
	 * @param inquiry
	 * @param reloadFile
	 * @param request
	 * @return mv
	 */
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public ModelAndView modifyInquiry(ModelAndView mv, @ModelAttribute Inquiry inquiry
			, @RequestParam(value="reloadFile", required=false) MultipartFile reloadFile
			, HttpServletRequest request) {
		Map<String, String> modifyFile = null;
		try {
			InquiryJoin originalInquiry = iService.detailInquiry(inquiry.getInquiriesNo());
			
			// 파일 재첨부가 있는 경우
			if(!reloadFile.isEmpty()) {
				// 원래글에 파일이 있는 경우
				if(originalInquiry.getInquiriesFilerename() != null) {
					// 원래 파일 삭제
					this.deleteFile(request, originalInquiry.getInquiriesFilerename());
				}
				modifyFile = fileUtil.saveFile(reloadFile, request, "inquiry");
				if(modifyFile != null) {
					inquiry.setInquiriesFilename(modifyFile.get("original"));
					inquiry.setInquiriesFilepath(modifyFile.get("renameFilepath"));
					inquiry.setInquiriesFilerename(modifyFile.get("rename"));
				}
			}
			// 파일 재첨부가 없는 경우
			else {
				// 원래글에 파일이 있는 경우
				if(originalInquiry.getInquiriesFilerename() != null) {
					// 파일명과 파일경로를 그대로 사용
					inquiry.setInquiriesFilepath(originalInquiry.getInquiriesFilepath());
					inquiry.setInquiriesFilerename(originalInquiry.getInquiriesFilerename());
				}
			}
			int result = iService.modifyInquiry(inquiry);
			if(result > 0) {
				mv.addObject("msg", "문의사항수정이 완료되었습니다!").setViewName("notice/success");
			}else {
				mv.addObject("msg", "문의사항수정이 완료되지 않았습니다.").setViewName("common/error");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	// 삭제
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public ModelAndView deleteInquiry(ModelAndView mv, @ModelAttribute Inquiry inquiry
			, HttpServletRequest request) {
		try {
			// 파일먼저 삭제해주기
			InquiryJoin rmInquiry = iService.detailInquiry(inquiry.getInquiriesNo());
			if(rmInquiry.getInquiriesFilerename() != null) {
				this.deleteFile(request, rmInquiry.getInquiriesFilerename());
			}
			// 파일삭제 후 글 삭제
			int result = iService.deleteInquiry(inquiry.getInquiriesNo());
			if(result > 0) {
				mv.addObject("msg", "문의사항 삭제 완료").setViewName("notice/success");
			}else {
				mv.addObject("msg", "문의사항이 삭제되지 않았습니다.").setViewName("common/error");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	/**
	 * 파일삭제
	 * @param request
	 * @param filename
	 */
	private void deleteFile(HttpServletRequest request, String filename) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String deletePath = root + "\\images\\inquiry";
		String deleteFilepath = deletePath + "\\" + filename;
		File deleteFile = new File(deleteFilepath);
		// 삭제할 파일 존재하면
		if(deleteFile.exists()) {
			deleteFile.delete();
		}
	}
	
	// ******* 좋아요 테스트중
	@ResponseBody
	@RequestMapping(value="inputLike", method=RequestMethod.POST)
	public String updateLike(Inquiry inquiry) {
		try {
			iService.updateLike(inquiry);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return " fail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/like")
	public Inquiry getTotalLike(int inquiriesNo) {
		Inquiry inquiry = iService.getTotalLike(inquiriesNo);
		return inquiry;
	}
	////////////
	
	// 여기는 썸머노트 파일테스트	
	@PostMapping(value = "/ImgFileUpload", produces = "application/json; charset=utf8")
	@ResponseBody
	public String reviewImgUpload(@RequestParam("file") MultipartFile multipartFile 
			,@RequestParam("id") String id
			,HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();
		String wasRoot = request.getSession().getServletContext().getRealPath("/resources/images");
		String savePath = wasRoot + "/" + "inquiry/" + id;
		// 폴더가 없을 경우 자동으로 만들어주기 위한 코드(폴더가 있는 경우 동작 안함)
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		try {
			String originalFilename = multipartFile.getOriginalFilename();
			// 실제 파일 저장
			/* SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); */
			String FileName = UUID.randomUUID() + "."
					+ originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
			String filePath = savePath + "/" + FileName;
			File file = new File(filePath);
			multipartFile.transferTo(file);
			filePath = "../../../resources/images/inquiry/" + id +"/" + FileName;
			jsonObject.addProperty("src", filePath); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
		} catch (Exception e) {
		}
		String a = jsonObject.toString();
		return a;
	}
}
