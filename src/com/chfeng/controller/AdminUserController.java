package com.chfeng.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chfeng.po.AdminUser;
import com.chfeng.po.User;
import com.chfeng.service.AdminUserService;

@Controller
@RequestMapping("/adminuser")
public class AdminUserController {
	@Autowired
	private AdminUserService adminuserService;
	
	/**
	 * 管理员登陆
	 */
	@RequestMapping(value = "/adminlogin.action", method = RequestMethod.POST)
	public String adminLogin(AdminUser adminuser,HttpServletRequest request) {
		AdminUser resultadminuser = adminuserService.adminLogin(adminuser);
		if(resultadminuser == null) {
			request.setAttribute("user", resultadminuser);
			request.setAttribute("errormsg", "账号密码错误！");
			return "adminLogin";
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("adminuser", resultadminuser);
			return "redirect:/adminpicture/reviewPicture.action";
		}
	}
	
	
	/**
	 * 用户列表
	 */
	@RequestMapping(value = "/findUser.action")
	public String findUser(Model model) {
		List<User> resultUser = (List<User>)adminuserService.findUser();
		model.addAttribute("resultUser", resultUser);
		return "admin";
	}
	
	/**
	 * 用户管理
	 */
	@RequestMapping(value = "/userManagement.action")
	@ResponseBody
	public String userManagement(String userstatus,String account) {
		int setUserstatus = adminuserService.userManagement(userstatus,account);
		if(setUserstatus > 0) {
			return "OK";
		}else {
			return "FALL";
		}
	}
	
	/**
	 * 删除用户
	 */
	@RequestMapping(value = "/deleteUser.action" ,method = RequestMethod.POST)
	@ResponseBody
	public String deleteUser(String account) {
		int deleteuser = adminuserService.deleteUser(account);
		if(deleteuser > 0) {
			return "OK";
		}else {
			return "FALL";
		}
	}
}
