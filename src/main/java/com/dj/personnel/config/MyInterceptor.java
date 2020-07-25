package com.dj.personnel.config;

import com.dj.personnel.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class MyInterceptor implements HandlerInterceptor {

	/**
	 * 进入方法前执行
	 * false为中断执行 
	 * true为允许通过
	 */

	/*@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		System.out.println("进入方法前执行");
		// 登录上有缓存，没登录跳别的页面是没缓存的
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (null == user) {
			response.sendRedirect(request.getContextPath() + "/user/toLogin");
			return false;
		}
		return true;
	}*/

}
