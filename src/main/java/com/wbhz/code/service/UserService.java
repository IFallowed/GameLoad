/**
 * @Title:GameLoad/com.wbhz.code.service/UserService.java
 * @Description:
 */
package com.wbhz.code.service;

import java.util.Map;

import com.wbhz.code.domain.User;
import com.wbhz.code.exception.MyException;


/**
 * @author kc
 * @Description: 用户业务逻辑接口
 * @Date: 2019年12月4日上午9:57:08
 * @version: 1.0
 */
public interface UserService {
	
	/**
	 * 
	 * @Description: 分页加条件查询
	 * @Return Type:Map<String,Object>
	 * @param account
	 * @param mail
	 * @param pageNo
	 * @return
	 */
	Map<String, Object> listByConditionWithPage(String account,String mail,String pageNo);

	/**
	 * @Description: 更新用户状态
	 * @Return Type:void
	 * @param ids
	 * @param status 
	 */
	void updateStatus(String ids, String status);

	/**
	 * @Description: 用户登录请求
	 * @Return Type:void
	 * @param account
	 * @param password 
	 * @throws MyException 
	 */
	void login(String account, String password) throws MyException;

	/**
	 * @Description: 用户注册请求
	 * @Return Type:void
	 * @param account
	 * @param password
	 * @param validCode
	 * @param sex
	 * @param mail
	 * @param birth 
	 * @throws MyException 
	 */
	void regist(String account, String password, String validCode, String sex, String mail, String birth) throws MyException;

	/**
	 * @Description: 密保卡充值
	 * @Return Type:void
	 * @param number
	 * @param password 
	 * @throws MyException 
	 */
	void chargeCard(String number, String password) throws MyException;

	/**
	 * @Description: 查询指定的用户信息
	 * @Return Type:User
	 * @param id
	 * @return 
	 */
	User getById(Long id);

	/**
	 * @Description: 修改密码
	 * @Return Type:void
	 * @param currentUser 
	 */
	void updatePwd(User user);

	/**
	 * @Description: 下载游戏
	 * @Return Type:void
	 * @param resultMap
	 * @param gameId
	 * @param payType
	 * @param tariffe
	 * @param currency 
	 */
	void downGame(Map<String, Object> resultMap, Long gameId, String payType, String tariffe, String currency);
}
