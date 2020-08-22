package com.chfeng.po;

public class UserMessage {
	private int msg_id;	//
	private String account;
	private int pic_id;
	private String read_status;
	public int getMsg_id() {
		return msg_id;
	}
	public void setMsg_id(int msg_id) {
		this.msg_id = msg_id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public int getPic_id() {
		return pic_id;
	}
	public void setPic_id(int pic_id) {
		this.pic_id = pic_id;
	}
	public String getRead_status() {
		return read_status;
	}
	public void setRead_status(String read_status) {
		this.read_status = read_status;
	}

}
