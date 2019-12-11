/**
 * @Title:GameLoad/com.wbhz.code.web.controller/MUserController.java
 * @Description:
 */
package com.wbhz.code.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wbhz.code.service.UserService;

/**
 * @author kc
 * @Description: 后台用户模块请求处理
 * @Date: 2019年12月4日下午1:41:17
 * @version: 1.0
 */
@Controller
@RequestMapping("/manager/user")
public class MUserController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * @Description: 条件查询
	 * @Return Type:String
	 * @param account
	 * @param mail
	 * @param ra
	 * @return
	 */
	@RequestMapping("/queryByCondition")
	public String queryByCondition(String account,String mail,RedirectAttributes ra) {
//		List<User> users = userService.listByConditionWithPage(account, mail);
//		model.addAttribute("users",users);
//		model.addAttribute("statusMap",StatusUtil.getMap("statusMap"));
		ra.addFlashAttribute("account", account);
		ra.addFlashAttribute("mail", mail);
		return "redirect:/manager/user";
	}
	
	/**
	 * @Description: 修改选中的用户的状态
	 * @Return Type:String
	 * @param ids
	 * @param status
	 * @return
	 */
	@RequestMapping("/changeStatus")
	@ResponseBody
	public String changeStatus(String ids,String status){
		userService.updateStatus(ids,status);
		return "200";
	}
}
