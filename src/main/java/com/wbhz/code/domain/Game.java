/**
 * @Title:GameLoad/com.wbhz.code.domain/Game.java
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
 * @Description: 
 * @Date: 2019年12月2日下午3:36:33
 * @version: 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Game {
	private Long id;
	private String name;
	private String status;
	private String cover;
	private String screen;
	private BigDecimal currency;
	private BigDecimal tariffe;
	private String developers;
	private String filing;
	private String detail;
	private String introduction;
	private Date createTime;
	private Date updateTime;
	//维护关系
	private GameType gameType;
}
