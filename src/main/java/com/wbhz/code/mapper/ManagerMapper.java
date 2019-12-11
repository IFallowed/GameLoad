/**
 * @Title:GameLoad/com.wbhz.code.mapper/ManagerMapper.java
 * @Description:
 */
package com.wbhz.code.mapper;

import java.util.List;

import com.wbhz.code.domain.Manager;

/**
 * @author kc
 * @Description: 管理员持久层接口
 * @Date: 2019年12月2日上午10:51:46
 * @version: 1.0
 */
public interface ManagerMapper {
	
	/**
	 * 
	 * @Description: 增加操作
	 * @Return Type:int
	 * @param manager
	 * @return
	 */
	int insert(Manager manager);
	
	/**
	 * 
	 * @Description: 修改操作
	 * @Return Type:int
	 * @param manager
	 * @return
	 */
	int updateById(Manager manager);
	
	/**
	 * 
	 * @Description: 删除操作
	 * @Return Type:int
	 * @param id
	 * @return
	 */
	int deleteById(Long id);
	
	/**
	 * 
	 * @Description: 单查询操作
	 * @Return Type:Manager
	 * @param id
	 * @return
	 */
	Manager selectById(Long id);
	
	/**
	 * 
	 * @Description: 多查询操作
	 * @Return Type:List<Manager>
	 * @return
	 */
	List<Manager> selectAll();

	/**
	 * @Description: 根据账号查询管理员
	 * @Return Type:Manager
	 * @param account
	 * @return 
	 */
	Manager selectByAccount(String account);
}
