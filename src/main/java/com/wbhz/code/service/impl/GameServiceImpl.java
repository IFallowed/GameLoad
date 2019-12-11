/**
 * @Title:GameLoad/com.wbhz.code.service.impl/GameServiceImpl.java
 * @Description:
 */
package com.wbhz.code.service.impl;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.wbhz.code.domain.Game;
import com.wbhz.code.domain.User;
import com.wbhz.code.mapper.GameMapper;
import com.wbhz.code.service.GameService;

/**
 * @author kc
 * @Description: 游戏业务实现 
 * @Date: 2019年12月6日上午9:12:54
 * @version: 1.0
 */
@Service("gameService")
@Transactional
public class GameServiceImpl implements GameService {

	@Autowired
	private GameMapper gameMapper;
	
	@Autowired
	private ServletContext servletContext;
	/**
	 * @see com.wbhz.code.service.GameService#listByConditionWithPage(java.lang.String, java.lang.String, java.lang.String)
	 * @param name
	 * @param typeId
	 * @param pageNo
	 * @return
	 */
	@Override
	@Transactional(readOnly = true)
	public Map<String, Object> listByConditionWithPage(String name, String typeId, String pageNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		Long type = null;
		//将游戏类型id转换成Long
		if(null != typeId && !"".equals(typeId)) {
			type = Long.valueOf(typeId);
		}
		//设置初始页
		int pageno = 1;
		if(null != pageNo) {
			pageno = Integer.valueOf(pageNo);
		}
		//设置分页
		Page<User> page = PageHelper.startPage(pageno,6,true);
		map.put("datalist",gameMapper.selectAllByCondition(name,type));
		map.put("totalPage",page.getPages());
		map.put("pageNo",page.getPageNum());
		return map;
	}
	/**
	 * @see com.wbhz.code.service.GameService#getById(java.lang.Long)
	 * @param id
	 * @return
	 */
	@Override
	@Transactional(readOnly = true)
	public Game getById(Long id) {

		return gameMapper.selectById(id);
	}
	/**
	 * @see com.wbhz.code.service.GameService#getByName(java.lang.String)
	 * @param name
	 * @return
	 */
	@Override
	@Transactional(readOnly = true)
	public Game getByName(String name) {
		return gameMapper.selectByName(name);
	}
	/**
	 * @see com.wbhz.code.service.GameService#save(com.wbhz.code.domain.Game, org.springframework.web.multipart.MultipartFile, org.springframework.web.multipart.MultipartFile[])
	 * @param game
	 * @param coverfile
	 * @param screenfile
	 * @throws Exception 
	 */
	@Override
	public void save(Game game, MultipartFile coverfile, MultipartFile[] screenfile) throws Exception {
		//处理封面图片
		String coverName = "";
		if(null != coverfile) {
			coverName = saveFile(coverfile, "/images/cover");
		}
		//处理内容图片
		StringBuffer screenName = new StringBuffer("");
        if(null != screenfile && screenfile.length > 0){  
            //循环获取file数组中得文件  
            for(int i = 0;i<screenfile.length;i++){  
                MultipartFile file = screenfile[i];  
                //保存文件  
                screenName.append(saveFile(file, "/images/screen"));  
                screenName.append("|");
            } 
        }  
        screenName = screenName.deleteCharAt(screenName.length()-1);
        //保存图片
        game.setCover(coverName);
        game.setScreen(screenName.toString());
        game.setCreateTime(new Date());
        game.setUpdateTime(new Date());
        gameMapper.save(game);
	}
	
	/**
	 * 
	 * @Description: 保存单张图片
	 * @Return Type:String
	 * @param file
	 * @param url
	 * @return
	 * @throws Exception
	 */
	private String saveFile(MultipartFile file,String url) throws Exception {
		String fileName = "";
		//验证文件的内容
		if(file != null && !file.isEmpty()) {
			//获取文件名
			fileName = file.getOriginalFilename();
			//获取要保存的路径
			String saveDir = servletContext.getRealPath(url);
			Path path = Paths.get(saveDir,fileName);
			//验证此路径下是否存在相同文件内
			if(!path.toFile().exists()) {
				Files.copy(file.getInputStream(),path);
			}
		}
		return fileName;
	}
	/**
	 * @see com.wbhz.code.service.GameService#delete(java.lang.String)
	 * @param ids
	 */
	@Override
	public void delete(String ids) {
		gameMapper.delete(ids.split(","));
	}
	/**
	 * @see com.wbhz.code.service.GameService#update(com.wbhz.code.domain.Game, org.springframework.web.multipart.MultipartFile, org.springframework.web.multipart.MultipartFile, org.springframework.web.multipart.MultipartFile, org.springframework.web.multipart.MultipartFile)
	 * @param game
	 * @param coverfile
	 * @param screenfile1
	 * @param screenfile2
	 * @param screenfile3
	 * @throws Exception 
	 */
	@Override
	public void update(Game game, MultipartFile coverfile, MultipartFile screenfile1, MultipartFile screenfile2,
			MultipartFile screenfile3) throws Exception {
		//修改封面图片
		if(coverfile != null) {
			game.setCover(saveFile(coverfile, "/images/cover"));
		}else {
			game.setCover(null);
		}
		//修改内容截图
		String screen = game.getScreen();
		//修改第一张截图
		if(null != screenfile1 && !screenfile1.isEmpty()) {
			//获取第一张截图的名字
			screen = saveFile(screenfile1, "/images/screen") + screen.substring(screen.indexOf("|"));
		}
		if(null != screenfile2 && !screenfile2.isEmpty()) {
			//获取第二张截图的名字
			screen = screen.substring(0,screen.indexOf("|") + 1) + saveFile(screenfile2, "/images/screen") + screen.substring(screen.lastIndexOf("|"));
		}
		if(null != screenfile3 && !screenfile3.isEmpty()) {
			//获取第三张截图的名字
			screen = screen.substring(0,screen.lastIndexOf("|")+1) + saveFile(screenfile3, "/images/screen");
		}
		game.setScreen(screen);
		game.setUpdateTime(new Date());
		gameMapper.update(game);
	}

}
