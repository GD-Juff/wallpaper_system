package com.Juff.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.Juff.po.AdminUser;
import com.Juff.po.User;
/**
 * 登录注册拦截器
 */
public class LoginInterceptor implements HandlerInterceptor {
	@SuppressWarnings("unused")
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// 获取请求的URL
		String url = request.getRequestURI();
		// URL:除了登录、注册请求外，其他的URL都进行拦截控制
		if (url.indexOf("/adminuser/adminlogin.action") >= 0
				||url.indexOf("/user/login.action") >= 0
				|| url.indexOf("/user/rigister.action") >= 0
				|| url.indexOf("/user/isExistUserName.action")>=0) {
			return true;
		}
		// 获取Session
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		AdminUser adminuser = (AdminUser) session.getAttribute("adminuser");
		// 判断Session中是否有用户数据，如果有，则返回true,继续向下执行
		if (user !=null || adminuser !=null) {
			return true;
		}
		// 不符合条件的给出提示信息，并转发到登录页面
		else {
			request.setAttribute("msg", "您还没有登录，请先登录！");
			request.getRequestDispatcher("/WEB-INF/jsp/login.jsp")
			                                        .forward(request, response);
			return false;
		}
	}

	@Override
	public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

	}

}
