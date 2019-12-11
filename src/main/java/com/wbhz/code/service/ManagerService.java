/**
 * @Title:GameLoad/com.wbhz.code.service/ManagerService.java
 * @Description:
 */
package com.wbhz.code.service;

import java.util.List;

import com.wbhz.code.domain.Manager;
import com.wbhz.code.exception.MyException;

/**
 * @author kc
 * @Description: 管理员业务逻辑接口
 * @Date: 2019年12月2日上午11:17:50
 * @version: 1.0
 */
public interface ManagerService {
	
	/**
	 * 
	 * @Description: 保存功能
	 * @Return Type:void
	 * @param manager
	 */
	void save(Manager manager);
	
	/**
	 * 
	 * @Description: 修改功能
	 * @Return Type:void
	 * @param manager
	 */
	void update(Manager manager);
	
	/**
	 * 
	 * @Description: 删除功能
	 * @Return Type:void
	 * @param id
	 */
	void delete(Long id);
	
	/**
	 * 
	 * @Description: 单查询功能
	 * @Return Type:User
	 * @param id
	 * @return
	 */
	Manager get(Long id);
	
	/**
	 * 
	 * @Description: 多查询功能
	 * @Return Type:List<Manager>
	 * @return
	 */
	List<Manager> listAll();

	/**
	 * @Description: 登录功能
	 * @Return Type:void
	 * @param account
	 * @param password
	 * @param validCode 
	 * @throws MyException 
	 */
	void login(String account, String password, String validCode) throws MyException;
}
