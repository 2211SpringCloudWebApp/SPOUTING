package com.kh.spouting.center.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spouting.center.domain.Center;
import com.kh.spouting.center.domain.Search;
import com.kh.spouting.center.service.CenterService;
import com.kh.spouting.user.domain.User;

@Controller
public class CenterController {
	
	@Autowired
	private CenterService cService;
	
	
	/************************* 관리자 서비스 **************************/
	
	/* 지점 등록 화면 */
	@RequestMapping(value="/center/registerView", method=RequestMethod.GET)
	public String centerRegisterView() {
		return "center/register";
	}

	/* 지점 등록 */
	@RequestMapping(value="/center/register", method=RequestMethod.POST)
	public String centerRegister(
			@ModelAttribute Center center
			, @RequestParam(value="uploadFile1", required=false) MultipartFile uploadFile1
			, @RequestParam(value="uploadFile2", required=false) MultipartFile uploadFile2
			, HttpServletRequest request
			, HttpSession session
			, Model model) {
		
		// 로그인 여부 확인
		User loginUser = (User)session.getAttribute("loginUser");	
		if(loginUser == null ) {
			return "redirect:/user/login";
		}else {
		
			try {
				// 인코딩
				request.setCharacterEncoding("UTF-8");
				
				// 첫번째 파일이 있을 경우
				if(!uploadFile1.getOriginalFilename().equals("")) {
					// 파일 복사(지정한 경로 업로드)
					String filePath = saveFile1(uploadFile1, request);
					
					if(filePath != null) {	// 파일경로가 존재하면
						// - DB에 값 저장 가능(uploadFile1)
						center.setCenterFilename1(uploadFile1.getOriginalFilename());
						// 경로에 있는 파일 저장
						center.setCenterFilepath1(filePath);
					}
				}
				
				// 두번째 파일이 있을 경우
				if(!uploadFile2.getOriginalFilename().equals("")) {
					// 파일 복사(지정한 경로 업로드)
					String filePath = saveFile2(uploadFile2, request);
					
					if(filePath != null) {	// 파일경로가 존재하면
						// - DB에 값 저장 가능(uploadFile2)
						center.setCenterFilename2(uploadFile2.getOriginalFilename());
						// 경로에 있는 파일 저장
						center.setCenterFilepath2(filePath);
					}
				}
				
				
				int result = cService.insertCenter(center);
				if(result > 0) {
					// 지점등록 성공 시 지점목록 페이지로 이동
					return "redirect:/center/listView";
				}else {
					// 지점등록 실패 시 에러페이지로 이동
					model.addAttribute("msg", "지점등록이 완료되지 않았습니다. 관리자에게 문의해주세요");
					return "common/error";
				}
			
				
			}catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", "모든 정보를 입력해주세요");
				return "common/error";
			}
		}
		
	}

	// 지점 경로로 파일 복사(파일업로드) : 첫번째 파일
	// 파일복사에 필요한 업로드 파일과 servlet 생성
	private String saveFile1(MultipartFile uploadFile1, HttpServletRequest request) {
		try {
			// 원하는 저장 경로
			String root = request.getSession().getServletContext().getRealPath("resources/images");
			String savePath = root + "\\centeruploadFiles";
			
			// 폴더가 없을 경우 자동 생성
			File folder = new File(savePath);
			if(!folder.exists()) {
				folder.mkdir();
			}

			// 실제 파일의 경로
			String filePath = savePath + "\\" + uploadFile1.getOriginalFilename();
			// 실제로 파일 저장
			File file = new File(filePath);
			uploadFile1.transferTo(file);
			return filePath;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 지점 경로로 파일 복사(파일업로드) : 두번째 파일
	private String saveFile2(MultipartFile uploadFile2, HttpServletRequest request) {
		try {
			// 원하는 저장 경로
			String root = request.getSession().getServletContext().getRealPath("resources/images");
			String savePath = root + "\\centeruploadFiles";
			
			// 폴더가 없을 경우 자동 생성
			File folder = new File(savePath);
			if(!folder.exists()) {
				folder.mkdir();
			}
			
			// 실제 파일의 경로
			String filePath = savePath + "\\" + uploadFile2.getOriginalFilename();
			// 실제로 파일 저장
			File file = new File(filePath);
			uploadFile2.transferTo(file);
			return filePath;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	
	/* 지점 상세조회 */
	@RequestMapping(value="/center/detail/{centerNo}", method = RequestMethod.GET)
	public ModelAndView viewCenterDetail(ModelAndView mv, @PathVariable Integer centerNo) {
		try {
			Center center = cService.seletOneCenter(centerNo);
			mv.addObject("center", center).setViewName("center/detail");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	
	
	
	/* 지점목록 조회 */
	@RequestMapping(value="/center/listView", method=RequestMethod.GET)
	public String centerListView(
			HttpSession session,
			@ModelAttribute Center center
			, Model model) {
		User loginUser = (User)session.getAttribute("loginUser");
		if (loginUser != null) {
			List<Center> cList = cService.selectCenterList(center);
			if(cList != null) {
				model.addAttribute("cList", cList);
				return "center/list";
			}else {
				model.addAttribute("msg", "지점 내역이 존재하지 않습니다.");
				return "common/error";
			}

		}else {
			model.addAttribute("msg", "관리자 로그인 후 이용해주세요");
//			model.addAttribute("url", "/user/login");
			return "common/error";
			
		}
	}
	
	
	
	
	/* 지점정보 수정화면 */
	@RequestMapping(value="/center/modifyView", method=RequestMethod.GET)
	public String centerModifyView(@RequestParam("centerNo") Integer centerNo, Model model) {
		try {
			Center center = cService.selectOneById(centerNo);
			if(center != null) {
				model.addAttribute("center", center);
				return "center/modify";
			}else {
				model.addAttribute("msg", "지점정보 수정에 실패하였습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	/* 지점정보 수정 */
	@RequestMapping(value="/center/modify", method=RequestMethod.POST)
	public String centerModify(
		@ModelAttribute Center center,
	    @RequestParam(value="reloadFile1", required=false) MultipartFile reloadFile1,
	    @RequestParam(value="reloadFile2", required=false) MultipartFile reloadFile2,
	    Model model,
	    HttpServletRequest request) {
		try {
			// 수정 시 새로 업로드된 파일 존재
			if(reloadFile1 != null && !reloadFile1.isEmpty()) {
				// 기존 업로드된 파일 체크 후
				if(center.getCenterFilename1() != null) {
					// 기존 파일 삭제
					this.deleteFile1(center.getCenterFilename1(), request);
					this.deleteFile2(center.getCenterFilename2(), request);
				}
				// saveFile() 사용하여 새로 업로드된 파일 복사
				String modifyPath = this.saveFile1(reloadFile1, request);
				if(modifyPath != null) {
					// center에 새로운 파일이름, 파일경로 set
					center.setCenterFilename1(reloadFile1.getOriginalFilename());
					center.setCenterFilepath1(modifyPath);
				}
			}
			
			if(reloadFile2 != null && !reloadFile2.isEmpty()) {
				// 기존 업로드된 파일 체크 후
				if(center.getCenterFilename2() != null) {
					// 기존 파일 삭제
					this.deleteFile2(center.getCenterFilename2(), request);
				}
				// saveFile() 사용하여 새로 업로드된 파일 복사
				String modifyPath2 = this.saveFile2(reloadFile2, request);
				if(modifyPath2 != null) {
					// center에 새로운 파일이름, 파일경로 set
					center.setCenterFilename2(reloadFile2.getOriginalFilename());
					center.setCenterFilepath2(modifyPath2);
				}
			}
			
			// DB에서 지점정보 수정
			int result = cService.updateCenter(center);
			if(result > 0) {
				return "redirect:/center/listView";
			}else {
				model.addAttribute("msg", "센터 정보수정이 완료되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 기존 파일 삭제 메소드 (첫번째 사진)
	private void deleteFile1(String centerFilename1, HttpServletRequest request) throws Exception {
		String root1 = request.getSession().getServletContext().getRealPath("resources");
		String delPath1 = root1 + "\\centeruploadFiles";
		String delFilepath1 = delPath1 + "\\" + centerFilename1;
		File delFile = new File(delFilepath1);
		if(delFile.exists()) {
			delFile.delete();
		}
	}
	
	// 기존 파일 삭제 메소드 (두번째 사진)
	private void deleteFile2(String centerFilename2, HttpServletRequest request) throws Exception {
		String root2 = request.getSession().getServletContext().getRealPath("resources");
		String delPath2 = root2 + "\\centeruploadFiles";
		String delFilepath2 = delPath2 + "\\" + centerFilename2;
		File delFile = new File(delFilepath2);
		if(delFile.exists()) {
			delFile.delete();
		}
	}
	
	
	
	
	/* 지점 삭제 */
	@RequestMapping(value = "/center/remove", method=RequestMethod.GET)
	public String centerRemove(@RequestParam("centerNo") int centerNo, Model model) {
		try {
			int result = cService.deleteCenter(centerNo);
			if(result > 0) {
				return "redirect:/center/listView";
			}else {
				model.addAttribute("msg", "센터 삭제가 완료되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
		
	}

	
	
	
	
	/************************* 회원 서비스 **************************/

	/* 지점 목록 조회 */
	@RequestMapping(value="/center/userCenterList", method=RequestMethod.GET)
	public String userCenterList(
			HttpSession session
			, @ModelAttribute Search search
			, Model model) {
		
		if(search.getCenterName() != null) {
			List<Center> sList = cService.selectCenterList(search);
			model.addAttribute("sList", sList);
		}
		return "common/error";
		
	}
	
	
	
	/* 지점 검색 */
	@RequestMapping(value="/center/search", method=RequestMethod.GET)
	public String centerSearch(
			HttpSession session
			, @ModelAttribute Search search
			, Model model) {
		try {
			System.out.println(search.toString());
			
			List<Search> searchResult = cService.selectSearch(search);
			
			if(!searchResult.isEmpty()) {
				model.addAttribute("search", search);
				model.addAttribute("searchResult", searchResult);
				return "/center/centerApi";
			}else {
				model.addAttribute("msg", "스파우팅 조회에 실패하였습니다.");
				return "/center/centerApi";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	
	

}
