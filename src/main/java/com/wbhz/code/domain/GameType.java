/**
 * @Title:GameLoad/com.wbhz.code.domain/GameType.java
 * @Description:
 */
package com.wbhz.code.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author kc
 * @Description: 游戏类型
 * @Date: 2019年12月2日下午3:34:56
 * @version: 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class GameType {
	private Long id;
	private String name;
	private String status;
	//封面
	private String picture;
	private Date createTime;
	private Date updateTime;
}
