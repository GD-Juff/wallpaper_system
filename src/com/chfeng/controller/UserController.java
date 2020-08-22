package com.chfeng.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.accept.ServletPathExtensionContentNegotiationStrategy;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.chfeng.po.User;
import com.chfeng.service.UserService;
import com.chfeng.session.SessionListener;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * 用户登录
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(User user,HttpServletRequest request) {
		
		String username = user.getAccount();
		String sessionid = SessionListener.userMap.get(username);  
		if(sessionid != null&&!sessionid.equals("")){
			request.setAttribute("errormsg", "用户已在别处登陆！");
			return "login";
		}
		User resultUser = userService.login(user);
		if(resultUser == null) {
			//request.setAttribute("user", user);
			request.setAttribute("errormsg", "账号密码错误！");
			return "login";
		}else if(resultUser.getUserstatus().equals("1")) {
			request.setAttribute("errormsg", "用户已被冻结！");
			return "login";
		}else {
			//if((resultUser.getUserstatus()).equals("2") ){
				//int setStatus = userService.setStatus("2", resultUser.getAccount());
				SessionListener.userMap.put(username,request.getSession().getId());  
				SessionListener.sessionMap.put(request.getSession().getId(),request.getSession());
				HttpSession session = request.getSession();
				session.setAttribute("currentUser", resultUser);
				return "redirect:/picture/findpicture.action";
			
			//}else if(resultUser.getUserstatus().equals("1")){
				//request.setAttribute("errormsg", "用户已在别处登陆！");
				//return "login";
			//}
			//else {
				//request.setAttribute("errormsg", "用户已被封号！");
				//return "login";
			}
		}
	
	/**
	 * 用户注册
	 */
	@RequestMapping(value = "/rigister.action", method = RequestMethod.POST)
	public String rigister(@RequestParam("username")String username,@RequestParam("password")String password,
			@RequestParam("uploadfile")MultipartFile uploadfile,
			HttpServletRequest request) {
				MultipartFile file = uploadfile;
				// 获取上传头像的原始名
				String originalFilename = file.getOriginalFilename();
				// 设置上传头像的保存地目录
				String dirPath = 
	                   request.getServletContext().getRealPath("/head_pic/");
				File filePath = new File(dirPath);
				// 如果保存头像的地不存在，就先创建目录
				if (!filePath.exists()) {
					filePath.mkdirs();
				}
				// 使用UUID重新命名上传的文件名(上传人_uuid_原始文件名称)
				String newFilename = username+UUID.randomUUID() + //".jpg";
	                                              "_"+originalFilename;
				try {
					// 使用MultipartFile接口的方法完成图片上传到指定位置
					file.transferTo(new File(dirPath + newFilename));
				} catch (Exception e) {
					e.printStackTrace();
	                   return"error";
				}
				//写入数据库 
				int registerUser = userService.rigister(username,password,newFilename);
				User resultAccount = userService.resultaccount(username,password);
				if(resultAccount == null) {
					request.setAttribute("errorrigister", "注册失败！");
					return "login";
				}
				else {
					HttpSession session = request.getSession();
					session.setAttribute("account", resultAccount);
					// 跳转到成功页
					return "account";
		}
	}
	
	/**
	 * 判断用户重名
	 */
	@RequestMapping(value = "/isExistUserName.action", method = RequestMethod.POST)
	@ResponseBody
	public String isExistUserName(@RequestParam("username")String username) {
		User resultUsername = userService.resultUserName(username);
		if(resultUsername!=null){
				return "{\"msg\":\"inexistence\"}";}
		else{
	    		return "{\"msg\":\"exist\"}";
	        } 
	}
	/**
	 * 关闭浏览器
	 */
	@RequestMapping(value="/xiaxian", method = RequestMethod.GET)  
    public String getNewForm(HttpServletRequest request){
		String user = request.getParameter("user");
		String sessionid = SessionListener.userMap.get(user);  
		   //注销在线用户,如果session id 相同，不销毁。  
		HttpSession httpSession = SessionListener.sessionMap.get(sessionid);
		SessionListener.userMap.remove(user);
		httpSession.invalidate();
		// SessionListener.sessionMap.remove(sessionid);
		       
		/*        SessionListener.userMap.put(user,request.getSession().getId());  
		       SessionListener.sessionMap.put(request.getSession().getId(),request.getSession());*/  
		return "redirect:/login.action";
		}

	
	/**
	 * 用户退出或者关闭浏览器
	 */
	@RequestMapping(value = "/logout.action")
	public String logout(HttpServletRequest request){
		String user = request.getParameter("user");
		String sessionid = SessionListener.userMap.get(user);  
		   //注销在线用户,如果session id 相同，不销毁。  
		HttpSession httpSession = SessionListener.sessionMap.get(sessionid);
		SessionListener.userMap.remove(user);
		//User user = (User) session.getAttribute("currentUser");
		//int setStatus = userService.setStatus("2", user.getAccount());
		//清除
		httpSession.invalidate();
		//重定向
		return "redirect:login.action";
	}
	/**
	 * 向用户登陆页面跳转
	 */
	@RequestMapping(value = "/login.action",method = RequestMethod.GET)
	public String toLogin() {
		return "login";
	}
}