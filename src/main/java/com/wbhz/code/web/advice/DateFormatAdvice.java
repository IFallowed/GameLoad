/**
 * @Title:GameLoad/com.wbhz.code.web.advice/DateFormatAdvice.java
 * @Description:
 */
package com.wbhz.code.web.advice;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;

/**
 * @author kc
 * @Description: 解析前端传入控制器的日期字符串
 * @Date: 2019年12月2日上午10:35:29
 * @version: 1.0
 */
@ControllerAdvice
public class DateFormatAdvice {

	@InitBinder
	private void initBindDateType(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}
}
