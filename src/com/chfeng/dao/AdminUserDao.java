package com.chfeng.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chfeng.po.AdminUser;
import com.chfeng.po.User;

public interface AdminUserDao {
	//登陆
	public AdminUser adminLogin(AdminUser adminuser); //登陆
	//用户列表
	public List<User> findUser();
	//用户管理
	public int userManagement(@Param("userstatus")String userstatus,@Param("account")String account); 
	//删除用户
	public int deleteUser(@Param("account")String account);
}
