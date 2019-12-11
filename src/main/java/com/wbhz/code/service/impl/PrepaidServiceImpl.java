/**
 * @Title:GameLoad/com.wbhz.code.service.impl/PrepaidServiceImpl.java
 * @Description:
 */
package com.wbhz.code.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wbhz.code.domain.Prepaid;
import com.wbhz.code.mapper.PrePaidMapper;
import com.wbhz.code.service.PrepaidService;

/**
 * @author kc
 * @Description: 密保卡记录业务实现
 * @Date: 2019年12月9日下午5:26:19
 * @version: 1.0
 */
@Service("prepaidService")
@Transactional
public class PrepaidServiceImpl implements PrepaidService{

	@Autowired
	private PrePaidMapper prepaidMapper;
	/**
	 * @see com.wbhz.code.service.PrepaidService#getByUserId(java.lang.Long)
	 * @param id
	 * @return
	 */
	@Override
	public Prepaid getByUserIdInEffect(Long id) {
		return prepaidMapper.selectByUserIdInEffect(id,"13");
	}
}
