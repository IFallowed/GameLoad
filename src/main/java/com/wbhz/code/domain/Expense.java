/**
 * @Title:GameLoad/com.wbhz.code.domain/Expense.java
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
 * @Description: 购买游戏记录
 * @Date: 2019年12月2日下午3:07:46
 * @version: 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Expense {
	private Long id;
	private Long userId;
	private Long gameId;
	/*
	 * 消费金额
	 */
	private	BigDecimal monetary;
	private String operation;
	private Date createTime;
	private Date updateTime;
	private Integer downloads;
	private String status;
}
