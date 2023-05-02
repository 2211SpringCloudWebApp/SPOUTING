package com.kh.spouting.notice.controller;

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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.HtmlUtils;

import com.google.gson.JsonObject;
import com.kh.spouting.common.Alert;
import com.kh.spouting.common.FileUtil;
import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.inquiry.domain.Inquiry;
import com.kh.spouting.inquiry.domain.InquiryJoin;
import com.kh.spouting.notice.domain.Notice;
import com.kh.spouting.notice.domain.NoticeJoin;
import com.kh.spouting.notice.service.NoticeService;
import com.kh.spouting.user.domain.User;

@Controller
@RequestMapping(value="/notice")
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
	@Autowired
	@Qualifier("fileUtil")
	private FileUtil fileUtil;

	/**
	 * 공지사항 리스트 Controller
	 * @param mv
	 * @return mv
	 */
	@RequestMapping(value="/list", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public ModelAndView viewNoticeList(
			ModelAndView mv
			, HttpSession session
			, @RequestParam(value="page", required = false, defaultValue = "1") Integer page) {
		try {
			// 페이징처리
			int totalCount = nService.getNoticeCount();
			PageInfo pi = this.getPageInfo(page, totalCount);
			// 로그인유저정보 보내기(관리자전용버튼위해서)
			User user = (User) session.getAttribute("loginUser");
			List<NoticeJoin> nList = nService.selectAllNotice(pi);
			mv.addObject("nList", nList).addObject("user", user).addObject("pi", pi).setViewName("notice/list");
		} catch (Exception e) {
			mv.addObject("msg", "공지사항 페이지 에러발생").setViewName("common/error");
		}
		return mv;
	}
	
	/**
	 *  공지사항 디테일 Controller
	 * @param mv
	 * @param noticeNo
	 * @return mv
	 */
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public ModelAndView viewNoticeDetail(ModelAndView mv, @RequestParam Integer noticeNo, HttpSession session) {
		try {
			// 관리자 확인하기 위해
			User user = (User) session.getAttribute("loginUser");
			NoticeJoin notice = nService.selectOneNotice(noticeNo);
			nService.viewCount(noticeNo);	//글 클릭 시 조회수 1 증가
			mv.addObject("notice", notice).addObject("user", user).setViewName("notice/detail");
			return mv;
		} catch (Exception e) {
			mv.addObject("msg", "해당 공지사항이 존재하지 않습니다.").setViewName("common/error");
			return mv;
		}
	}
	
	/**
	 * 공지사항 등록 View Controller
	 * @param mv
	 * @return mv
	 */
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public ModelAndView viewNoticeWrite(ModelAndView mv) {
		// 썸머노트추가 
		mv.addObject("id",UUID.randomUUID()).setViewName("notice/write");
		return mv;
	}
	
	/**
	 * 공지사항 등록 Controller
	 * @param mv
	 * @param notice
	 * @param multi
	 * @param request
	 * @return mv
	 */
//	@ResponseBody
//	@RequestMapping(value="/write", method=RequestMethod.POST)
//	public ModelAndView writeNotice(
//			ModelAndView mv, @ModelAttribute Notice notice
//			, @RequestParam(value="uploadFile", required = false) MultipartFile multi
//			, HttpServletRequest request
//			, HttpSession session) {
//		// 파일전송
//		Map<String, String> fileInfo = null;
//		try {
//			User user = (User) session.getAttribute("loginUser");
//			// 작성자아이디 가져오기
//			int noticeWriter = user.getUserNo();
//			// 첨부파일이 있는 경우
//			if(multi.getSize() != 0 && !multi.getOriginalFilename().equals("")) {
//				fileInfo = fileUtil.saveFile(multi, request, "notice");
//				notice.setNoticeFilename(fileInfo.get("original"));
//				notice.setNoticeFilerename(fileInfo.get("rename"));
//				notice.setNoticeFilepath(fileInfo.get("renameFilepath"));
//			}
//			notice.setUserNo(noticeWriter);
//			int result = nService.insertNotice(notice);
//			if(result > 0) {
//				mv.addObject("msg", "공지사항 등록완료!").setViewName("notice/success");
//			}else {
//				mv.addObject("msg", "공지사항이 등록되지 않았습니다.").setViewName("common/error");
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			mv.addObject("msg", "공지사항이 등록되지 않았습니다.").setViewName("common/error");
//		}
//		return mv;
//	}
	
	// 썸머노트로 파일추가하여 공지사항등록 테스트중
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public ModelAndView writeNotice(ModelAndView mv, HttpServletRequest request, @ModelAttribute Notice notice
			,@RequestParam("id") String id, HttpSession session) {
		try {
			// 로그인한 정보 가져와서 작성자로 넣기
			User user = (User) session.getAttribute("loginUser"); 
			int noticeWriterNo = user.getUserNo();
			notice.setUserNo(noticeWriterNo);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			// 뭔가 회원번호와 날짜를 붙여서 코드로 만들고 이걸 파일이름으로 쓰는듯하다.
		    String code = notice.getUserNo() + sdf.format(new Date(System.currentTimeMillis()));
			String content = notice.getNoticeContent();
			notice.setNoticeContent(content.replaceAll(id , ""+code));
			notice.setNoticeFilename(code);
			int result = nService.insertNotice(notice);
			String[] nList = content.split("\"");
			List<String> fileList = new ArrayList<String>();
			for(String aa : nList){
			    if(aa.startsWith(".")){
			        fileList.add(aa);
			    }
			}
			String wasRoot = request.getSession().getServletContext().getRealPath("/resources/images");
			String savePath = wasRoot + "/" + "notice/";
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
			                if (("../../../resources/images/notice/"+id + "/" + files[i].getName()).equals(fileName)) {
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
				mv.addObject("msg", "공지사항 등록완료!").setViewName("notice/success");
			} else {
				Alert alert = new Alert("/notice/list", "등록에 실패하였습니다.");
				mv.addObject("alert", alert);
				mv.setViewName("common/alert");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}

		return mv;
	}
	
	// 페이징처리하기
	private PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		int boardLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		
		maxPage = (int) Math.ceil((double)totalCount / boardLimit);
		startNavi = (((int)((double)currentPage / naviLimit + 0.9)) - 1) * naviLimit + 1 ;
		endNavi = startNavi + naviLimit - 1;
		if(endNavi > maxPage) {
			endNavi = maxPage;
		}
		pi = new PageInfo(currentPage, boardLimit, naviLimit, startNavi, endNavi, totalCount, maxPage);
		return pi;
	}
	
	/**
	 * 공지사항 검색 Controller
	 * @param mv
	 * @param search
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/search", method = RequestMethod.GET)
	public ModelAndView searchNotice(
			ModelAndView mv
			, @ModelAttribute Search search
			, @RequestParam(value="page", required = false, defaultValue = "1") Integer page ) {
		try {
			int totalCount = nService.getSearchNoticeCount(search);
			PageInfo pi = this.getPageInfo(page, totalCount);
			
			List<NoticeJoin> nList = nService.searchNotice(search, pi);
			
			if(!nList.isEmpty()) {
				mv.addObject("pi", pi).addObject("search", search).addObject("nList", nList).setViewName("notice/search");
			}else {
				mv.addObject("msg", "검색하신 내용이 존재하지 않습니다.").setViewName("common/error");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	/**
	 * 공지사항 수정 View Controller
	 * @param mv
	 * @param notice
	 * @return mv
	 */
	@RequestMapping(value="/modifyView", method = RequestMethod.POST)
	public ModelAndView modifyNoticeView(
			ModelAndView mv,
			@ModelAttribute Notice notice
			) {
		NoticeJoin noticeResult = nService.selectOneNotice(notice.getNoticeNo());
		// UUID부분 추가 
		mv.addObject("id",UUID.randomUUID()).addObject("notice", noticeResult).setViewName("notice/modify");
		return mv;
	}
	
	/**
	 * 공지사항 수정 Controller
	 * @param mv
	 * @param reloadFile
	 * @param notice
	 * @param request
	 * @return mv
	 */
//	@RequestMapping(value="/modify", method=RequestMethod.POST)
//	public ModelAndView modifyNotice(
//			ModelAndView mv
//			, @RequestParam(value="reloadFile", required=false) MultipartFile reloadFile
//			, @ModelAttribute Notice notice
//			, HttpServletRequest request) {
//		Map<String, String> modifyFile = null;
//		try {
//			NoticeJoin originalNotice = nService.selectOneNotice(notice.getNoticeNo());
//			
//			// 파일 재첨부 있는 경우
//			if(!reloadFile.isEmpty()) {
//				// 원래글에 파일이 있는 경우
//				if(originalNotice.getNoticeFilerename() != null) {
//					// 원래 파일 삭제(deleteFile메소드에 filename전달해줌)
//					this.deleteFile(request, originalNotice.getNoticeFilerename());
//				}
//				modifyFile = fileUtil.saveFile(reloadFile, request, "notice");
//				if(modifyFile != null) {
//					notice.setNoticeFilename(modifyFile.get("original"));
//					notice.setNoticeFilerename(modifyFile.get("rename"));
//					notice.setNoticeFilepath(modifyFile.get("renameFilepath"));
//				}
//			}
//			// 파일 재첨부가 없는 경우
//			else {
//				 // 원래글에 파일이 있는 경우
//	            if(originalNotice.getNoticeFilerename() != null) {
//	                // 파일명과 파일경로를 그대로 사용
//	                notice.setNoticeFilerename(originalNotice.getNoticeFilerename());
//	                notice.setNoticeFilepath(originalNotice.getNoticeFilepath());
//	            }
//			}
//			int result = nService.modifyNotice(notice);
//			if(result > 0) {
//				mv.addObject("msg", "공지사항 수정이 완료되었습니다!").setViewName("notice/success");
//			}else {
//				mv.addObject("msg", "공지사항수정이 완료되지 않았습니다.").setViewName("common/error");
//			}
//		} catch (Exception e) {
//			mv.addObject("msg", e.getMessage()).setViewName("common/error");
//		}
//		return mv;
//	}
	
	// 공지게시판 수정하기(썸머노트사용 테스트중)
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView modifyNotice(ModelAndView mv, @ModelAttribute Notice notice,
			HttpServletRequest request
			,@RequestParam("id") String id,
			Model model) {
		try {
		    String code = notice.getNoticeFilename();
		    if (code == null) { // inquiriesFilename이 null이면 새로운 값을 설정해줌
	            notice.setNoticeFilename(UUID.randomUUID().toString());
	            code = notice.getNoticeFilename();
	        }
			String content = notice.getNoticeContent();
			notice.setNoticeContent(content.replaceAll(id , ""+code));
			int result = nService.modifyNotice(notice);
			String wasRoot = request.getSession().getServletContext().getRealPath("resources/images");
			String savePath = wasRoot + "/" + "notice/" ;
			File diretory = new File(savePath + id);
			File folder = new File(savePath + code);	
			if(!diretory.exists()){
			    diretory.mkdirs();
			}
			if(!folder.exists()){
			    folder.mkdirs();
			}
			if (result > 0) {
				if(folder.exists()){ //파일존재여부확인
				    if(folder.isDirectory()){ //파일이 디렉토리인지 확인
				    	String[] nList = content.split("\"");
						List<String> fileList = new ArrayList<String>();
						for(String aa : nList){
						    if(aa.startsWith(".")){
						        fileList.add(aa);
						    }
						}
				        File[] files = folder.listFiles();
				        int[] valid = new int[files.length];
				        for(int i = 0; i < files.length; i++){
				        	for(String fileName : fileList) {
					        	 if (("../../../resources/images/notice/" + code + "/" + files[i].getName()).equals(fileName)) {
					        		 valid[i] = 1;
					        	 }
				        	}
				        }
				        for(int i = 0; i < valid.length; i++) {
				        	if(valid[i] != 1) {
				        		if(files[i].delete()) {
				        			
				        		}else {
				        			
				        		}
				        	}
				        }
				    }
				}else{
				    // 임시 폴더가 없을 시
				}
			}
			String[] nList = content.split("\"");
			List<String> fileList = new ArrayList<String>();
			for(String aa : nList){
			    if(aa.startsWith(".")){
			        fileList.add(aa);
			    }
			}

			if(diretory.exists()){ //파일존재여부확인
			    if(diretory.isDirectory()){ //파일이 디렉토리인지 확인
			        File[] files = diretory.listFiles();
			        for(int i = 0; i < files.length; i++){
			            for(String fileName : fileList) {
			                if (("../../../resources/images/notice/"+id + "/" + files[i].getName()).equals(fileName)) {
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
				mv.addObject("msg", "공지사항 수정이 완료되었습니다!").setViewName("notice/success");
			} else {
				mv.addObject("msg", "공지사항수정이 완료되지 않았습니다.").setViewName("common/error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	/**
	 * 공지사항 삭제 Controller
	 * @param mv
	 * @param noticeNo
	 * @param request
	 * @return mv
	 */
//	@RequestMapping(value="/delete", method=RequestMethod.POST)
//	public ModelAndView deleteNotice(
//			ModelAndView mv
//			, @RequestParam Integer noticeNo
//			, HttpServletRequest request) {
//		try {
//			// 파일을 먼저 삭제하기위해
//			NoticeJoin notice = nService.selectOneNotice(noticeNo);
//			if(notice.getNoticeFilerename() != null) {
//				this.deleteFile(request, notice.getNoticeFilerename());
//			}
//			// 파일삭제 후 글 삭제
//			int result = nService.deleteNotice(noticeNo);
//			if(result > 0) {
//				mv.addObject("msg", "공지사항 삭제 완료").setViewName("notice/success");
//			}else {
//				mv.addObject("msg", "공지사항이 삭제되지 않았습니다.").setViewName("common/error");
//			}
//		} catch (Exception e) {
//			mv.addObject("msg", e.getMessage()).setViewName("common/error");
//		}
//		return mv;
//		
//	}
	
	// 공지사항 삭제
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	   public ModelAndView deleteNotice(
			   @RequestParam Integer noticeNo
	         , HttpServletRequest request
	         , ModelAndView mv) {
	      try {
	         // reviewNo에 해당하는 게시물 정보 가져오기
	         NoticeJoin notice = nService.selectOneNotice(noticeNo); // reviewNo에 해당하는 게시물 정보 가져오기
	           if (notice != null) {
	               // 해당 게시물에 업로드된 이미지 파일 삭제
	               String wasRoot = request.getSession().getServletContext().getRealPath("resources/images");
	               String savePath = wasRoot + "/" + "notice/" + notice.getNoticeFilename();
	               File folder = new File(savePath);
	               if (folder.exists() && folder.isDirectory()) {
	                   File[] files = folder.listFiles();
	                   for (File file : files) {
	                       file.delete();
	                   }
	                   folder.delete();
	               }
	           }
	           int result = nService.deleteNotice(noticeNo);
	         if(result > 0) {
	        	 mv.addObject("msg", "공지사항 삭제 완료").setViewName("notice/success");
	         } else {
	        	 mv.addObject("msg", "공지사항이 삭제되지 않았습니다.").setViewName("common/error");
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
		String deletePath = root + "\\images\\notice";
		String deleteFilepath = deletePath + "\\" + filename;
		File deleteFile = new File(deleteFilepath);
		// 삭제할 파일 존재하면
		if(deleteFile.exists()) {
			deleteFile.delete();
		}
	}
	
	
	// 여기는 썸머노트 파일테스트	
	@PostMapping(value = "/ImgFileUpload", produces = "application/json; charset=utf8")
	@ResponseBody
	public String reviewImgUpload(@RequestParam("file") MultipartFile multipartFile 
			,@RequestParam("id") String id
			,HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();
		String wasRoot = request.getSession().getServletContext().getRealPath("/resources/images");
		String savePath = wasRoot + "/" + "notice/" + id;
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
			filePath = "../../../resources/images/notice/" + id +"/" + FileName;
			jsonObject.addProperty("src", filePath); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
		} catch (Exception e) {
		}
		String a = jsonObject.toString();
		return a;
	}
}
