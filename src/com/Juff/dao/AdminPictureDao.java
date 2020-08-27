package com.Juff.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Juff.po.Picture;

public interface AdminPictureDao {
	//审核图片
	public List<Picture> reviewPicture();
	
	public int setPic_status(@Param("pic_status")String pic_status,@Param("pic_id")Integer pic_id);
	
	//删除图片
	public int deleteUserPicture(@Param("pic_id")Integer pic_id);
}
