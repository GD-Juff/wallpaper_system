package com.Juff.service;

import com.Juff.po.User;

public interface UserService{
	
	public User login(User user);
	
	public int rigister(String username,String password,String head_src);

	public User resultaccount(String username,String password);
	
	public int setStatus(String userstatus,String account);

	public User resultUserName(String username);
}