/**
 * @Title:GameLoad/com.wbhz.code.mapper/ExchangeMapper.java
 * @Description:
 */
package com.wbhz.code.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wbhz.code.domain.Exchange;

/**
 * @author kc
 * @Description: 兑换比例持久层接口
 * @Date: 2019年12月7日下午3:00:05
 * @version: 1.0
 */
public interface ExchangeMapper {

	/**
	 * @Description: 条件查询
	 * @Return Type:List<Exchange>
	 * @param provId
	 * @return 
	 */
	List<Exchange> selectAllByCondition(@Param("provId")Long provId);

	/**
	 * @Description: 删除选中的兑换比例
	 * @Return Type:void
	 * @param split 
	 */
	void delete(@Param("ids")String[] ids);

	/**
	 * @Description: 添加一个兑换比例
	 * @Return Type:void
	 * @param exchange 
	 */
	void insert(Exchange exchange);

	/**
	 * @Description: 查询指定的兑换比例
	 * @Return Type:Exchange
	 * @param id
	 * @return 
	 */
	Exchange selectById(Long id);

	/**
	 * @Description: 修改一条兑换比例
	 * @Return Type:void
	 * @param exchange 
	 */
	void update(Exchange exchange);



}
