/**
 * @Title:GameLoad/com.wbhz.code.web.controller/CardController.java
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

import com.wbhz.code.domain.Province;
import com.wbhz.code.service.CardService;

/**
 * @author kc
 * @Description: 
 * @Date: 2019年12月8日下午2:34:12
 * @version: 1.0
 */
@Controller
@RequestMapping("/manager/card")
public class CardController {
	
	@Autowired
	private CardService cardService;
	
	/**
	 * @Description: 条件查询加分页
	 * @Return Type:String
	 * @param number
	 * @param startTime
	 * @param endTime
	 * @param provId
	 * @param ra
	 * @return
	 */
	@RequestMapping("/queryByCondition")
	public String queryByCondition(String number,String startTime,String endTime,String provId,RedirectAttributes ra) {
		ra.addFlashAttribute("number",number);
		ra.addFlashAttribute("startTime",startTime);
		ra.addFlashAttribute("endTime",endTime);
		ra.addFlashAttribute("provId",provId);
		return "redirect:/manager/card";
	}
	
	@RequestMapping("/getAllProvinces")
	@ResponseBody
	public Map<String,Object> getAllProvinces(){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Province> provinces = cardService.getAllProvinces();
		if(null == provinces || provinces.size() == 0) {
			resultMap.put("code","202");
		}
		else {
			resultMap.put("code","200");
			resultMap.put("typeNames",provinces);
		}
		return resultMap;
	}

	@RequestMapping("/save")
	@ResponseBody
	public String save(String count,String proIds,String amount,String startTime,String endTime) {
		System.out.println("CardController.save()");
		System.out.println(proIds);
		cardService.save(count,amount,proIds,startTime,endTime);
		return "200";
	}
	
	@RequestMapping("/add")
	public String add() {
		return "card/addCard";
	}
}
