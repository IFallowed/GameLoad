/**
 * @Title:GameLoad/com.wbhz.code.domain/Exchange.java
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
 * @Description: 省份规则兑换
 * @Date: 2019年12月2日下午3:25:30
 * @version: 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Exchange {
	private Long id;
	private BigDecimal charge;
	private Date createTime;
	private Date updateTime;
	private String status;
	//维护关系
	private Province province;
}
