package com.chfeng.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chfeng.dao.AdminPictureDao;
import com.chfeng.po.Picture;
import com.chfeng.service.AdminPictureService;
@Service("AdminPictureService")
@Transactional
public class AdminPictureServiceimpl implements AdminPictureService {
	@Autowired
	public AdminPictureDao AdminPictureDao;
	
	@Override
	public List<Picture> reviewPicture() {
		
		return this.AdminPictureDao.reviewPicture();
	}

	@Override
	public int setPic_status(String pic_status, Integer pic_id) {
		
		return this.AdminPictureDao.setPic_status(pic_status,pic_id);
	}

	@Override
	public int deleteUserPicture(Integer pic_id) {
		
		return this.AdminPictureDao.deleteUserPicture(pic_id);
	}
	
}