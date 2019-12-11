/**
 * @Title:GameLoad/com.wbhz.code.domain/Manager.java
 * @Description:
 */
package com.wbhz.code.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author kc
 * @Description: 管理员实体
 * @Date: 2019年12月2日上午10:31:47
 * @version: 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Manager {
	
	private Long id;
	private String account;
	private String password;
	private String mail;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date createTime;
}
