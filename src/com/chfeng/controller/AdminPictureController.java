package com.chfeng.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chfeng.po.Picture;
import com.chfeng.po.User;
import com.chfeng.service.AdminPictureService;
import com.chfeng.service.UserMessageService;

@Controller
@RequestMapping("/adminpicture")
public class AdminPictureController {
	@Autowired
	private AdminPictureService adminPictureService;
	
	@Autowired
	private UserMessageService userMessageService;
	
	/**
	 * 跳转页面
	 */
	@RequestMapping(value = "/toAdmin.action")
	public String toAdmin() {
		return "admin";
	}

	/**
	 * 查询图片
	 */
	@RequestMapping(value = "/reviewPicture.action")
	public String reviewPicture(Model model) {
		List<Picture> resultPicture = (List<Picture>) adminPictureService.reviewPicture();
		model.addAttribute("Page", resultPicture);
		return "admin";
	}
	
	/**
	 * 审核通过
	 */
	@RequestMapping(value = "/setPic_status.action")
	@ResponseBody
	public String setPic_status(Integer pic_id,String account) {
		int setPic_status = adminPictureService.setPic_status("2", pic_id); //审核通过！
		int reslutmsg = userMessageService.addUserMessage(account, pic_id,"1"); //插入新通过！
		if(setPic_status > 0 && reslutmsg > 0) {
			return "OK";
		}else {
			return "FALL";
		}
	}
	
	/**
	 * 删除图片
	 */
	@RequestMapping(value = "/deleteUserPicture.action")
	@ResponseBody
	public String deleteUserPicture(Integer pic_id,String account) {
		int deleteuserpicture = adminPictureService.deleteUserPicture(pic_id); //审核不通过！
		//int reslutmsg = userMessageService.addUserMessage(account, pic_id,"2"); //插入新删除！
		if(deleteuserpicture > 0) {
			return "OK";
		}else {
			return "FALL";
		}
	}
}
	
