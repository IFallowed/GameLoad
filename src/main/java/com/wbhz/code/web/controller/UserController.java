/**
 * @Title:GameLoad/com.wbhz.code.web/UserController.java
 * @Description:
 */
package com.wbhz.code.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wbhz.code.domain.Prepaid;
import com.wbhz.code.exception.MyException;
import com.wbhz.code.service.GameTypeService;
import com.wbhz.code.service.PrepaidService;
import com.wbhz.code.service.UserService;
import com.wbhz.code.util.MailUtil;
import com.wbhz.code.util.StatusUtil;
import com.wbhz.code.util.UserContext;

/**
 * @author kc
 * @Description: 用户的请求拦截
 * @Date: 2019年12月9日上午9:18:31
 * @version: 1.0
 */
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private GameTypeService gameTypeService;
	
	@Autowired
	private PrepaidService prepaidService;
	
	/**
	 * @Description: 用户登录请求
	 * @Return Type:Map<String,Object>
	 * @param account
	 * @param password
	 * @param validCode
	 * @return
	 */
	@RequestMapping("/login/toLogin")
	@ResponseBody
	public Map<String, Object> toLogin(String account,String password,String validCode){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			userService.login(account,password);
			resultMap.put("code", "200");
		} catch (MyException e) {
			System.out.println(e.getMessage());
			if(e.getMessage().contains("20")) {
				resultMap.put("code", e.getMessage());
				resultMap.put("msg", StatusUtil.getCodeMsg("httpMap", e.getMessage()));
			}else {
				resultMap.put("code", e.getMessage());
				resultMap.put("msg", StatusUtil.getCodeMsg("statusMap", e.getMessage()));
			}
		}
		return resultMap;
	}
	
	/**
	 * @Description: 获取验证码
	 * @Return Type:Map<String,Object>
	 * @param mail
	 * @return
	 */
	@RequestMapping("/regist/getValidCode")
	@ResponseBody
	public Map<String, Object> getValidCode(String mail){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String code = MailUtil.sendMail(mail);
		UserContext.setValiadCode(code);
		return resultMap;
	}
	
	@RequestMapping("/regist/toRegist")
	@ResponseBody
	public Map<String, Object> toRegist(String account,String password,String validCode,String sex,String mail,String birth){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			userService.regist(account,password,validCode,sex,mail,birth);
			resultMap.put("code", "200");
		} catch (MyException e) {
			resultMap.put("code", e.getMessage());
			resultMap.put("msg", StatusUtil.getCodeMsg("httpMap", e.getMessage()));
		}
		return resultMap;
	}
	
	@RequestMapping("/quit")
	public String quit() {
		if(null != UserContext.getCurrentUser()) {
			UserContext.setCurrentUser(null);
		}
		return "redirect:/user";
	}
	
	@RequestMapping("/index/getAllTypes")
	@ResponseBody
	public Map<String,Object> getAllTypes(){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String,Object>> typeNames = gameTypeService.getAllName();
		if(null == typeNames || typeNames.size() == 0) {
			resultMap.put("code","202");
		}
		else {
			resultMap.put("code","200");
			resultMap.put("typeNames",typeNames);
		}
		return resultMap;
	}
	
	@RequestMapping("/index/queryByCondition")
	public String queryByCondition(String name,String typeId,RedirectAttributes ra) {
		ra.addFlashAttribute("name", name);
		ra.addFlashAttribute("typeId", typeId);
		return "redirect:/user";
	}
	
	@RequestMapping("/cardCharge")
	@ResponseBody
	public Map<String, Object> cardCharge(String number,String password){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Prepaid prepaid = prepaidService.getByUserIdInEffect(UserContext.getCurrentUser().getId());
		if(null == prepaid) {
			try {
				userService.chargeCard(number,password);
				resultMap.put("code","200");
			} catch (MyException e) {
				if(e.getMessage().contains("20")) {
					resultMap.put("code", e.getMessage());
					resultMap.put("msg", StatusUtil.getCodeMsg("httpMap", e.getMessage()));
				}else {
					resultMap.put("code", e.getMessage());
					resultMap.put("msg", StatusUtil.getCodeMsg("statusMap", e.getMessage()));
				}
			}
		}
		else {
			resultMap.put("code", "13");
			resultMap.put("msg", "你已有一张生效中的密保卡，请使用完再充值");
		}
		return resultMap;
	}
	
	@RequestMapping("/updatePwd")
	@ResponseBody
	public Map<String, Object> updatePwd(String oldPwd,String newPwd){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(oldPwd.equals(UserContext.getCurrentUser().getPassword())) {
			UserContext.getCurrentUser().setPassword(newPwd);
			userService.updatePwd(UserContext.getCurrentUser());
			resultMap.put("code", "200");
		}
		else {
			resultMap.put("code", "201");
			resultMap.put("msg", "原密码不正确");
		}
		return resultMap;
	}
	
	@RequestMapping("/downGame")
	@ResponseBody
	public Map<String, Object> downGame(Long gameId,String payType,String tariffe,String currency){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println(gameId);
		System.out.println(payType);
		//查询用户有没有登录
		if(null != UserContext.getCurrentUser()) {
			//进入下载流程
			userService.downGame(resultMap,gameId,payType,tariffe,currency);
		}
		else {
			resultMap.put("code", "202");
			resultMap.put("msg", "尚未登录，请登陆后在购买");
		}
		return resultMap;
	}
	
	
}
