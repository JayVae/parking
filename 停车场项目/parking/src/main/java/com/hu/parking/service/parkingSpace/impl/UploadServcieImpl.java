package com.hu.parking.service.parkingSpace.impl;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.hu.parking.service.parkingSpace.UploadService;
import com.hu.parking.util.Identities;

@Service("uploadService")
public class UploadServcieImpl implements UploadService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	public String upload(CommonsMultipartFile[] files,String fileRealPathDir){
		//根据真实保存路径创建目录
		File saveFilePath = new File(fileRealPathDir);
		if (!saveFilePath.exists()) {
			saveFilePath.mkdirs();
		}
		String newFilename = "";
		for (int i = 0; i < files.length; i++) {
			if (!files[i].isEmpty()) {
				try {
					String filename = files[i].getOriginalFilename();
					// 后缀名
					String suffixName = filename.substring(filename.lastIndexOf("."));
					// 重命名上传后的文件名
					newFilename = Identities.uuid2() + suffixName;
					// 拼成完整的文件保存路径加文件
					String newFilepath = fileRealPathDir + File.separator+ newFilename;
					File newfile = new File(newFilepath);
					files[i].transferTo(newfile);
				} catch (Exception e) {
					logger.error(e.getMessage());
					return "error";
				}
			}
		}
		return newFilename;
	}
}
