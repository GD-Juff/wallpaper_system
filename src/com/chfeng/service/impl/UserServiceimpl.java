package com.chfeng.service.impl;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chfeng.dao.UserDao;
import com.chfeng.po.User;
import com.chfeng.service.UserService;
	@Service("userService")
	@Transactional
	public class UserServiceimpl implements UserService{
		@Autowired
		private UserDao userDao;
		@Override
		public User login(User user) {
			return this.userDao.login(user);
		}
		
		@Override
		public int rigister(String username,String password,String head_src) {
			// TODO Auto-generated method stub
			return this.userDao.rigister(username,password,head_src);
		}
		
		@Override
		public User resultaccount(String username,String password) {
			return this.userDao.resultaccount(username,password);
		}
		
		@Override
		public int setStatus(String userstatus,String account){
			return this.userDao.setStatus(userstatus,account);
		}
		
		@Override
		public User resultUserName(String username) {
			return this.userDao.resultUserName(username);
		}
	}
