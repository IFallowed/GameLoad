/**
 * @Title:GameLoad/com.wbhz.code.util/MailUtil.java
 * @Description:
 */
package com.wbhz.code.util;

import org.apache.commons.mail.HtmlEmail;

/**
 * @author kc
 * @Description: 发送邮箱验证码
 * @Date: 2019年12月2日下午5:28:40
 * @version: 1.0
 */
public class MailUtil {
	/*
	 * 验证码字符池
	 */
	private static final String [] strArr = {
			"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
			"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
			"0","1","2","3","4","5","6","7","8","9"
	};
	
	/**
	 * 
	 * @Description: 发送邮件验码
	 * @Return Type:String
	 * @param mail
	 * @return
	 */
	public static String sendMail(String mail) {
		try {
			HtmlEmail email = new HtmlEmail();
			email.setHostName("smtp.qq.com");
			email.setCharset("utf-8");
			email.addTo(mail);
			email.setFrom("1178885073@qq.com","kc");
			email.setAuthentication("1178885073@qq.com", "zepzhhnckayniced");
			email.setSubject("游币系统");
			String code = getValidateCode();
			email.setMsg(getMsg(code));
			UserContext.setValiadCode(code);
			email.send();
			return code;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 
	 * @Description: 获取验证码字符串
	 * @Return Type:String
	 * @return
	 */
	public static String getValidateCode() {
		StringBuffer sb = new StringBuffer();
		
		for (int i = 0; i < 6; i++) {
			sb.append(strArr[(int)(Math.random()*62)]);
		}
		return sb.toString();
	}
	
	/**
	 * 
	 * @Description: 以消息格式包装验证码
	 * @Return Type:String
	 * @param code
	 * @return
	 */
	private static String getMsg(String code) {
		StringBuffer sb = new StringBuffer();
		sb.append("您好，您的验证码为:\n\t");
		sb.append(code);
		sb.append("\n请保存好不要随意给他人，有效期为3分钟");
		return sb.toString();
	}
	
	
}
