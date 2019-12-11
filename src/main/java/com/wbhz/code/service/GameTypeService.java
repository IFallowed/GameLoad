/**
 * @Title:GameLoad/com.wbhz.code.service/GameTypeService.java
 * @Description:
 */
package com.wbhz.code.service;

import java.util.List;
import java.util.Map;

import com.wbhz.code.domain.GameType;

/**
 * @author kc
 * @Description: 游戏类型业务逻辑接口
 * @Date: 2019年12月5日上午9:17:08
 * @version: 1.0
 */
public interface GameTypeService {

	/**
	 * @Description: 分页加条件查询
	 * @Return Type:Map<String,Object>
	 * @param name
	 * @param status
	 * @param pageNo
	 * @return 
	 */
	Map<String, Object> listByConditionWithPage(String name, String status, String pageNo);

	/**
	 * @Description: 保存游戏类型
	 * @Return Type:void
	 * @param gt
	 * @param fileName 
	 */
	void save(GameType gt, String fileName);

	/**
	 * @Description: 删除选中的游戏类型
	 * @Return Type:void
	 * @param ids 
	 */
	void delete(String ids);

	/**
	 * @Description: 查询指定的游戏类型
	 * @Return Type:GameType
	 * @param id
	 * @return 
	 */
	GameType getById(Long id);

	/**
	 * @Description: 修改指定的游戏类型
	 * @Return Type:void
	 * @param gt 
	 */
	void update(GameType gt);

	/**
	 * @Description: 查询指定的游戏类型
	 * @Return Type:GameType
	 * @param name 
	 */
	GameType getByName(String name);

	/**
	 * @Description: 返回所有已有的游戏类型名称
	 * @Return Type:List<Map<String,Object>>
	 * @return 
	 */
	List<Map<String, Object>> getAllName();

	
}
