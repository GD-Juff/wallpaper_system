package com.Juff.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Juff.po.AdminUser;
import com.Juff.po.User;

public interface AdminUserService {
	
	public AdminUser adminLogin(AdminUser adminuser); //登陆
	
	public List<User> findUser();

	public int userManagement(@Param("userstatus")String userstatus,@Param("account")String account);
	
	public int deleteUser(String account);
	
}
