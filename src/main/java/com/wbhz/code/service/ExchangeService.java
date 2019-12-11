/**
 * @Title:GameLoad/com.wbhz.code.service/ExchangeService.java
 * @Description:
 */
package com.wbhz.code.service;

import java.util.List;
import java.util.Map;

import com.wbhz.code.domain.Exchange;
import com.wbhz.code.domain.Province;

/**
 * @author kc
 * @Description: 兑换比例逻辑接口
 * @Date: 2019年12月7日下午2:57:24
 * @version: 1.0
 */
public interface ExchangeService {

	/**
	 * @Description: 条件查询加分页
	 * @Return Type:Map<String,Object>
	 * @param provId
	 * @param pageNo
	 * @return 
	 */
	Map<String, Object> listByConditionWithPage(String provId, String pageNo);

	/**
	 * @Description: 查询所有的省份
	 * @Return Type:List<Province>
	 * @return 
	 */
	List<Province> getAllProvinces();

	/**
	 * @Description: 查询未设置兑换规则的省份
	 * @Return Type:List<Province>
	 * @return 
	 */
	List<Province> getNoSaveExchange();

	/**
	 * @Description: 删除选中的兑换比例
	 * @Return Type:void
	 * @param ids 
	 */
	void delete(String ids);

	/**
	 * @Description: 保存兑换比例
	 * @Return Type:void
	 * @param exchange 
	 */
	void save(Exchange exchange);

	/**
	 * @Description: 查询指定的兑换比例
	 * @Return Type:Exchange
	 * @param id
	 * @return 
	 */
	Exchange getById(Long id);

	/**
	 * @Description: 修改一条兑换比例
	 * @Return Type:void
	 * @param exchange 
	 */
	void update(Exchange exchange);
	
}
