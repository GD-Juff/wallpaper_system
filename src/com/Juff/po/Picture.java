package com.Juff.po;

public class Picture {
	private int pic_id;	        //图片id
	private String pic_type; 	//类型
	private String pic_name;	//名字
	private String pic_content;	//描述内容
	private String pic_src;		//路径
	private	String account;		//用户账号
	private String pic_status;	//图片状态
	private User user;
	public int getPic_id() {
		return pic_id;
	}
	public void setPic_id(int pic_id) {
		this.pic_id = pic_id;
	}
	public String getPic_name() {
		return pic_name;
	}
	public void setPic_name(String pic_name) {
		this.pic_name = pic_name;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getPic_src() {
		return pic_src;
	}
	public void setPic_src(String pic_src) {
		this.pic_src = pic_src;
	}
	public String getPic_type() {
		return pic_type;
	}
	public void setPic_type(String pic_type) {
		this.pic_type = pic_type;
	}
	public String getPic_content() {
		return pic_content;
	}
	public void setPic_content(String pic_content) {
		this.pic_content = pic_content;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPic_status() {
		return pic_status;
	}
	public void setPic_status(String picture_status) {
		this.pic_status = picture_status;
	}
}
