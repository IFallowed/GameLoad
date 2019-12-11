/**
 * @Title:GameLoad/com.wbhz.code.web.controller/MGameTypeController.java
 * @Description:
 */
package com.wbhz.code.web.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import com.wbhz.code.domain.GameType;
import com.wbhz.code.service.GameTypeService;

/**
 * @author kc
 * @Description: 游戏类型模块的请求
 * @Date: 2019年12月5日上午11:07:22
 * @version: 1.0
 */
@Controller
@RequestMapping("/manager/gametype")
public class MGameTypeController {
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private GameTypeService gameTypeService;

	/**
	 * @Description: 条件查询
	 * @Return Type:String
	 * @param name
	 * @param status
	 * @param ra
	 * @return
	 */
	@RequestMapping("/queryByCondition")
	public String queryByCondition(String name,String status,RedirectAttributes ra) {
		ra.addFlashAttribute("name", name);
		ra.addFlashAttribute("status", status);
		return "redirect:/manager/gametype";
	}
	
	/**
	 * 
	 * @Description: 保存一个新的游戏类型
	 * @Return Type:String
	 * @param gt
	 * @param pic
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(GameType gt,MultipartFile pic) throws Exception {
		System.out.println("MGameTypeController.save()");
		System.out.println(gt);
		String fileName = "";
		if(pic != null && !pic.isEmpty()) {
			fileName = pic.getOriginalFilename();
			String saveDir = servletContext.getRealPath("/images/cover");
			Path path = Paths.get(saveDir,fileName);
			System.out.println(path);
			if(!path.toFile().exists()) {
				Files.copy(pic.getInputStream(),path);
			}
		}
		gameTypeService.save(gt,fileName);
		return "redirect:/manager/gametype";
	}
	/**
	 * 
	 * @Description: 删除选中的游戏类型
	 * @Return Type:Map<String,Object>
	 * @param ids
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	private Map<String, Object> delete(String ids){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			gameTypeService.delete(ids);
			resultMap.put("code", "200");
		} catch (Exception e) {
			if(e.getCause() instanceof MySQLIntegrityConstraintViolationException) {
				resultMap.put("code", "201");
			}
		}
		return resultMap;
	}
	
	/**
	 * @Description: 将游戏类型信息传到修改界面
	 * @Return Type:String
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/update")
	private String update(Long id,Model model){
		GameType gt = gameTypeService.getById(id);
		model.addAttribute("gameType",gt);
		return "/gameType/updateGameType";
	}
	
	/**
	 * @Description: 修改游戏类型
	 * @Return Type:String
	 * @param gt
	 * @return
	 */
	@RequestMapping("/toUpdate")
	private String toUpdate(GameType gt){
		gameTypeService.update(gt);
		return "redirect:/manager/gametype";
	}
	
	/**
	 * 
	 * @Description: 验证名称是否重复
	 * @Return Type:String
	 * @param name
	 * @return
	 */
	@RequestMapping("/checkName")
	@ResponseBody
	private String checkName(String name){
		GameType gt = gameTypeService.getByName(name);
		if(null == gt) {
			return "200";
		}
		else {
			return "201";
		}
	}
	
}
