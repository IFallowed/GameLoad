/**
 * @Title:GameLoad/com.wbhz.code.domain/User.java
 * @Description:
 */
package com.wbhz.code.domain;

import java.math.BigDecimal;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author kc
 * @Description: 用户实体
 * @Date: 2019年12月2日下午2:31:47
 * @version: 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
	
	private Long id;
	private String account;
	private String password;
	private Date birth;
	private String mail;
	/*
	 * 话费余额
	 */
	private BigDecimal tariffe;
	/*
	 * 游币余额
	 */
	private BigDecimal currency;
	/*
	 * 密保卡余额
	 */
	private BigDecimal amount;
	private String sex;
	private String status;
	private Date createTime;
}
