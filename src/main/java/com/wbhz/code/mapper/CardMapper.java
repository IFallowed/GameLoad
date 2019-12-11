/**
 * @Title:GameLoad/com.wbhz.code.mapper/CardMapper.java
 * @Description:
 */
package com.wbhz.code.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wbhz.code.domain.Card;

/**
 * @author kc
 * @Description: 密保卡持久层接口
 * @Date: 2019年12月8日上午2:18:54
 * @version: 1.0
 */
public interface CardMapper {

	/**
	 * @Description: 保存一张密保卡
	 * @Return Type:void
	 * @param card 
	 */
	void insert(Card card);

	/**
	 * 
	 * @Description: 条件查询
	 * @Return Type:List<User>
	 * @param number
	 * @param startTime
	 * @param endTime
	 * @param prov
	 * @return 
	 */
	List<Card> selectAllByCondition(@Param("number")String number, @Param("startTime")String startTime, @Param("endTime")String endTime, @Param("provId")Long prov);

	/**
	 * @Description: 查询指定的密保卡
	 * @Return Type:Card
	 * @param number
	 * @param prov
	 * @return
	 */
	Card getByNumber(@Param("number")String number,@Param("provId")Long prov);

	/**
	 * @Description: 更新密保卡的状态
	 * @Return Type:void
	 * @param card 
	 */
	void updateStatus(Card card);

}
