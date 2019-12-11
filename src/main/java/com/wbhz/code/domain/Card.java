/**
 * @Title:GameLoad/com.wbhz.code.domain/Card.java
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
 * @Description: 密保卡
 * @Date: 2019年12月2日下午3:13:14
 * @version: 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Card {
	private Long id;
	private String number;
	private String password;
	//密保卡余额
	private BigDecimal amount;
	private Date startTime;
	private Date endTime;
	private String status;
	private Date createTime;
	//关系维护--provId
	private Province province;
}
