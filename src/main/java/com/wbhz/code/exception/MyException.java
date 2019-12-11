/**
 * @Title:GameLoad/com.wbhz.code.exception/MyException.java
 * @Description:
 */
package com.wbhz.code.exception;

import lombok.Getter;
import lombok.Setter;

/**
 * @author kc
 * @Description: 自定义异常
 * @Date: 2019年12月3日上午10:23:02
 * @version: 1.0
 */
@Setter
@Getter
public class MyException extends Exception{
	
	/**
	 * serialVersionUID：TODO
	 */
	private static final long serialVersionUID = 1L;
	private String code;
	/**
	 * 
	 */
	public MyException(String code) {
		super(code);
	}
	
	
}
