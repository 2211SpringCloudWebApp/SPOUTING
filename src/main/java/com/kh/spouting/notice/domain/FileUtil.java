package com.kh.spouting.notice.domain;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUtil {

	public Map<String, String> saveFile(MultipartFile multi, HttpServletRequest request) throws IllegalStateException, IOException{
		Map<String, String> result = null;
		String renameFilepath = null;
		String renameFilename = null;
		
		if(multi != null && !multi.equals("")) {
			result = new HashMap<String, String>();
			
			String originalFilename = multi.getOriginalFilename();
			String wasRoot = request.getSession().getServletContext().getRealPath("resources/images");
			String savePath = wasRoot + "\\" + "notice";
			
			File folder = new File(savePath);
			if(!folder.exists()) {
				folder.mkdirs();
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			renameFilename = sdf.format(new Date(System.currentTimeMillis()))+"."+originalFilename.substring(originalFilename.lastIndexOf(".")+1);
			renameFilepath = savePath + "\\" + renameFilename;
			
			multi.transferTo(new File(renameFilepath));
			result.put("originl", originalFilename);
			result.put("rename", renameFilename);
			result.put("renameFilepath", renameFilepath);
		}
		return result;
	}
}
