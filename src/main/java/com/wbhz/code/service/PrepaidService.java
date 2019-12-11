/**
 * @Title:GameLoad/com.wbhz.code.service/PrePaidService.java
 * @Description:
 */
package com.wbhz.code.service;

import com.wbhz.code.domain.Prepaid;

/**
 * @author kc
 * @Description: 密保卡业务接口
 * @Date: 2019年12月9日下午5:27:02
 * @version: 1.0
 */
public interface PrepaidService {

	/**
	 * @Description:  查询指定的充值记录
	 * @Return Type:Prepaid
	 * @param id
	 * @return 
	 */
	Prepaid getByUserIdInEffect(Long id);

}
