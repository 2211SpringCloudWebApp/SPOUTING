package com.kh.spouting.common;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUtil {

	public Map<String, String> saveFile(
			MultipartFile multi
			, HttpServletRequest request
			, String folderName) throws Exception{
		Map<String, String> result = null;
		String reFilename = null;
		String reFilepath = null;
		
		
		if(multi != null && !multi.equals("")) {
			result = new HashMap<String, String>();
			
			//지정 폴더에 저장
			String originName = multi.getOriginalFilename();
			String wasRoot = request.getSession().getServletContext().getRealPath("/resources/images");
			String savePath = wasRoot + "\\" + folderName;
			
			//폴더 없으면 만들어주기
			File folder = new File(savePath);
			if(!folder.exists()) {
				folder.mkdir();
			}
			//올린 시간을 파일명으로 지정
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			// . 잘라서 지정 폴더에 저장
			reFilename = sdf.format(new Date(System.currentTimeMillis())) + "." + originName.substring(originName.lastIndexOf(".")+1);
			reFilepath = savePath + "\\" + reFilename;
			
			multi.transferTo(new File(reFilepath));
		
			result.put("rename", reFilename);
			result.put("renameFilepath", reFilepath);
		}
		return result;
	}
}
