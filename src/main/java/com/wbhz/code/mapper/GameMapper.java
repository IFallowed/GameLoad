/**
 * @Title:GameLoad/com.wbhz.code.mapper/GameMapper.java
 * @Description:
 */
package com.wbhz.code.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wbhz.code.domain.Game;

/**
 * @author kc
 * @Description: 游戏持久层接口
 * @Date: 2019年12月6日上午9:17:14
 * @version: 1.0
 */
public interface GameMapper {

	/**
	 * @Description: 条件查询
	 * @Return Type:List<Game>
	 * @param name
	 * @param typeId
	 * @return 
	 */
	List<Game> selectAllByCondition(@Param("name")String name, @Param("typeId")Long typeId);

	/**
	 * @Description: 查询指定的游戏
	 * @Return Type:Game
	 * @param id
	 * @return 
	 */
	Game selectById(Long id);

	/**
	 * @Description: 查询指定的游戏
	 * @Return Type:Game
	 * @param name
	 * @return 
	 */
	Game selectByName(String name);

	/**
	 * @Description: 保存游戏
	 * @Return Type:void
	 * @param game 
	 */
	void save(Game game);

	/**
	 * @Description: 删除选中的游戏
	 * @Return Type:void
	 * @param split 
	 */
	void delete(@Param("ids")String[] ids);

	/**
	 * @Description: 修改游戏数据
	 * @Return Type:void
	 * @param game 
	 */
	void update(Game game);

}
