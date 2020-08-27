package com.Juff.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Juff.po.Picture;

public interface AdminPictureService {
	
	public List<Picture> reviewPicture();

	public int setPic_status(@Param("pic_status")String pic_status,@Param("pic_id")Integer pic_id);
	
	public int deleteUserPicture(@Param("pic_id")Integer pic_id);
	
}
