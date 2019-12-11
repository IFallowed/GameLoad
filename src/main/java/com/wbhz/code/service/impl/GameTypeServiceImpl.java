/**
 * @Title:GameLoad/com.wbhz.code.service.impl/GameTypeServiceImpl.java
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
import com.wbhz.code.domain.GameType;
import com.wbhz.code.domain.User;
import com.wbhz.code.mapper.GameTypeMapper;
import com.wbhz.code.service.GameTypeService;

/**
 * @author kc
 * @Description:游戏类型业务实现 
 * @Date: 2019年12月5日上午9:18:02
 * @version: 1.0
 */
@Service("gameTypeService")
@Transactional
public class GameTypeServiceImpl implements GameTypeService {
	
	@Autowired
	private GameTypeMapper gameTypeMapper;

	/**
	 * @see com.wbhz.code.service.GameTypeService#listByConditionWithPage(java.lang.String, java.lang.String, java.lang.String)
	 * @param name
	 * @param status
	 * @param pageNo
	 * @return
	 */
	@Override
	@Transactional(readOnly = true)
	public Map<String, Object> listByConditionWithPage(String name, String status, String pageNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		//设置初始页
		int pageno = 1;
		if(null != pageNo) {
			pageno = Integer.valueOf(pageNo);
		}
		//设置分页
		Page<User> page = PageHelper.startPage(pageno, 5,true);
		map.put("datalist",gameTypeMapper.selectAllByCondition(name,status));
		map.put("totalPage",page.getPages());
		map.put("pageNo",page.getPageNum());
		return map;
	}

	/**
	 * @see com.wbhz.code.service.GameTypeService#save(com.wbhz.code.domain.GameType, java.lang.String)
	 * @param gt
	 * @param fileName
	 */
	@Override
	public void save(GameType gt, String fileName) {
		gt.setCreateTime(new Date());
		gt.setUpdateTime(new Date());
		gt.setPicture(fileName);
		
		gameTypeMapper.insert(gt);
	}

	/**
	 * @see com.wbhz.code.service.GameTypeService#delete(java.lang.String)
	 * @param ids
	 */
	@Override
	public void delete(String ids) {
		gameTypeMapper.delete(ids.split(","));
	}

	/**
	 * @see com.wbhz.code.service.GameTypeService#getById(java.lang.Long)
	 * @param id
	 * @return
	 */
	@Override
	@Transactional(readOnly = true)
	public GameType getById(Long id) {
		return gameTypeMapper.selectById(id);
	}

	/**
	 * @see com.wbhz.code.service.GameTypeService#update(com.wbhz.code.domain.GameType)
	 * @param gt
	 */
	@Override
	public void update(GameType gt) {
		//更新修改的日期
		gt.setUpdateTime(new Date());
		gameTypeMapper.update(gt);
	}

	/**
	 * @see com.wbhz.code.service.GameTypeService#getByName(java.lang.String)
	 * @param name
	 */
	@Override
	@Transactional(readOnly = true)
	public GameType getByName(String name) {
		return gameTypeMapper.selectByName(name);
	}

	/**
	 * @see com.wbhz.code.service.GameTypeService#getAllName()
	 * @return
	 */
	@Override
	@Transactional(readOnly = true)
	public List<Map<String, Object>> getAllName() {
		return gameTypeMapper.selectAllName();
	}

}
