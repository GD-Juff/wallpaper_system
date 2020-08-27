package com.Juff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Juff.dao.PictureDao;
import com.Juff.po.Picture;
import com.Juff.service.PictureService;

@Service("PictureService")
@Transactional
public class PictureServiceimpl implements PictureService {
	@Autowired
	public PictureDao pictureDao;
	
	@Override
	public List<Picture> findpicture(String pic_type) {
		
		return this.pictureDao.findpicture(pic_type);
	}
	
	@Override
	public int upload(String pic_name,String pic_type,String pic_src,String pic_content,String account) {
		return this.pictureDao.upload(pic_name,pic_type, pic_src,pic_content,account);
	}
	
	@Override
	public List<Picture> findMyPicture(String account,String password,String pic_status) {
		
		return this.pictureDao.findMyPicture(account,password,pic_status);
	}

	@Override
	public int deleteMyPicture(String account, Integer pic_id,String pic_src) {
		
		return this.pictureDao.deleteMyPicture(account,pic_id,pic_src);
	}

	@Override
	public int updateMyPicture(String pic_name, String pic_type, String pic_content, String account, Integer pic_id) {
		// TODO Auto-generated method stub
		return this.pictureDao.updateMyPicture(pic_name, pic_type, pic_content, account, pic_id);
	}

	@Override
	public Picture findIdPicture(Picture picture) {
		// TODO Auto-generated method stub
		return this.pictureDao.findIdPicture(picture);
	}

}
