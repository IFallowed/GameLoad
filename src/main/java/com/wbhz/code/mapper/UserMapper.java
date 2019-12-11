/**
 * @Title:GameLoad/com.wbhz.code.mapper/UserMapper.java
 * @Description:
 */
package com.wbhz.code.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wbhz.code.domain.User;

/**
 * @author kc
 * @Description: 用户持久层接口
 * @Date: 2019年12月4日上午10:00:02
 * @version: 1.0
 */
public interface UserMapper {

	/**
	 * @Description: 条件查询
	 * @Return Type:List<User>
	 * @param account
	 * @param mail
	 * @return 
	 */
	List<User> selectAllByCondition(@Param("account")String account, @Param("mail")String mail);

	/**
	 * @Description: 更新用户的状态
	 * @Return Type:void
	 * @param split
	 * @param status 
	 */
	void updateStatus(@Param("ids")String[] ids, @Param("status")String status);

	/**
	 * @Description: 查询指定的用户
	 * @Return Type:User
	 * @param account
	 * @return 
	 */
	User selectByAccount(@Param("account")String account);

	/**
	 * @Description: 保存用户
	 * @Return Type:void
	 * @param newUser 
	 */
	void save(User newUser);

	/**
	 * @Description: 更新用户的账户余额
	 * @Return Type:void
	 * @param user 
	 */
	void updateMoney(User user);

	/**
	 * @Description: 查询指定的用户信息
	 * @Return Type:User
	 * @param id
	 * @return 
	 */
	User selectById(Long id);

	/**
	 * @Description: 修改用户密码
	 * @Return Type:void
	 * @param user 
	 */
	void updatePwd(User user);

}
