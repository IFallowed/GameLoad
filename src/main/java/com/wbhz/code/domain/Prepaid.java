/**
 * @Title:GameLoad/com.wbhz.code.domain/Prepaid.java
 * @Description:
 */
package com.wbhz.code.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author kc
 * @Description: 充值密保卡记录
 * @Date: 2019年12月2日下午3:12:05
 * @version: 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Prepaid {
	private Long id;
	private User user;
	private Card card;
	private Date createTime;
}
