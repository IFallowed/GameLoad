/**
 * @Title:GameLoad/com.wbhz.code.util/UserContext.java
 * @Description:
 */
package com.wbhz.code.util;

import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.wbhz.code.domain.Manager;
import com.wbhz.code.domain.User;

/**
 * @author kc
 * @Description: 封装当前登录用户的上下文信息
 * @Date: 2019年12月3日上午10:01:00
 * @version: 1.0
 */
public class UserContext {

	//获取HttpSession对象
	public static HttpSession getSession() {
		return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest().getSession();
	}
	
	public static void setCurrentUser(User user) {
		getSession().setAttribute("user", user);
	}
	
	public static void setCurrentManager(Manager manager) {
		getSession().setAttribute("manager", manager);
	}
	
	public static void setValiadCode(String code) {
		getSession().setAttribute("validCode", code);
		getSession().setAttribute("time", System.currentTimeMillis());
	}
	
	public static User getCurrentUser() {
		return (User) getSession().getAttribute("user");
	}
	
	public static Manager getCurrentManager() {
		return (Manager) getSession().getAttribute("manager");
	}
	
	public static String getValiadCode() {
		Long time = (Long) getSession().getAttribute("time");
		if(null != time && System.currentTimeMillis() - time < 30000) {
			return (String) getSession().getAttribute("validCode");
		}
		else {
			return null;
		}
	}
}
