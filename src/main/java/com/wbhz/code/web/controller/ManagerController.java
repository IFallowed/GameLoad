/**
 * @Title:GameLoad/com.wbhz.code.web.controller/ManagerController.java
 * @Description:
 */
package com.wbhz.code.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wbhz.code.exception.MyException;
import com.wbhz.code.service.ManagerService;
import com.wbhz.code.util.MailUtil;
import com.wbhz.code.util.StatusUtil;
import com.wbhz.code.util.UserContext;

/**
 * @author kc
 * @Description: 管理员的请求拦截
 * @Date: 2019年12月3日上午9:26:20
 * @version: 1.0
 */
@Controller
@RequestMapping("/manager/login")
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;
	
	/**
	 * 
	 * @Description: 管理员的登录请求
	 * @Return Type:Map<String,Object>
	 * @param account
	 * @param password
	 * @return
	 */
	@RequestMapping("/toLogin")
	@ResponseBody
	public Map<String, Object> toLogin(String account,String password,String validCode){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			managerService.login(account,password,validCode);
			resultMap.put("code", "200");
		} catch (MyException e) {
			resultMap.put("code", e.getMessage());
			resultMap.put("msg", StatusUtil.getCodeMsg("httpMap", e.getMessage()));
		}
		return resultMap;
	}
	
	/**
	 * 
	 * @Description: 获取验证码
	 * @Return Type:Map<String,Object>
	 * @return
	 */
	@RequestMapping("/getValidCode")
	@ResponseBody
	public Map<String, Object> getValidCode() {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String code = MailUtil.getValidateCode();
		UserContext.setValiadCode(code);
		resultMap.put("validCode",code);
		return resultMap;
	}
	
	@RequestMapping("/quit")
	public String quit() {
		if(null != UserContext.getCurrentManager()) {
			UserContext.setCurrentManager(null);
		}
		return "redirect:/manager";
	}
	
	
}
