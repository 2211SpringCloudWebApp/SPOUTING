package com.kh.spouting.review.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spouting.common.Alert;
import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.order.domain.OrderList;
import com.kh.spouting.product.domain.Product;
import com.kh.spouting.review.domain.Review;
import com.kh.spouting.review.service.ReviewService;
import com.kh.spouting.user.domain.User;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService rService; 
	
	// ********** 이용자 **********
	// 리뷰 작성 화면
	@RequestMapping(value="/review/registserView", method=RequestMethod.GET)
	public String productRegisterView() {
		return "shop/review/register";
	}

	// 리뷰 등록
	@RequestMapping(value="/review/register", method=RequestMethod.POST)
	public String productRegister(
	        @ModelAttribute Review review,
	        @RequestParam(value="uploadFile1", required=false) MultipartFile uploadFile1,
	        HttpServletRequest request,
	        HttpSession session,
	        Model model) {
	    try {
	        request.setCharacterEncoding("UTF-8");
	        if(!uploadFile1.getOriginalFilename().equals("")) {
	            String filePath = saveFile(uploadFile1, request);
	            if(filePath != null) {    
	                review.setReviewFilename(uploadFile1.getOriginalFilename());
	                review.setReviewFilepath(filePath);
	            }
	        }
	        int result = rService.insertReview(review);
	        if(result > 0) {
	            Alert alert = new Alert("/review/reviewListUser", "리뷰 등록이 완료되었습니다.");
	            model.addAttribute("alert", alert);
	            return "common/alert";
	        }else {
	            model.addAttribute("msg", "리뷰 등록이 완료되지 않았습니다. 관리자에게 문의해주세요");
	            return "common/error";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        model.addAttribute("msg", "모든 정보를 입력해주세요");
	        return "common/error";
	    }
	}

	// 리뷰 수정 페이지 이동
	@RequestMapping(value="/review/modifyView", method=RequestMethod.GET)
	public String reviewModifyView(@RequestParam("reviewNo") Integer reviewNo, Model model) {
		try {
			Review review = rService.selectOneByNo(reviewNo);
			if(review != null) {
				model.addAttribute("review", review);
				return "shop/review/modify";
			} else {
				model.addAttribute("msg", "데이터 조회에 실패했습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 리뷰 수정
	@RequestMapping(value="/review/modify", method= {RequestMethod.GET, RequestMethod.POST})
	public String reviewModify(
		@ModelAttribute Review review,
	    @RequestParam(value="reloadFile", required=false) MultipartFile reloadFile,
	    @RequestParam("reviewNo") int reviewNo,
		@RequestParam("reviewTitle") String reviewTitle,
		@RequestParam("reviewContent") String reviewContent,
		@RequestParam("userId") String userId,
	    Model model,
	    HttpServletRequest request) {
		try {
			if(reloadFile != null && !reloadFile.isEmpty()) {
				if(review.getReviewFilename() != null) {
					this.deleteFile(review.getReviewFilename(), request);
				}
				String modifyPath = this.saveFile(reloadFile, request);
				if(modifyPath != null) {
					review.setReviewFilename(reloadFile.getOriginalFilename());
					review.setReviewFilepath(modifyPath);
				}
			}
			// DB에서 지점정보 수정
			int result = rService.updateReview(review);
			if(result > 0) {
				Alert alert = new Alert("/review/reviewListUser", "리뷰 수정이 완료되었습니다.");
				model.addAttribute("alert", alert);
				return "common/alert";
			}else {
				model.addAttribute("msg", "상품 정보수정이 완료되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 리뷰 삭제
	@RequestMapping("/review/remove")
	public String removeReview(@RequestParam("reviewNo") int reviewNo, Model model) {
		try {
			int result = rService.deleteReview(reviewNo);
			if(result > 0) {
				Alert alert = new Alert("/review/reviewListUser", "리뷰가 삭제되었습니다.");
				model.addAttribute("alert", alert);
				return "common/alert";
			} else {
				model.addAttribute("msg", "리뷰가 삭제되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 리뷰 목록 조회
	@RequestMapping(value="/review/reviewList", method=RequestMethod.GET)
	public ModelAndView list(ModelAndView mv, @RequestParam(value="page", required=false, defaultValue="1") Integer page) {
		int totalCount = rService.getListCount();
		PageInfo pi = this.getPageInfo(page, totalCount);
		List<Review> rList = rService.selectAllReview(pi);
		mv.addObject("pi", pi).addObject("rList", rList).setViewName("/shop/review/list");
	    return mv;
	}

	// 회원별 리뷰 목록 조회
	@RequestMapping(value="/review/reviewListUser", method=RequestMethod.GET)
	public String reviewList(HttpServletRequest request, Model model,
	        				@RequestParam(value="page", required=false, defaultValue="1") Integer page) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginUser"); // 로그인한 사용자 정보 가져오기
		String userId = user.getUserId(); // 사용자 아이디 가져오기
		
		int totalCount = rService.getListCount(userId);
		PageInfo pi = this.getPageInfo(page, totalCount);
		List<Review> rList = rService.selectReview(pi, userId);
		if(!rList.isEmpty()) {
		model.addAttribute("pi", pi);
		model.addAttribute("rList", rList);
		model.addAttribute("userId", userId);
		}
		return "shop/review/listUser";
		}

	// 리뷰 상세 조회
	@RequestMapping(value="/review/detail", method=RequestMethod.GET)
	public String detailReview(@RequestParam("reviewNo") int reviewNo, Model model) {
		try {
			Review review = rService.selectOneByNo(reviewNo);
			model.addAttribute("review", review);
			return "shop/review/detail";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 조건부 검색
	@RequestMapping(value="/review/search", method=RequestMethod.GET)
	public String productSearchView(
			@ModelAttribute Search search
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			, Model model) {
		try {
			System.out.println(search.toString());
			int totalCount = rService.getListCount(search);
			PageInfo pi = this.getPageInfo(currentPage, totalCount);
			List<Review> searchList = rService.selectListByKeyword(pi, search);
			if(!searchList.isEmpty()) {
				model.addAttribute("search", search);
				model.addAttribute("pi", pi);
				model.addAttribute("sList", searchList);
				return "shop/review/search";
			} else {
				model.addAttribute("msg", "데이터 조회에 실패했습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	
	
	// ********** 메소드 **********
	// 지점 경로로 파일 복사(파일업로드) : 첫번째 파일
	private String saveFile(MultipartFile uploadFile1, HttpServletRequest request) {
		try {
			String root = request.getSession().getServletContext().getRealPath("resources/images");
			// 운영체제에 따라 경로가 다름, 윈도우는 \ 맥은 /
			String savePath = root + "/review";
			// 폴더가 없을 경우 자동 생성
			File folder = new File(savePath);
			if(!folder.exists()) {
				folder.mkdir();
			}
			// 실제 파일의 경로
			String filePath = savePath + "/" + uploadFile1.getOriginalFilename();
			// 실제로 파일 저장
			File file = new File(filePath);
			uploadFile1.transferTo(file);
			return filePath;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 파일 삭제
	private void deleteFile(String reviewFilename, HttpServletRequest request) throws Exception {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delPath = root + "/review";
		String delFilepath = delPath + "/" + reviewFilename;
		File delFile = new File(delFilepath);
		if(delFile.exists()) {
			delFile.delete();
		}
	}
	
	// 페이징 처리
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

	
	
	// ********** 관리자 **********
	// 리뷰 목록 조회
	@RequestMapping(value="/review/adminList", method=RequestMethod.GET)
	public ModelAndView listAdmin(ModelAndView mv, @RequestParam(value="page", required=false, defaultValue="1") Integer page) {
		int totalCount = rService.getListCount();
		PageInfo pi = this.getPageInfo(page, totalCount);
		List<Review> rList = rService.selectAllReview(pi);
		mv.addObject("pi", pi).addObject("rList", rList).setViewName("/shop/admin/adminReviewList");
	    return mv;
	}
	
	// 리뷰 상세 조회
	@RequestMapping(value="/review/adminDetail", method=RequestMethod.GET)
	public String detailReviewAdmin(@RequestParam("reviewNo") int reviewNo, Model model) {
		try {
			Review review = rService.selectOneByNo(reviewNo);
			model.addAttribute("review", review);
			return "shop/admin/adminReviewDetail";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 리뷰 삭제
	@RequestMapping(value="/remove/adminReview", method=RequestMethod.GET)
	public String reviewRemove(@RequestParam("reviewNo") int reviewNo, Model model) {
		try {
			int result = rService.deleteReview(reviewNo);
			if(result > 0) {
				Alert alert = new Alert("/review/adminList", "리뷰가 삭제되었습니다.");
				model.addAttribute("alert", alert);
				return "common/alert";
			}else {
				model.addAttribute("msg", "리뷰 삭제가 완료되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	
	
}
