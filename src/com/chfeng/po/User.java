package com.chfeng.po;

public class User {
	private int id;
	private String account;		//账号
	private String username;	//昵称
	private String password;	//密码
	private String head_src;	//头像路径
	private String userstatus;	//用户状态 1在线   2离线  3封号
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getHead_src() {
		return head_src;
	}
	public void setHead_src(String head_src) {
		this.head_src = head_src;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getUserstatus() {
		return userstatus;
	}
	public void setUserstatus(String userstatus) {
		this.userstatus = userstatus;
	}
}
