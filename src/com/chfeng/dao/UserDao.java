package com.chfeng.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.chfeng.po.User;

public interface UserDao {
	
	public User login(User user); //登陆
	
	public int rigister(@Param("username")String username,@Param("password")String password,@Param("head_src")String head_src);

	public User resultaccount(@Param("username")String username,@Param("password")String password); //返回账号
	
	public int setStatus(@Param("userstatus")String userstatus,@Param("account")String account); //更改状态
	
	public User resultUserName(@Param("username")String username);//返回用户名
	
}
