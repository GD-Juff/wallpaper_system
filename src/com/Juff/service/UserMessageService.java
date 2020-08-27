package com.Juff.service;

import com.Juff.po.UserMessage;

public interface UserMessageService {
	
	public UserMessage receiveMessage(String account);
	
	public int updateReadStatus(String account);
	
	public int addUserMessage(String account,Integer pic_id,String read_status);

}
