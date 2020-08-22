package com.chfeng.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chfeng.dao.UserMessageDao;
import com.chfeng.po.UserMessage;
import com.chfeng.service.UserMessageService;

@Service("UserMessageService")
@Transactional
public class UserMessageServiceimpl implements UserMessageService{
	@Autowired
	private UserMessageDao userMessageDao;

	@Override
	public UserMessage receiveMessage(String account) {
		// TODO Auto-generated method stub
		return this.userMessageDao.receiveMessage(account);
	}

	@Override
	public int updateReadStatus(String account) {
		// TODO Auto-generated method stub
		return this.userMessageDao.updateReadStatus(account);
	}

	@Override
	public int addUserMessage(String account, Integer pic_id,String read_status) {
		// TODO Auto-generated method stub
		return this.userMessageDao.addUserMessage(account, pic_id,read_status);
	}

}
