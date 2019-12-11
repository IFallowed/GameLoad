/**
 * @Title:GameLoad/com.wbhz.code.service.impl/ExchangeServiceImpl.java
 * @Description:
 */
package com.wbhz.code.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.wbhz.code.domain.Exchange;
import com.wbhz.code.domain.Province;
import com.wbhz.code.domain.User;
import com.wbhz.code.mapper.ExchangeMapper;
import com.wbhz.code.mapper.ProvinceMapper;
import com.wbhz.code.service.ExchangeService;

/**
 * @author kc
 * @Description: 兑换比例实现
 * @Date: 2019年12月7日下午2:58:10
 * @version: 1.0
 */
@Service("exchangeService")
@Transactional
public class ExchangeServiceImpl implements ExchangeService {

	@Autowired
	private ExchangeMapper exchangeMapper;
	
	@Autowired
	private ProvinceMapper provinceMapper;

	/**
	 * @see com.wbhz.code.service.ExchangeService#listByConditionWithPage(java.lang.String,
	 *      java.lang.String)
	 * @param provId
	 * @param pageNo
	 * @return
	 */
	@Override
	@Transactional(readOnly = true)
	public Map<String, Object> listByConditionWithPage(String provId, String pageNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		Long prov = null;
		//将省份id转换成Long
		if (null != provId && !"".equals(provId)) {
			prov = Long.valueOf(provId);
		}
		// 设置初始页
		int pageno = 1;
		if (null != pageNo) {
			pageno = Integer.valueOf(pageNo);
		}
		// 设置分页
		Page<User> page = PageHelper.startPage(pageno, 5, true);
		//条件查询
		map.put("datalist", exchangeMapper.selectAllByCondition(prov));
		map.put("totalPage", page.getPages());
		map.put("pageNo", page.getPageNum());
		return map;
	}

	/**
	 * @see com.wbhz.code.service.ExchangeService#getAllProvinces()
	 * @return
	 */
	@Override
	@Transactional(readOnly = true)
	public List<Province> getAllProvinces() {
		
		return provinceMapper.listAll();
	}

	/**
	 * @see com.wbhz.code.service.ExchangeService#gettNoSaveExchange()
	 * @return
	 */
	@Override
	@Transactional(readOnly = true)
	public List<Province> getNoSaveExchange() {
		//返回没有设置兑换比例的省份
		return provinceMapper.selectProvinceWithOutExchange();
	}

	/**
	 * @see com.wbhz.code.service.ExchangeService#delete(java.lang.String)
	 * @param ids
	 */
	@Override
	public void delete(String ids) {
		exchangeMapper.delete(ids.split(","));
	}

	/**
	 * @see com.wbhz.code.service.ExchangeService#save(com.wbhz.code.domain.Exchange)
	 * @param exchange
	 */
	@Override
	public void save(Exchange exchange) {
		exchange.setUpdateTime(new Date());
		exchange.setCreateTime(new Date());
		exchangeMapper.insert(exchange);
	}

	/**
	 * @see com.wbhz.code.service.ExchangeService#getById(java.lang.Long)
	 * @param id
	 * @return
	 */
	@Override
	@Transactional(readOnly = true)
	public Exchange getById(Long id) {
		return exchangeMapper.selectById(id);
	}

	/**
	 * @see com.wbhz.code.service.ExchangeService#update(com.wbhz.code.domain.Exchange)
	 * @param exchange
	 */
	@Override
	public void update(Exchange exchange) {
		exchange.setUpdateTime(new Date());
		exchangeMapper.update(exchange);
	}

}
