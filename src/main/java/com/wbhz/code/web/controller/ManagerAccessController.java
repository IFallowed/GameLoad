/**
 * @Title:GameLoad/com.wbhz.code.web.controller/AccessController.java
 * @Description:
 */
package com.wbhz.code.web.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wbhz.code.service.CardService;
import com.wbhz.code.service.ExchangeService;
import com.wbhz.code.service.GameService;
import com.wbhz.code.service.GameTypeService;
import com.wbhz.code.service.UserService;
import com.wbhz.code.util.StatusUtil;

/**
 * @author kc
 * @Description: 程序访问入口
 * @Date: 2019年12月2日下午4:07:36
 * @version: 1.0
 */
@Controller
public class ManagerAccessController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private GameTypeService gameTypeService;
	
	@Autowired
	private GameService gameService;
	
	@Autowired
	private ExchangeService exchangeService;
	
	@Autowired
	private CardService cardService;
	
	/**
	 * 
	 * @Description: 管理员登录入口
	 * @Return Type:String
	 * @return
	 */
	@RequestMapping("/manager/login")
	public String toManager() {
		return "/manager/login";
	}
	
	/**
	 * 
	 * @Description: 管理员主界面入口
	 * @Return Type:String
	 * @return
	 */
	@RequestMapping("/manager")
	public String toindex() {
		return "/manager/index";
	}
	
	@RequestMapping("/manager/top")
	public String toTop() {
		return "/manager/top";
	}
	
	@RequestMapping("/manager/left")
	public String toLeft() {
		return "/manager/left";
	}
	
	/**
	 * 
	 * @Description: 用户列表入口
	 * @Return Type:String
	 * @param account
	 * @param mail
	 * @param pageNo
	 * @param model
	 * @return
	 */
	@RequestMapping("/manager/user")
	public String toUser(@ModelAttribute("account")String account,@ModelAttribute("mail")String mail,String pageNo,Model model) {
		Map<String, Object> map = userService.listByConditionWithPage(account,mail,pageNo);
		model.addAttribute("users",map.get("datalist"));
		model.addAttribute("account",account);
		model.addAttribute("mail",mail);
		model.addAttribute("pageNo",map.get("pageNo"));
		model.addAttribute("totalPage",map.get("totalPage"));
		model.addAttribute("statusMap",StatusUtil.getMap("statusMap"));
		return "/user/user";
	}
	
	/**
	 * 
	 * @Description: 游戏类型列表入口
	 * @Return Type:String
	 * @param name
	 * @param status
	 * @param pageNo
	 * @param model
	 * @return
	 */
	@RequestMapping("/manager/gametype")
	public String toGameType(@ModelAttribute("name")String name,@ModelAttribute("status")String status,String pageNo,Model model) {
		Map<String, Object> map = gameTypeService.listByConditionWithPage(name,status,pageNo);
		model.addAttribute("gameTypes",map.get("datalist"));
		model.addAttribute("name",name);
		model.addAttribute("status",status);
		model.addAttribute("pageNo",map.get("pageNo"));
		model.addAttribute("totalPage",map.get("totalPage"));
		model.addAttribute("gameMap",StatusUtil.getMap("gameMap"));
		return "/gameType/gametype";
	}
	
	/**
	 * @Description: 游戏列表入口
	 * @Return Type:String
	 * @param name
	 * @param status
	 * @param pageNo
	 * @param model
	 * @return
	 */
	@RequestMapping("/manager/game")
	public String toGame(@ModelAttribute("name")String name,@ModelAttribute("typeId")String typeId,String pageNo,Model model) {
		Map<String, Object> map = gameService.listByConditionWithPage(name,typeId,pageNo);
		model.addAttribute("games",map.get("datalist"));
		model.addAttribute("name",name);
		model.addAttribute("typeId",typeId);
		model.addAttribute("pageNo",map.get("pageNo"));
		model.addAttribute("totalPage",map.get("totalPage"));
		model.addAttribute("gameMap",StatusUtil.getMap("gameMap"));
		return "/game/game";
	}

	/**
	 * 
	 * @Description: 兑换规则入口
	 * @Return Type:String
	 * @return
	 */
	@RequestMapping("/manager/exchange")
	public String toExchange(@ModelAttribute("provId")String provId,String pageNo,Model model) {
		Map<String, Object> map = exchangeService.listByConditionWithPage(provId,pageNo);
		model.addAttribute("exchanges",map.get("datalist"));
		model.addAttribute("provId",provId);
		model.addAttribute("pageNo",map.get("pageNo"));
		model.addAttribute("totalPage",map.get("totalPage"));
		model.addAttribute("gameMap",StatusUtil.getMap("gameMap"));
		return "/exchange/exchange";
	}
	
	@RequestMapping("/manager/card")
	public String toCard(@ModelAttribute("number")String number,@ModelAttribute("startTime")String startTime,@ModelAttribute("provId")String provId,@ModelAttribute("endTime")String endTime,String pageNo,Model model) {
		Map<String, Object> map = cardService.listByConditionWithPage(number,startTime,endTime,provId,pageNo);
		model.addAttribute("cards",map.get("datalist"));
		model.addAttribute("number",number);
		model.addAttribute("startTime",startTime);
		model.addAttribute("endTime",endTime);
		model.addAttribute("provId",provId);
		model.addAttribute("pageNo",map.get("pageNo"));
		model.addAttribute("totalPage",map.get("totalPage"));
		model.addAttribute("statusMap",StatusUtil.getMap("statusMap"));
		return "/card/card";
	}
}
