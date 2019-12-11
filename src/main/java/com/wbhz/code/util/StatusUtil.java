/**
 * @Title:GameLoad/com.wbhz.code.util/Status.java
 * @Description:
 */
package com.wbhz.code.util;

import java.util.HashMap;
import java.util.Map;

/**
 * @author kc
 * @Description: 状态码集合
 * @Date: 2019年12月2日下午2:50:13
 * @version: 1.0
 */
public class StatusUtil {
	
	private static final Map<String, String> statusMap = new HashMap<String, String>();
	private static final Map<String, String> gameMap = new HashMap<String, String>();
	private static final Map<String, String> sexMap = new HashMap<String, String>();
	private static final Map<String, String> operatorMap = new HashMap<String, String>();
	private static final Map<String, String> httpMap = new HashMap<String, String>();
	private static final Map<String, String> provinceMap = new HashMap<String, String>();
	
	
	
	static {
		sexMap.put("1", "男");
		sexMap.put("2", "女");
		
		statusMap.put("10", "可用");
		statusMap.put("11", "禁用");
		statusMap.put("12", "已使用");
		statusMap.put("13", "已生效");
		statusMap.put("14", "已过期");
		
		gameMap.put("20", "商用");
		gameMap.put("21", "下线");
		
		operatorMap.put("30", "话费购买");
		operatorMap.put("31", "游币购买");
		
		httpMap.put("201","密码错误");
		httpMap.put("202","账号不存在");
		httpMap.put("203","验证码错误");
		httpMap.put("204","账号已存在");
		
		provinceMap.put("11", "北京市");
		provinceMap.put("12", "天津市");
		provinceMap.put("13", "河北省");
		provinceMap.put("14", "山西省");
		provinceMap.put("15", "内蒙古自治区");
		provinceMap.put("21", "辽宁省");
		provinceMap.put("22", "吉林省");
		provinceMap.put("23", "黑龙江省");
		provinceMap.put("31", "上海市");
		provinceMap.put("32", "江苏省");
		provinceMap.put("33", "浙江省");
		provinceMap.put("34", "安徽省");
		provinceMap.put("35", "福建省");
		provinceMap.put("36", "江西省");
		provinceMap.put("37", "山东省");
		provinceMap.put("41", "河南省");
		provinceMap.put("42", "湖北省");
		provinceMap.put("43", "湖南省");
		provinceMap.put("44", "广东省");
		provinceMap.put("45", "广西自治区");
		provinceMap.put("46", "海南省");
		provinceMap.put("50", "重庆市");
		provinceMap.put("51", "四川省");
		provinceMap.put("52", "贵州省");
		provinceMap.put("53", "云南省");
		provinceMap.put("54", "西藏自治区");
		provinceMap.put("61", "陕西省");
		provinceMap.put("62", "甘肃省");
		provinceMap.put("63", "青海省");
		provinceMap.put("64", "宁夏自治区");
		provinceMap.put("65", "新疆自治区");
	}
	
	/**
	 * 
	 * @Description: 获取对应集合的状态码
	 * @Return Type:String
	 * @param mapName
	 * @param key
	 * @return
	 */
	public static String getCodeMsg(String mapName,String key) {
		return getMap(mapName).get(key);
	}
	
	/**
	 * 
	 * @Description: 解析需要的集合
	 * @Return Type:Map<String,String>
	 * @param mapName
	 * @return
	 */
	public static Map<String, String> getMap(String mapName){
		switch (mapName) {
		case "statusMap":
			return statusMap;
		case "gameMap":
			return gameMap;
		case "sexMap":
			return sexMap;
		case "operatorMap":
			return operatorMap;	
		case "httpMap":
			return httpMap;	
		default:
			return null;
		}
	}
}
