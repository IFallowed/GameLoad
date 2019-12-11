/**
 * @Title:GameLoad/com.wbhz.code.service/CardService.java
 * @Description:
 */
package com.wbhz.code.service;

import java.util.List;
import java.util.Map;

import com.wbhz.code.domain.Province;

/**
 * @author kc
 * @Description: 密保卡业务接口
 * @Date: 2019年12月8日上午2:08:10
 * @version: 1.0
 */
public interface CardService {

	/**
	 * @Description: 条件查询加分页
	 * @Return Type:Map<String,Object>
	 * @param number
	 * @param startTime
	 * @param endTime
	 * @param provId
	 * @param pageNo
	 * @return 
	 */
	Map<String, Object> listByConditionWithPage(String number, String startTime, String endTime, String provId,
			String pageNo);

	/**
	 * @Description: 查询所有的省份
	 * @Return Type:List<Province>
	 * @return 
	 */
	List<Province> getAllProvinces();

	/**
	 * @Description: 保存一张密保卡
	 * @Return Type:void
	 * @param count
	 * @param amount
	 * @param proIds
	 * @param startTime
	 * @param endTime 
	 */
	void save(String count, String amount, String proIds, String startTime, String endTime);

}
