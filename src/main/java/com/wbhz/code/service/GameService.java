/**
 * @Title:GameLoad/com.wbhz.code.service/GameService.java
 * @Description:
 */
package com.wbhz.code.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.wbhz.code.domain.Game;

/**
 * @author kc
 * @Description: 游戏业务逻辑接口
 * @Date: 2019年12月6日上午9:12:25
 * @version: 1.0
 */
public interface GameService {

	/**
	 * @Description: 条件查询加分页查询
	 * @Return Type:Map<String,Object>
	 * @param name
	 * @param typeId
	 * @param pageNo
	 * @return 
	 */
	Map<String, Object> listByConditionWithPage(String name, String typeId, String pageNo);

	/**
	 * @Description: 查询指定的游戏
	 * @Return Type:Game
	 * @param id
	 * @return 
	 */
	Game getById(Long id);

	/**
	 * @Description: 查询指定的游戏
	 * @Return Type:Game
	 * @param name
	 * @return 
	 */
	Game getByName(String name);

	/**
	 * @Description: 保存一个新游戏
	 * @Return Type:void
	 * @param game
	 * @param coverfile
	 * @param screenfile 
	 * @throws Exception 
	 */
	void save(Game game, MultipartFile coverfile, MultipartFile[] screenfile) throws Exception;

	/**
	 * @Description: 删除选中的游戏
	 * @Return Type:void
	 * @param ids 
	 */
	void delete(String ids);

	/**
	 * @Description: 更新选中的游戏
	 * @Return Type:void
	 * @param game
	 * @param coverfile
	 * @param screenfile1
	 * @param screenfile2
	 * @param screenfile3 
	 * @throws Exception 
	 */
	void update(Game game, MultipartFile coverfile, MultipartFile screenfile1, MultipartFile screenfile2,
			MultipartFile screenfile3) throws Exception;
}
