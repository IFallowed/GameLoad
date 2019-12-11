/**
 * @Title:GameLoad/com.wbhz.code.service.impl/UserServiceImpl.java
 * @Description:
 */
package com.wbhz.code.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.wbhz.code.domain.Card;
import com.wbhz.code.domain.Expense;
import com.wbhz.code.domain.Prepaid;
import com.wbhz.code.domain.User;
import com.wbhz.code.exception.MyException;
import com.wbhz.code.mapper.CardMapper;
import com.wbhz.code.mapper.ExpenseMapper;
import com.wbhz.code.mapper.PrePaidMapper;
import com.wbhz.code.mapper.UserMapper;
import com.wbhz.code.service.UserService;
import com.wbhz.code.util.DateUtil;
import com.wbhz.code.util.UserContext;

/**
 * @author kc
 * @Description: 用户业务实现
 * @Date: 2019年12月4日上午9:57:45
 * @version: 1.0
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private CardMapper cardMapper;
	
	@Autowired
	private PrePaidMapper prepaidMapper;
	
	@Autowired
	private ExpenseMapper expenseMapper;
	/**
	 * @see com.wbhz.code.service.UserService#listByConditionWithPage(java.lang.String, java.lang.String)
	 * @param account
	 * @param mail
	 * @return
	 */
	@Override
	@Transactional(readOnly = true)
	public Map<String, Object> listByConditionWithPage(String account, String mail,String pageNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		int pageno = 1;
		//设置分页
		if(null != pageNo) {
			pageno = Integer.valueOf(pageNo);
		}
		Page<User> page = PageHelper.startPage(pageno, 5,true);
		List<User> users = userMapper.selectAllByCondition(account,mail);
		map.put("datalist",users);
		map.put("totalPage",page.getPages());
		map.put("pageNo",page.getPageNum());
		return map;
	}
	/**
	 * @see com.wbhz.code.service.UserService#updateStatus(java.lang.String, java.lang.String)
	 * @param ids
	 * @param status
	 */
	@Override
	public void updateStatus(String ids, String status) {
		
		userMapper.updateStatus(ids.split(","),status);
	}
	/**
	 * @see com.wbhz.code.service.UserService#login(java.lang.String, java.lang.String)
	 * @param account
	 * @param password
	 * @throws MyException 
	 */
	@Override
	public void login(String account, String password) throws MyException {
		User user = userMapper.selectByAccount(account);
		//验证用户名
		if(null != user) {
			//验证密码
			if(!password.equals(user.getPassword())) {
				throw new MyException("201");
			}
			//验证用户是否被禁用
			else if(!"10".equals(user.getStatus())) {
				throw new MyException(user.getStatus());
			}
			else {
				//将登录的账号信息存入Session
				UserContext.setCurrentUser(user);
			}
		}
		else {
			throw new MyException("202");
		}
	}
	/**
	 * @see com.wbhz.code.service.UserService#regist(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)
	 * @param account
	 * @param password
	 * @param validCode
	 * @param sex
	 * @param mail
	 * @param birth
	 * @throws MyException 
	 */
	@Override
	public void regist(String account, String password, String validCode, String sex, String mail, String birth) throws MyException {
		User user = userMapper.selectByAccount(account);
		//验证用户名
		if(null == user) {
			if(!validCode.equalsIgnoreCase(UserContext.getValiadCode())) {
				throw new MyException("203");
			}
			else {
				//保存新用户
				User newUser = new User();
				newUser.setAccount(account);
				newUser.setPassword(password);
				newUser.setSex(sex);
				newUser.setMail(mail);
				newUser.setBirth(DateUtil.parseStrToDate(birth, "yyyy-MM-dd HH:mm:ss"));
				newUser.setStatus("10");
				newUser.setCreateTime(new Date());
				userMapper.save(newUser);
				//将新用户存入Session中
				UserContext.setCurrentUser(newUser);
			}
		}
		else {
			throw new MyException("204");
		}
	}
	
	/**
	 * @see com.wbhz.code.service.UserService#chargeCard(java.lang.String, java.lang.String)
	 * @param number
	 * @param password
	 * @throws MyException 
	 */
	@Override
	public void chargeCard(String number, String password) throws MyException {
		Card card = cardMapper.getByNumber(number, null);
		//验证密保卡的存在性
		if(null != card) {
			//验证密码正确性
			if(!password.equals(card.getPassword())) {
				throw new MyException("201");
			}
			//检查此卡是否可以充值
			else if(!"10".equals(card.getStatus())) {
				throw new MyException(card.getStatus());
			}
			else {
				//设置此卡为生效状态
				card.setStatus("13");
				cardMapper.updateStatus(card);
				//为用户增加密保额度
				User user = UserContext.getCurrentUser();
				if(null != user.getAmount()) {
					user.setAmount(user.getAmount().add(card.getAmount()));
				}
				else{
					user.setAmount(card.getAmount());
				}
				//修改用户的账户余额
				userMapper.updateMoney(user);
				//向充值记录表内新增一条记录
				Prepaid prepaid = new Prepaid();
				prepaid.setUser(user);
				prepaid.setCard(card);
				prepaid.setCreateTime(new Date());
				prepaidMapper.insert(prepaid);
			}
		}
		else {
			throw new MyException("202");
		}
	}
	/**
	 * @see com.wbhz.code.service.UserService#getById(java.lang.Long)
	 * @param id
	 * @return
	 */
	@Override
	@Transactional(readOnly = true)
	public User getById(Long id) {
		return userMapper.selectById(id);
	}
	/**
	 * @see com.wbhz.code.service.UserService#updatePwd(com.wbhz.code.domain.User)
	 * @param user
	 */
	@Override
	public void updatePwd(User user) {
		userMapper.updatePwd(user);
	}
	/**
	 * @see com.wbhz.code.service.UserService#payGame(java.util.Map, java.lang.String, java.lang.String, java.lang.String)
	 * @param resultMap
	 * @param payType
	 * @param tariffe
	 * @param currency
	 */
	@Override
	public void downGame(Map<String, Object> resultMap, Long gameId, String payType, String tariffe, String currency) {
		//获取当前登录的用户
		User currentUser = UserContext.getCurrentUser();
		//查询该用户有没有对应的消费记录
		Expense expense = expenseMapper.selectByUserIdAndgameId(currentUser.getId(), gameId);
		if(null != expense) {
			//有记录,免费下载
			expense.setDownloads(expense.getDownloads() + 1);
			expense.setUpdateTime(new Date());
			expenseMapper.updateDownloads(expense);
			resultMap.put("code", "200");
		}
		else {
			//没有记录
			//扣费
			payGame(resultMap, gameId, payType, tariffe, currency);
		}
	}
	
	
	
	private void payGame(Map<String, Object> resultMap,Long gameId,String payType,String tariffe, String currency) {
		//获取当前登录的用户
		User currentUser = UserContext.getCurrentUser();
		if("30".equals(payType)) {
			//话费付款
			if( null != currentUser.getTariffe() && currentUser.getTariffe().compareTo(new BigDecimal(tariffe)) != -1) {
				//余额足够
				//用户扣话费
				currentUser.setTariffe(currentUser.getTariffe().subtract(new BigDecimal(tariffe)));;
				//预留兑换比例的操作
				tranferToCurrency(new BigDecimal(tariffe));
				//更新用户账户
				userMapper.updateMoney(currentUser);
				//生成新的消费
				Expense newExpense = new Expense(null,currentUser.getId(),gameId,new BigDecimal(tariffe),"31",new Date(),new Date(),1,"13");
				expenseMapper.insert(newExpense);
				resultMap.put("code", "200");
			}
			else {
				resultMap.put("code", "205");
				resultMap.put("msg", "话费余额不足");
			}
		}
		else if("31".equals(payType)){
			//游币付款
			if(null != currentUser.getAmount()) {
				//先检查密保额度
				if(currentUser.getAmount().compareTo(new BigDecimal(currency)) != -1) {
					//密保额度足够
					//用户扣密保额度
					currentUser.setAmount(currentUser.getAmount().subtract(new BigDecimal(currency)));
					//更新用户账户
					userMapper.updateMoney(currentUser);
					//生成新的消费
					Expense newExpense = new Expense(null,currentUser.getId(),gameId,new BigDecimal(currency),"31",new Date(),new Date(),1,"13");
					expenseMapper.insert(newExpense);
					resultMap.put("code", "200");
				}
				else {
					//密保额度不够
					BigDecimal remainCurrency = new BigDecimal(currency).subtract(currentUser.getAmount());
					currentUser.setAmount(new BigDecimal("0"));
					//还需要支付的额度
					if(null != currentUser.getCurrency() && currentUser.getCurrency().compareTo(remainCurrency) != -1) {
						//游币额度足够
						currentUser.setCurrency(currentUser.getCurrency().subtract(remainCurrency));
						//更新用户账户
						userMapper.updateMoney(currentUser);
						//生成新的消费
						Expense newExpense = new Expense(null,currentUser.getId(),gameId,new BigDecimal(currency),"31",new Date(),new Date(),1,"13");
						expenseMapper.insert(newExpense);
						resultMap.put("code", "200");
					}
					else {
						resultMap.put("code", "205");
						resultMap.put("msg", "游币余额不足");
					}
				}
			}
			else {
				//没有密保额度
				if(null != currentUser.getCurrency() && currentUser.getCurrency().compareTo(new BigDecimal(currency)) != -1) {
					//游币额度足够
					currentUser.setCurrency(currentUser.getCurrency().subtract(new BigDecimal(currency)));
					//更新用户账户
					userMapper.updateMoney(currentUser);
					//生成新的消费
					Expense newExpense = new Expense(null,currentUser.getId(),gameId,new BigDecimal(currency),"31",new Date(),new Date(),1,"13");
					expenseMapper.insert(newExpense);
				}
				else {
					resultMap.put("code", "205");
					resultMap.put("msg", "游币余额不足");
				}
			}
		}
	}
	
	private void tranferToCurrency(BigDecimal bigDecimal) {
		
	}
}