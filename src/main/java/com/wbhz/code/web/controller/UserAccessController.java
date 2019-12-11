/**
 * @Title:GameLoad/com.wbhz.code.web.controller/UserAccessController.java
 * @Description:
 */
package com.wbhz.code.web.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wbhz.code.domain.Game;
import com.wbhz.code.domain.GameType;
import com.wbhz.code.domain.Prepaid;
import com.wbhz.code.domain.User;
import com.wbhz.code.service.ExpenseService;
import com.wbhz.code.service.GameService;
import com.wbhz.code.service.GameTypeService;
import com.wbhz.code.service.PrepaidService;
import com.wbhz.code.service.UserService;
import com.wbhz.code.util.StatusUtil;

/**
 * @author kc
 * @Description: 用户请求入口
 * @Date: 2019年12月9日下午4:32:27
 * @version: 1.0
 */
@Controller
public class UserAccessController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private GameTypeService gameTypeService;
	
	@Autowired
	private GameService gameService;

	@Autowired
	private PrepaidService prepaidService;
	
	@Autowired 
	private ExpenseService expenseService;
	
	/**
	 * 
	 * @Description: 用户登录入口
	 * @Return Type:String
	 * @return
	 */
	@RequestMapping("/user/login")
	public String toUser() {
		return "/user/login";
	}
	
	/**
	 * 
	 * @Description: 用户注册入口
	 * @Return Type:String
	 * @return
	 */
	@RequestMapping("/user/regist")
	public String toRegister() {
		return "/user/register";
	}
	
	/**
	 * 
	 * @Description: 用户主界面入口
	 * @Return Type:String
	 * @return
	 */
	@RequestMapping("/user")
	public String toportal(@ModelAttribute("name")String name,@ModelAttribute("typeId")String typeId,String pageNo,Model model) {
		String status = "20";
		if(null != typeId && !"".equals(typeId)) {
			GameType type = gameTypeService.getById(Long.valueOf(typeId));
			System.out.println(type);
			status = type.getStatus();
		}
		System.out.println("type="+typeId);
		Map<String, Object> map = gameService.listByConditionWithPage(name,typeId,pageNo);
		if("20".equals(status)) {
			model.addAttribute("games",map.get("datalist"));
		}
		else {
			model.addAttribute("games",null);
		}
		model.addAttribute("name",name);
		model.addAttribute("typeId",typeId);
		model.addAttribute("pageNo",map.get("pageNo"));
		model.addAttribute("totalPage",map.get("totalPage"));
		return "/user/portal";
	}
	
	/**
	 * @Description: 转向游戏详情页面
	 * @Return Type:String
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/gameDetail")
	public String toGameDetail(Long id,Model model) {
		Game game = gameService.getById(id);
		String [] files = game.getScreen().split("\\|");
		model.addAttribute("game",game);
		model.addAttribute("screens",Arrays.asList(files));
		model.addAttribute("gameMap",StatusUtil.getMap("gameMap"));	
		return "/user/gameDetail";
	}
	
	/**
	 * 
	 * @Description: 转向充值记录页面
	 * @Return Type:String
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/prepaid")
	public String toPrepaid(Long id,Model model) {
		Prepaid prepaid = prepaidService.getByUserIdInEffect(id);
		if(null == prepaid) {
			model.addAttribute("prepaid",null);
		}
		else {
			model.addAttribute("prepaid",prepaid);
		}
		return "/user/prepaid";
	}
	
	/**
	 * @Description: 转向用户信息页面
	 * @Return Type:String
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/userDetail")
	public String toUserDetail(Long id,Model model) {
		User user = userService.getById(id);
		model.addAttribute("user",user);
		Prepaid prepaid = prepaidService.getByUserIdInEffect(id);
		if(null != prepaid) {
			model.addAttribute("endTime",prepaid.getCard().getEndTime());	
		}
		else {
			model.addAttribute("endTime",null);	
		}
		model.addAttribute("sexMap",StatusUtil.getMap("sexMap"));	
		return "/user/userDetail";
	}
	
	/**
	 * @Description: 转向消费记录页面
	 * @Return Type:String
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/expense")
	public String toExpense(Long id,Model model) {
		List<Map<String, Object>> expenses = expenseService.listAll(id);
		if(null == expenses || expenses.isEmpty()) {
			model.addAttribute("expenses",null);
		}
		else {
			model.addAttribute("expenses",expenses);
		}
		model.addAttribute("operatorMap",StatusUtil.getMap("operatorMap"));	
		return "/user/expense";
	}
}
