package com.Juff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Juff.dao.AdminUserDao;
import com.Juff.po.AdminUser;
import com.Juff.po.User;
import com.Juff.service.AdminUserService;


@Service("AdminUserService")
@Transactional
public class AdminUserServiceimpl implements AdminUserService {
	
	@Autowired
	private AdminUserDao adminuserDao;
	
	@Override
	public int userManagement(String userstatus,String account) {
		// TODO Auto-generated method stub
		return this.adminuserDao.userManagement(userstatus,account);
	}

	@Override
	public List<User> findUser() {
		// TODO Auto-generated method stub
		return this.adminuserDao.findUser();
	}

	@Override
	public AdminUser adminLogin(AdminUser adminuser) {
		// TODO Auto-generated method stub
		return this.adminuserDao.adminLogin(adminuser);
	}

	@Override
	public int deleteUser(String account) {
		// TODO Auto-generated method stub
		return this.adminuserDao.deleteUser(account);
	}
}
