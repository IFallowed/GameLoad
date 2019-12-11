/**
 * @Title:GameLoad/com.wbhz.code.service/ExpenseService.java
 * @Description:
 */
package com.wbhz.code.service;

import java.util.List;
import java.util.Map;


/**
 * @author kc
 * @Description: 消费记录业务接口
 * @Date: 2019年12月10日上午10:52:58
 * @version: 1.0
 */
public interface ExpenseService {

	/**
	 * @Description: 查询指定用户的所有消费记录
	 * @Return Type:List<Map<String, Object>>
	 * @param id
	 * @return 
	 */
	List<Map<String, Object>> listAll(Long id);

}
