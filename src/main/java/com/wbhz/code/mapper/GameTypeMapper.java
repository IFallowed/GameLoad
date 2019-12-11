/**
 * @Title:GameLoad/com.wbhz.code.mapper/GameTypeMapper.java
 * @Description:
 */
package com.wbhz.code.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wbhz.code.domain.GameType;

/**
 * @author kc
 * @Description: 游戏类型持久层接口
 * @Date: 2019年12月5日上午9:22:04
 * @version: 1.0
 */
public interface GameTypeMapper {

	/**
	 * 
	 * @Description: 条件查询
	 * @Return Type:List<GameType>
	 * @param name
	 * @param status
	 * @return
	 */
	List<GameType> selectAllByCondition(@Param("name")String name, @Param("status")String status);

	/**
	 * @Description: 添加游戏类型
	 * @Return Type:void
	 * @param gt 
	 */
	void insert(GameType gt);

	/**
	 * @Description: 
	 * @Return Type:void
	 * @param split 
	 */
	void delete(@Param("ids")String[] ids);

	/**
	 * @Description: 查询指定的游戏类型
	 * @Return Type:GameType
	 * @param id
	 * @return 
	 */
	GameType selectById(Long id);

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
	 * @return 
	 */
	GameType selectByName(String name);

	/**
	 * @Description: 查询所有已有的游戏类型名称
	 * @Return Type:List<String>
	 * @return 
	 */
	List<Map<String, Object>> selectAllName();

}
