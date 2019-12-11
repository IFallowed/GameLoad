/**
 * @Title:GameLoad/com.wbhz.code.mapper/ProvinceMapper.java
 * @Description:
 */
package com.wbhz.code.mapper;

import java.util.List;

import com.wbhz.code.domain.Province;

/**
 * @author kc
 * @Description: 省份持久层接口
 * @Date: 2019年12月7日下午4:12:13
 * @version: 1.0
 */
public interface ProvinceMapper {

	/**
	 * @Description: 查询所有的省份
	 * @Return Type:List<Province>
	 * @return 
	 */
	List<Province> listAll();
	
	/**
	 * @Description: 查询未设置兑换规则的省份
	 * @Return Type:List<Province>
	 * @return 
	 */
	List<Province> selectProvinceWithOutExchange();

}
