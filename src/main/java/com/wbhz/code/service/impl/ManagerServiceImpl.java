/**
 * @Title:GameLoad/com.wbhz.code.service.impl/ManagerServiceImpl.java
 * @Description:
 */
package com.wbhz.code.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wbhz.code.domain.Manager;
import com.wbhz.code.exception.MyException;
import com.wbhz.code.mapper.ManagerMapper;
import com.wbhz.code.service.ManagerService;
import com.wbhz.code.util.UserContext;

/**
 * @author kc
 * @Description: 管理员业务实现
 * @Date: 2019年12月2日上午11:21:20
 * @version: 1.0
 */
@Service("managerService")
@Transactional
public class ManagerServiceImpl implements ManagerService{
	
	@Autowired
	private ManagerMapper managerMapper;

	/**
	 * @see com.wbhz.code.service.ManagerService#save(com.wbhz.code.domain.Manager)
	 * @param manager
	 */
	@Override
	public void save(Manager manager) {
		managerMapper.insert(manager);		
	}

	/**
	 * @see com.wbhz.code.service.ManagerService#update(com.wbhz.code.domain.Manager)
	 * @param manager
	 */
	@Override
	public void update(Manager manager) {
		managerMapper.updateById(manager);
	}

	/**
	 * @see com.wbhz.code.service.ManagerService#delete(java.lang.Long)
	 * @param id
	 */
	@Override
	public void delete(Long id) {
		managerMapper.deleteById(id);		
	}

	/**
	 * @see com.wbhz.code.service.ManagerService#get(java.lang.Long)
	 * @param id
	 * @return
	 */
	@Override
	@Transactional(readOnly = true)
	public Manager get(Long id) {
		return managerMapper.selectById(id);
	}

	/**
	 * @see com.wbhz.code.service.ManagerService#listAll()
	 * @return
	 */
	@Override
	@Transactional(readOnly = true)
	public List<Manager> listAll() {
		return managerMapper.selectAll();
	}

	/**
	 * @see com.wbhz.code.service.ManagerService#getByAccount(java.lang.String)
	 * @param account
	 * @return
	 * @throws MyException 
	 */
	@Override
	public void login(String account,String password,String validCode) throws MyException {
		Manager manager = managerMapper.selectByAccount(account);
		//验证用户名
		if(null != manager) {
			//验证密码
			if(!password.equals(manager.getPassword())) {
				throw new MyException("201");
			}
			//验证验证码
			else if(!validCode.equalsIgnoreCase(UserContext.getValiadCode())) {
				throw new MyException("203");
			}
			else {
				//将登录的账号信息存入Session
				UserContext.setCurrentManager(manager);
			}
		}
		else {
			throw new MyException("202");
		}
	}

}
