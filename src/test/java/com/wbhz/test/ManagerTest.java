/**
 * @Title:GameLoad/com.wbhz.test/ManagerTest.java
 * @Description:
 */
package com.wbhz.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wbhz.code.service.ManagerService;

/**
 * @author kc
 * @Description: 
 * @Date: 2019年12月2日上午10:59:19
 * @version: 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:mvc.xml")
public class ManagerTest {
	
	@Autowired
	private ManagerService managerService;
	
	@Test
	public void testManager() throws Exception {
		//managerService.save(new Manager(null,"aaa","aaa","12345678987",new Date()));
		managerService.listAll().forEach(System.out::println);
	}
	
}
