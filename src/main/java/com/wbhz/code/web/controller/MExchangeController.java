/**
 * @Title:GameLoad/com.wbhz.code.web.controller/MExchangeController.java
 * @Description:
 */
package com.wbhz.code.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wbhz.code.domain.Exchange;
import com.wbhz.code.domain.Province;
import com.wbhz.code.service.ExchangeService;

/**
 * @author kc
 * @Description: 后台兑换比例模块请求处理
 * @Date: 2019年12月7日下午3:36:05
 * @version: 1.0
 */
@Controller
@RequestMapping("/manager/exchange")
public class MExchangeController {
	
	@Autowired
	private ExchangeService exchangeService;
	
	/**
	 * @Description: 条件查询加分页
	 * @Return Type:String
	 * @param provId
	 * @param ra
	 * @return
	 */
	@RequestMapping("/queryByCondition")
	public String  queryByCondition(String provId,RedirectAttributes ra) {
		ra.addFlashAttribute("provId", provId);
		return "redirect:/manager/exchange";
	}
	
	/**
	 * @Description: 返回所有的省份，填充下拉框
	 * @Return Type:Map<String,Object>
	 * @return
	 */
	@RequestMapping("/getAllProvinces")
	@ResponseBody
	public Map<String,Object> getAllProvinces(){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Province> provinces = exchangeService.getAllProvinces();
		if(null == provinces || provinces.size() == 0) {
			resultMap.put("code","202");
		}
		else {
			resultMap.put("code","200");
			resultMap.put("typeNames",provinces);
		}
		return resultMap;
	}
	
	/**
	 * @Description: 返回未设置兑换规则的省份，填充下拉框
	 * @Return Type:Map<String,Object>
	 * @return
	 */
	@RequestMapping("/getNoSaveExchange")
	@ResponseBody
	public Map<String,Object> getNoSaveExchange(){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Province> provinces = exchangeService.getNoSaveExchange();
		if(null == provinces || provinces.size() == 0) {
			resultMap.put("code","202");
		}
		else {
			resultMap.put("code","200");
			resultMap.put("typeNames",provinces);
		}
		return resultMap;
	}
	
	/**
	 * @Description: 删除选中的游戏
	 * @Return Type:Map<String,Object>
	 * @param ids
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	private Map<String, Object> delete(String ids){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		exchangeService.delete(ids);
		resultMap.put("code", "200");
		return resultMap;
	}
	
	/**
	 * 
	 * @Description:添加一条新的兑换比例
	 * @Return Type:String
	 * @param exchange
	 * @return
	 */
	@RequestMapping("/save")
	public String save(Exchange exchange) {
		exchangeService.save(exchange);
		return "redirect:/manager/exchange";
	}
	
	@RequestMapping("/update")
	public String update(Long id,Model model) {
		if(null != id) {
			Exchange exchange = exchangeService.getById(id);
			model.addAttribute("exchange",exchange);
		}
		return "/exchange/updateExchange";
	}
	
	/**
	 * 
	 * @Description:修改一条兑换比例
	 * @Return Type:String
	 * @param exchange
	 * @return
	 */
	@RequestMapping("/toUpdate")
	public String toUpdate(Exchange exchange) {
		exchangeService.update(exchange);
		return "redirect:/manager/exchange";
	}
}
