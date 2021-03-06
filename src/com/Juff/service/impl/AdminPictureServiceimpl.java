package com.Juff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Juff.dao.AdminPictureDao;
import com.Juff.po.Picture;
import com.Juff.service.AdminPictureService;
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