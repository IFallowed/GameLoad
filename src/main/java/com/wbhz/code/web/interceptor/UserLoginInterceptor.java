/**
 * @Title:GameLoad/com.wbhz.code.web.interceptor/UserLoginInterceptor.java
 * @Description:
 */
package com.wbhz.code.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.wbhz.code.util.UserContext;

/**
 * @author kc
 * @Description:
 * @Date: 2019年12月10日下午7:55:21
 * @version: 1.0
 */
public class UserLoginInterceptor implements HandlerInterceptor {

	/**
	 * @see org.springframework.web.servlet.HandlerInterceptor#preHandle(javax.servlet.http.HttpServletRequest,
	 *      javax.servlet.http.HttpServletResponse, java.lang.Object)
	 * @param request
	 * @param response
	 * @param handler
	 * @return
	 * @throws Exception
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 如果session里面没有管理员账号，则强制跳转到登录页面
		if (UserContext.getCurrentUser() == null) {
			response.sendRedirect("/user/login");
			return false;
		} else {
			return true;
		}
	}
}
