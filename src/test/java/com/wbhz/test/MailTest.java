/**
 * @Title:GameLoad/com.wbhz.test/MailTest.java
 * @Description:
 */
package com.wbhz.test;

import org.junit.Test;

import com.wbhz.code.util.MailUtil;

/**
 * @author kc
 * @Description: 
 * @Date: 2019年12月2日下午6:57:24
 * @version: 1.0
 */
public class MailTest {

	@Test
	public void testMail() throws Exception {
		MailUtil.sendMail("1639782681@qq.com");
	}
	
	@Test
	public void test1() throws Exception {
		String article = "t01388d8bbf164ae3b8.jpg|t01388d8bbf164ae3b8.jpg|t01388d8bbf164ae3b8.jpg";
		System.out.println(article);
		article = article.replace(article.substring(0, article.indexOf("|")), "ime.jpg");
		System.out.println(article);
	}
}
