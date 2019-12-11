/**
 * @Title:GameLoad/com.wbhz.code.web.controller/MGameController.java
 * @Description:
 */
package com.wbhz.code.web.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wbhz.code.domain.Game;
import com.wbhz.code.service.GameService;
import com.wbhz.code.service.GameTypeService;
import com.wbhz.code.util.StatusUtil;

/**
 * @author kc
 * @Description: 后台游戏模块请求处理
 * @Date: 2019年12月6日上午10:33:06
 * @version: 1.0
 */
@Controller
@RequestMapping("/manager/game")
public class MGameController {
	
	@Autowired
	private GameTypeService gameTypeService;
	
	@Autowired
	private GameService gameService;

	@RequestMapping("/getAllTypes")
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
	
	/**
	 * @Description: 条件查询
	 * @Return Type:String
	 * @param name
	 * @param status
	 * @param ra
	 * @return
	 */
	@RequestMapping("/queryByCondition")
	public String queryByCondition(String name,String typeId,RedirectAttributes ra) {
		ra.addFlashAttribute("name", name);
		ra.addFlashAttribute("typeId", typeId);
		return "redirect:/manager/game";
	}
	
	/**
	 * @Description: 保存新的游戏
	 * @Return Type:String
	 * @param game
	 * @param coverfile
	 * @param screenfile
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(Game game,MultipartFile coverfile,MultipartFile[] screenfile) throws Exception {
		gameService.save(game,coverfile,screenfile);
		return "redirect:/manager/game";
	}
	
	/**
	 * @Description: 验证名称是否重复
	 * @Return Type:String
	 * @param name
	 * @return
	 */
	@RequestMapping("/checkName")
	@ResponseBody
	private String checkName(String name){
		Game game = gameService.getByName(name);
		if(null == game) {
			return "200";
		}
		else {
			return "201";
		}
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
		gameService.delete(ids);
		resultMap.put("code", "200");
		return resultMap;
	}
	
	/**
	 * @Description: 将游戏信息传到修改界面
	 * @Return Type:String
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/update")
	public String update(Long id,Model model) {
		if(null != id) {
			Game game = gameService.getById(id);
			String [] files = game.getScreen().split("\\|");
			model.addAttribute("game",game);
			model.addAttribute("screens",Arrays.asList(files));
		}
		return "/game/updateGame";
	}
	
	@RequestMapping("/toUpdate")
	public String toUpdate(Game game,MultipartFile coverfile,MultipartFile screenfile1,MultipartFile screenfile2,MultipartFile screenfile3) throws Exception {
		System.out.println("MGameController.toUpdate()");
		System.out.println(game);
		gameService.update(game,coverfile,screenfile1,screenfile2,screenfile3);
		return "redirect:/manager/game";
	}
	
	/**
	 * @Description: 将游戏信息传到详情界面
	 * @Return Type:String
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/detail")
	public String detail(Long id,Model model) {
		if(null != id) {
			Game game = gameService.getById(id);
			String [] files = game.getScreen().split("\\|");
			model.addAttribute("game",game);
			model.addAttribute("screens",Arrays.asList(files));
			model.addAttribute("gameMap",StatusUtil.getMap("gameMap"));
		}
		return "/game/gameDetails";
	}
}
