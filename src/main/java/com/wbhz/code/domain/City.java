/**
 * @Title:GameLoad/com.wbhz.code.domain/City.java
 * @Description:
 */
package com.wbhz.code.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author kc
 * @Description: 城市实体
 * @Date: 2019年12月2日下午3:18:30
 * @version: 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class City {
	private Long id;
	private String name;
	private String areaCode;
	private	String postCode;
	//维护关系
	private Province province;
}
