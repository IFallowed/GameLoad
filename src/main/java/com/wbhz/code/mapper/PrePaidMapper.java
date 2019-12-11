/**
 * @Title:GameLoad/com.wbhz.code.mapper/PrePaidMapper.java
 * @Description:
 */
package com.wbhz.code.mapper;

import org.apache.ibatis.annotations.Param;

import com.wbhz.code.domain.Prepaid;

/**
 * @author kc
 * @Description: 密保卡充值记录持久层接口
 * @Date: 2019年12月9日下午4:55:03
 * @version: 1.0
 */
public interface PrePaidMapper {

	/**
	 * @Description: 保存密保卡充值记录
	 * @Return Type:void
	 * @param prepaid 
	 */
	void insert(Prepaid prepaid);

	/**
	 * @Description: 查询指定的充值记录
	 * @Return Type:Prepaid
	 * @param id
	 * @return 
	 */
	Prepaid selectByUserIdInEffect(@Param("id")Long id,@Param("status")String status);

}
