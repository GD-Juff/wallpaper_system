package com.Juff.service;

import java.util.List;

import com.Juff.po.Picture;

public interface PictureService {

	public List<Picture> findpicture(String pic_type);
	
	public int upload(String pic_name,String pic_type,String pic_src,String pic_content,String account);
	
	public List<Picture> findMyPicture(String account,String password,String pic_status);
	
	public int deleteMyPicture(String account,Integer pic_id,String pic_src);
	
	public int updateMyPicture(String pic_name,String  pic_type,String pic_content,String account,Integer pic_id);
	
	public Picture findIdPicture(Picture picture);
	
}
