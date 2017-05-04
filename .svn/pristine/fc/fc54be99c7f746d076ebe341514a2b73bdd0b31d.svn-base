package org.t1.qqzone.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.t1.qqzone.domain.Activity;
import org.t1.qqzone.domain.Say;
import org.t1.qqzone.domain.SayPhoto;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.service.SayService;
import org.t1.qqzone.service.UserService;

/********************************************************************************************
 * 
 * @author wysheng
 *说说业务控制实现类
 */
@Controller
@RequestMapping("say")
public class SayController {
	
	@Resource 
	private SayService sayService;
	@Resource
	private UserService userService;
	
	/*******************************************************************************************
	 * @return 跳转页面
	 * 
	 */
	@RequestMapping("/tomysay")
	public String tomySay(){
		
		return "mysay";
	}
	/***************************************************************************************************
	 * @return 根据用户id查看对应说说
	 */
	@RequestMapping("/listSayForId")
	@ResponseBody
	public Map listSayForId(HttpSession httpsession){
		User loginUser=(User) httpsession.getAttribute("loginUser");
		List<Say> list=sayService.listSayallForUserid(loginUser.getUserid());
		Map.put("ssay",list );
		return Map;
	}
	/***********************
	 * @author wysheng
	 * @param  根据sayid查看对应说说照片
	 */
	@RequestMapping("/listSayImgForId")
	@ResponseBody
	public Map listSayImgForId(String sayid){
		List<SayPhoto> list=sayService.listSayImg(sayid);
		Map.put("ssayImg",list );
		return Map;
	}
	
	/**************************************************************************************************
	 * @return 发布说说huo修改说说
	 */
	
	@RequestMapping("/saveSay")
	public String saveSay(@RequestParam("files") MultipartFile  file ,HttpServletRequest request,HttpSession httpsession,String saycontent) {
		//实例化说说类和用户类
		Say say=new Say();
		User user=new User();
		Activity activity=new Activity();
		SayPhoto sp=new SayPhoto();
		try {
			//判断是否有文件上传
			if(file.getSize()!=0){
			//保存文件  
			String myFileName=file.getOriginalFilename();
            String filePath = request.getSession().getServletContext().getRealPath("/") +"imgs/sayPhoto/srcImg/"+myFileName;
    		File saveDir = new File(filePath);
    		if (!saveDir.getParentFile().exists()){
    			saveDir.getParentFile().mkdirs();
    			}
    		// 转存文件
    		file.transferTo(saveDir);
			//将照片路径存储到sayphoto表中
			sp.setPhotosrc("imgs/sayPhoto/srcImg/"+myFileName);
			//获取登录用户id
			User loginUser=(User) httpsession.getAttribute("loginUser");
			user.setUserid(loginUser.getUserid());
			//说说添加userid
			say.setUserid(user);
			//动态添加userid
			activity.setUser(user);
			//添加说说内容
			say.setSaycontent(saycontent);
			
			}else{
				sp.setPhotosrc("");
				//获取登录用户id
				User loginUser=(User) httpsession.getAttribute("loginUser");
				user.setUserid(loginUser.getUserid());
				//说说添加userid
				say.setUserid(user);
				//动态添加userid
				activity.setUser(user);
				//添加说说内容
				say.setSaycontent(saycontent);
			}
			
			this.sayService.addSay(say, activity, sp);
			Map.put("result", "success");
			
	    } catch (IllegalStateException  | IOException e) {
			e.printStackTrace();
			Map.put("result", "error");
		}
		return "mysay";
	}
	
	/***********************************************************************************************
	 * @return 删除说说
	 */
	@RequestMapping("/deletesay")
	@ResponseBody
	public Map<String,Object> deleteSay(String sayid){
		try {
			this.sayService.deleteSay(sayid);
			Map.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("没有此条说说");
			Map.put("result", "error");
		}
		
		return Map;
	}
	
	
	private Map<String , Object> Map=new HashMap<String , Object>();

	public Map<String, Object> getMap() {
		return Map;
	}

	public void setMap(Map<String, Object> map) {
		Map = map;
	}
}
