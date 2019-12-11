/**
 * @Title:GameLoad/com.wbhz.code.service.impl/CardServiceImpl.java
 * @Description:
 */
package com.wbhz.code.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.wbhz.code.domain.Card;
import com.wbhz.code.domain.Province;
import com.wbhz.code.domain.User;
import com.wbhz.code.mapper.CardMapper;
import com.wbhz.code.mapper.ProvinceMapper;
import com.wbhz.code.service.CardService;
import com.wbhz.code.util.DateUtil;

/**
 * @author kc
 * @Description: 密保卡逻辑实现
 * @Date: 2019年12月8日上午2:08:29
 * @version: 1.0
 */
@Service("CardService")
@Transactional
public class CardServiceImpl implements CardService {
	
	@Autowired
	private CardMapper cardMapper;
	
	@Autowired
	private ProvinceMapper provinceMapper;
	/**
	 * @see com.wbhz.code.service.CardService#listByConditionWithPage(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)
	 * @param number
	 * @param startTime
	 * @param endTime
	 * @param provId
	 * @param pageNo
	 * @return
	 */
	@Override
	@Transactional(readOnly = true)
	public Map<String, Object> listByConditionWithPage(String number, String startTime, String endTime, String provId,
			String pageNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		//将省份id转换成Long
		Long prov = null;
		if(null != provId && !"".equals(provId)) {
			prov = Long.valueOf(provId);
		}
		//设置初始页
		int pageno = 1;
		if(null != pageNo) {
			pageno = Integer.valueOf(pageNo);
		}
		//设置分页
		Page<User> page = PageHelper.startPage(pageno, 5,true);
		//条件查询
		map.put("datalist",cardMapper.selectAllByCondition(number,startTime,endTime,prov));
		map.put("totalPage",page.getPages());
		map.put("pageNo",page.getPageNum());
		return map;
	
	}

	/**
	 * @see com.wbhz.code.service.CardService#getAllProvinces()
	 * @return
	 */
	@Override
	@Transactional(readOnly = true)
	public List<Province> getAllProvinces() {
		return provinceMapper.listAll();
	}

	/**
	 * @see com.wbhz.code.service.CardService#save(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)
	 * @param count
	 * @param amount
	 * @param proIds
	 * @param startTime
	 * @param endTime
	 */
	@Override
	public void save(String count, String amount, String proIds, String startTime, String endTime) {
		//字符池
		String [] strArr = {
				"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
				"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
				"0","1","2","3","4","5","6","7","8","9"};
		//检查省份id集合
		if(null != proIds && "" != proIds) {
			String [] ids = proIds.trim().split(",");
			//遍历省份id
			for (int i = 0; i < ids.length; i++) {
				//每个省份需要生成的密保卡数量
				for (int j = 0; j < Integer.valueOf(count); j++) {
					Card card = new Card();
					//生成密保卡账号
					StringBuffer sb = null;
					do {
						sb = new StringBuffer();
						for (int k = 0; k < 20; k++) {
							sb.append(strArr[(int)(Math.random()*62)]);
						}
						//验证新生成的账号的存在性
					}while(null != cardMapper.getByNumber(sb.toString(),Long.valueOf(ids[i])));
					card.setNumber(sb.toString());
					//生成此卡的密码
					sb = new StringBuffer();
					for (int l = 0; l < 6; l++) {
						sb.append(strArr[(int)(Math.random()*62)]);
					}
					card.setPassword(sb.toString());
					//设置此卡的额度
					card.setAmount(new BigDecimal(amount));
					Province province = new Province();
					//填入关联省份
					province.setId(Long.valueOf(ids[i]));
					card.setProvince(province);
					card.setStartTime(DateUtil.parseStrToDate(startTime, "yyyy-MM-dd HH:mm:ss"));
					card.setEndTime(DateUtil.parseStrToDate(endTime, "yyyy-MM-dd HH:mm:ss"));
					//设置状态为可用
					card.setStatus("10");
					card.setCreateTime(new Date());
					cardMapper.insert(card);
				}
			}
		}
	}
}
