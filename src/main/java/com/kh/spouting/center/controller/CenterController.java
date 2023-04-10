package com.kh.spouting.center.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spouting.center.domain.Center;
import com.kh.spouting.center.service.CenterService;
import com.kh.spouting.user.domain.User;

@Controller
public class CenterController {
	
	@Autowired
	private CenterService cService;
	
	
	/* 지점 등록 화면 */
	@RequestMapping(value="/center/registerView", method=RequestMethod.GET)
	public String centerRegisterView() {
		return "center/register";
	}
	
	/* 지점 등록 */
	@RequestMapping(value="/center/register", method=RequestMethod.POST)
	public String centerRegister(
			@ModelAttribute Center center
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, HttpServletRequest request
			, Model model) {
		try {
			// 인코딩
			request.setCharacterEncoding("UTF-8");
			
			// 첫번째 파일이 있을 경우
			if(!uploadFile.getOriginalFilename().equals("")) {
				// 파일 복사(지정한 경로 업로드)
				String filePath = saveFile(uploadFile, request);
				
				if(filePath != null) {	// 파일경로가 존재하면
					// - DB에 값 저장 가능(uploadFile)
					center.setCenterFilename1(uploadFile.getOriginalFilename());
					// 경로에 있는 파일 저장
					center.setCenterFilepath1(filePath);
				}
			}
			
			// 두번째 파일이 있을 경우
			if(!uploadFile.getOriginalFilename().equals("")) {
				// 파일 복사(지정한 경로 업로드)
				String filePath = saveFile(uploadFile, request);
				
				if(filePath != null) {	// 파일경로가 존재하면
					// - DB에 값 저장 가능(uploadFile)
					center.setCenterFilename2(uploadFile.getOriginalFilename());
					// 경로에 있는 파일 저장
					center.setCenterFilepath2(filePath);
				}
			}
			
			
			int result = cService.insertCenter(center);
			if(result > 0) {
				// 지점등록 성공 시 메인페이지로 이동
				return "redirect:/xxx";
			}else {
				// 지점등록 실패 시 에러페이지로 이동
				model.addAttribute("msg", "지점등록이 완료되지 않았습니다. 관리자에게 문의해주세요");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
		
	}

	// 지점 경로로 파일 복사(파일업로드)
	// 파일복사에 필요한 업로드 파일과 servlet 생성
	private String saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		// 원하는 저장 경로
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\centeruploadFiles";
		// 폴더가 없을 경우 자동 생성
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir();
		}

		try {
			// 실제 파일의 경로
			String filePath = savePath + "\\" + uploadFile.getOriginalFilename();
			// 실제로 파일 저장
			File file = new File(filePath);
			uploadFile.transferTo(file);
			return filePath;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	
	
	
	/* 지점목록 조회 */
	@RequestMapping(value="/center/listView", method=RequestMethod.GET)
	public String centerListView(
			HttpSession session,
			@ModelAttribute Center center
			, Model model) {
//		User user = (User)session.getAttribute("loginUser");
//		if (user == null) {
//			model.addAttribute("msg", "관리자 로그인 후 이용해주세요");
//			model.addAttribute("url", "/user/login");
//			//return "commnon/alert";
//
//		}
		List<Center> cList = cService.selectCenterList(center);
		if(cList != null) {
			model.addAttribute("cList", cList);
			return "center/list";
		}else {
			model.addAttribute("msg", "지점 내역이 존재하지 않습니다.");
			return "common/error";
		}
		
	}
	
	
	/* 지점정보 수정화면 */
	@RequestMapping(value="/center/modifyView", method=RequestMethod.GET)
	public String centerModifyView(@RequestParam("centerNo") Integer centerNo, Model model) {
		try {
			Center center = cService.selectOnById(centerNo);
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
			@ModelAttribute Center center
			, @RequestParam(value="centerFilename1", required=false) MultipartFile centerFilename1
			, @RequestParam(value="centerFilename2", required=false) MultipartFile centerFilename2
			, Model model
			, HttpServletRequest request) {
		try {
			// 수정 시 새로 업로드된 파일 존재
			if(!centerFilename1.isEmpty()) {
				// 기존 업로드된 파일 체크 후
				if(center.getCenterFilename1() != null) {
					// 기존 파일 삭제
					this.deleteFile1(center.getCenterFilename1(), request);
				}
				// saveFile() 사용하여 새로 업로드된 파일 복사
				String modifyPath1 = this.saveFile(centerFilename1, request);
				if(modifyPath1 != null) {
					// center에 새로운 파일이름, 파일경로 set
					center.setCenterFilename1(centerFilename1.getOriginalFilename());
					center.setCenterFilepath1(modifyPath1);
				}
			}
			
			if(!centerFilename2.isEmpty()) {
				// 기존 업로드된 파일 체크 후
				if(center.getCenterFilename1() != null) {
					// 기존 파일 삭제
					this.deleteFile2(center.getCenterFilename1(), request);
				}
				// saveFile() 사용하여 새로 업로드된 파일 복사
				String modifyPath2 = this.saveFile(centerFilename2, request);
				if(modifyPath2 != null) {
					// center에 새로운 파일이름, 파일경로 set
					center.setCenterFilename2(centerFilename2.getOriginalFilename());
					center.setCenterFilepath2(modifyPath2);
				}
			}
			
			// DB에서 지점정보 수정
			int result = cService.updateCenter(center);
			if(result > 0) {
				return "/center/modifyView?centerNo=" + center.getCenterNo();
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
	private void deleteFile2(String centerFilename1, HttpServletRequest request) throws Exception {
		String root2 = request.getSession().getServletContext().getRealPath("resources");
		String delPath2 = root2 + "\\centeruploadFiles";
		String delFilepath2 = delPath2 + "\\" + centerFilename1;
		File delFile = new File(delFilepath2);
		if(delFile.exists()) {
			delFile.delete();
		}
	}
	
	
	
	

}
