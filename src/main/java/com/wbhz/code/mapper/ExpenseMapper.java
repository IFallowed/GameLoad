/**
 * @Title:GameLoad/com.wbhz.code.mapper/ExpenseMapper.java
 * @Description:
 */
package com.wbhz.code.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wbhz.code.domain.Expense;

/**
 * @author kc
 * @Description: 消费记录持久层接口
 * @Date: 2019年12月10日上午10:56:45
 * @version: 1.0
 */
public interface ExpenseMapper {

	/**
	 * @Description: 查询指定的消费记录
	 * @Return Type:Expense
	 * @param userId
	 * @param gameId
	 * @return 
	 */
	Expense selectByUserIdAndgameId(@Param("userId")Long userId, @Param("gameId")Long gameId);

	/**
	 * @Description: 添加新的消费记录
	 * @Return Type:void
	 * @param newExpense 
	 */
	void insert(Expense newExpense);

	/**
	 * @Description: 更新下载次数
	 * @Return Type:void
	 * @param expense 
	 */
	void updateDownloads(Expense expense);

	/**
	 * @Description: 查询指定用户的所有id
	 * @Return Type:List<Map<String, Object>>
	 * @param id
	 * @return 
	 */
	List<Map<String, Object>> selectAll(@Param("userId")Long id);


}
