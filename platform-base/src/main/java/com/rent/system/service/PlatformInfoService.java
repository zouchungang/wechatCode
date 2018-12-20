package com.rent.system.service;

import com.rent.common.util.FileUtils;
import com.rent.system.dao.PlatformInfoDao;
import com.rent.system.entity.PlatformInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
@Service
public class PlatformInfoService {
	@Autowired
	private PlatformInfoDao companyinfoDao;
	
	public List<PlatformInfo> findALL() {
		// TODO Auto-generated method stub
		return companyinfoDao.findAll();
	}

	
	public void create(PlatformInfo PlatformInfo) {
		// TODO Auto-generated method stub
		companyinfoDao.save(PlatformInfo);
	}

	
	public void update(PlatformInfo PlatformInfo) {
		// TODO Auto-generated method stub
		companyinfoDao.save(PlatformInfo);
	}

	
	public PlatformInfo findById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public void deleteById(String id) {
		// TODO Auto-generated method stub
	}
	public boolean uploadPhoto(MultipartFile photoFile) {
		// 获取了文件整个名称及路径
		String attachName = photoFile.getOriginalFilename();
		// 获取文件类型
		String fileType = attachName
				.substring((attachName.lastIndexOf(".")) + 1);
		String photo = "photo." + fileType;
		String dirPath = File.separator + "photo" + File.separator + "company"
				+ File.separator;
		String filePath = dirPath + File.separator + photo;
//		// 如果之前有附件则
//		if (student.getPhoto() != null && !"".equals(student.getPhoto())) {
//			// 先删除已有附件
//			FileUtils.deleteFile(filePath);
//		}
		// 将文件上传到指定系统目录下
		FileUtils.createDir(dirPath);
		try {
			FileUtils.uploadFile(filePath, photoFile.getBytes());
			return true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

}
