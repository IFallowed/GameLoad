/**
 * @Title:GameLoad/com.wbhz.code.service.impl/ExpenseServiceImpl.java
 * @Description:
 */
package com.wbhz.code.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wbhz.code.mapper.ExpenseMapper;
import com.wbhz.code.service.ExpenseService;

/**
 * @author kc
 * @Description: 消费记录业务实现
 * @Date: 2019年12月10日上午10:53:30
 * @version: 1.0
 */
@Service("expenseService")
@Transactional
public class ExpenseServiceImpl implements ExpenseService{
	
	@Autowired
	private ExpenseMapper expenseMapper;

	/**
	 * @see com.wbhz.code.service.ExpenseService#listAll()
	 * @return
	 */
	@Override
	@Transactional(readOnly = true)
	public List<Map<String, Object>> listAll(Long id) {
		return expenseMapper.selectAll(id);
	}

	
}
