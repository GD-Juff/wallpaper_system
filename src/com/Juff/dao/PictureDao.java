package com.Juff.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Juff.po.Picture;

public interface PictureDao {
	//搜索
	public List<Picture> findpicture(@Param("pic_type")String pic_type);
	
	//发布
	public int upload(@Param("pic_name")String pic_name,@Param("pic_type")String pic_type,@Param("pic_src")String pic_src,@Param("pic_content")String pic_content,@Param("account")String account);
	
	//我的上传和审核
	public List<Picture> findMyPicture(@Param("account")String account,@Param("password")String password,@Param("pic_status")String pic_status);
	
	//删除我的图片
	public int deleteMyPicture(@Param("account")String account,@Param("pic_id")Integer pic_id,@Param("pic_src")String pic_src);
	
	//修改我的图片
	public int updateMyPicture(@Param("pic_name")String pic_name,@Param("pic_type")String  pic_type,@Param("pic_content")String pic_content,@Param("account")String account,@Param("pic_id")Integer pic_id);

	//根据id查询图片
	public Picture findIdPicture(Picture picture);
	
}
