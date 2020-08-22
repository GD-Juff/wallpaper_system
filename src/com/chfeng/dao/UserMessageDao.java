package com.chfeng.dao;

import org.apache.ibatis.annotations.Param;

import com.chfeng.po.UserMessage;

public interface UserMessageDao {
	
	//查看新通知
	public UserMessage receiveMessage(@Param("account")String account);
	
	//标记已读
	public int updateReadStatus(@Param("account")String account);
	
	//插入新纪录
	public int addUserMessage(@Param("account")String account,@Param("pic_id")Integer pic_id,@Param("read_status")String read_status);

}
