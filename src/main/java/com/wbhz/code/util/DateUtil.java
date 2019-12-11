package com.wbhz.code.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static String parseDateToStr(Date date,String pattern){
		if(null != date){
			SimpleDateFormat sdf = new SimpleDateFormat(pattern);
			return sdf.format(date);
		}else {
			return null;
		}
	}
	
	public static Date parseStrToDate(String dateStr,String pattern){
		Date date = null;
		if(!dateStr.contains(":")) {
			dateStr = dateStr.trim() + " 00:00:00";
		}
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		if(null != dateStr){
			try {
				date = sdf.parse(dateStr);
			} catch (ParseException e) {
				System.out.println("日期格式错误");
			}
		}
		return date; 
	}
	
	public static String timeDelay(Date date,String pattern) {
		long dateTime = date.getTime();
		long nowTime = System.currentTimeMillis();
		double timeDelay = nowTime - dateTime;
		double time;
		String str = null;
		if(timeDelay < 60*1000) {
			 time = Math.floor(timeDelay / 1000);
			 str = String.valueOf(time).substring(0,String.valueOf(time).indexOf(".")) +"秒前";
		}
		else if(timeDelay < 60*1000*60) {
			time = Math.floor(timeDelay / 60000);
			str = String.valueOf(time).substring(0,String.valueOf(time).indexOf(".")) + "分钟前";
		}
		else if(timeDelay < 60*1000*60*24) {
			time = Math.floor(timeDelay / (60*1000*60));
			str = String.valueOf(time).substring(0,String.valueOf(time).indexOf(".")) + "小时前";
		}
		else if(timeDelay < 60*1000*60*24*30) {
			time = Math.floor(timeDelay / (60*1000*60*24));
			str = String.valueOf(time).substring(0,String.valueOf(time).indexOf(".")) + "天前";
		}
		else if(timeDelay < 60*1000*60*24*30*12){
			time = Math.floor(timeDelay / (60*1000*60*24*30));
			str = String.valueOf(time).substring(0,String.valueOf(time).indexOf(".")) + "个月前";
		}
		else {
			time = Math.floor(timeDelay / (60*1000*60*24*30*12));
			str = String.valueOf(time).substring(0,String.valueOf(time).indexOf(".")) + "年前";
		}
		return str;
	}
	
	public static String timeDelay(String dateStr,String pattern) {
		Date date = parseStrToDate(dateStr, pattern);
		return timeDelay(date, pattern);
	}
}
