/**
 * @Title:GameLoad/com.wbhz.code.domain/Mobile.java
 * @Description:
 */
package com.wbhz.code.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author kc
 * @Description: 移动手机号段
 * @Date: 2019年12月2日下午3:31:30
 * @version: 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Mobile {
	private Long id;
	private String number;
	private String type;
	//维护关系
	private City city;
}
