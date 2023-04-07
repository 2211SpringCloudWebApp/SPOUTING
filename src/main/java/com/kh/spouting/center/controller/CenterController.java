package com.kh.spouting.center.controller;

import java.io.File;

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
		// 원하는 경로
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
//	@RequestMapping(value="/center/listView", method=RequestMethod.GET)
//	public String centerListView(
//			HttpSession session
//			, Model model) {
//		User user = (User)session.getAttribute("loginUser");
//		if (user == null) {
//			model.addAttribute("msg", "관리자 로그인 후 이용해주세요");
//			model.addAttribute("url", "/");
//
//		}
//		int centerNo = center.getCenterNo();
//	}

}
