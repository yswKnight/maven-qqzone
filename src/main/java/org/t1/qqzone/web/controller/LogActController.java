package org.t1.qqzone.web.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
import org.t1.qqzone.domain.LogAct;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.service.LogActService;

@Controller
@RequestMapping("/logAct")
public class LogActController {

	@Resource
	private LogActService logActService;

	/***************
	 * 
	 * 
	 * 
	 * 显示全部日志
	 */
	@RequestMapping("/show")
	@ResponseBody
	public Map showLogActController(HttpSession httpSession) {
		// 显示全部日志
		User loginUser = (User) httpSession.getAttribute("loginUser");
		List<LogAct> list = logActService.findLogActAll(loginUser.getUserid());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("log", list);
		return map;
	}

	/***************
	 * 
	 * 
	 * 
	 * 显示日志详情
	 */
	@RequestMapping("/showme")
	@ResponseBody
	public Map showmeLogActController(String logId) {
		// 显示全部日志
		LogAct logAct = logActService.getLogActById(logId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("logact", logAct);
		return map;
	}

	/***************
	 * 
	 * 
	 * 
	 * 添加日志
	 */
	@RequestMapping("/add")
	@ResponseBody
	public Map<String, Object> addLogActController(String logTitle, String logContent, HttpSession httpSession) {
		try {
			logTitle = new String(logTitle.getBytes("ISO-8859-1"), "utf-8");
			logContent = new String(logContent.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		User loginUser = (User) httpSession.getAttribute("loginUser");
		LogAct logAct = new LogAct();
		logAct.setLogTitle(logTitle);
		logAct.setLogContent(logContent);
		User user = new User();
		user.setUserid(loginUser.getUserid());
		logAct.setUser(user);
		Activity activity = new Activity();
		activity.setUser(user);
		logActService.addLogAct(logAct, activity);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		return map;
	}

	/***************
	 * 
	 * 
	 * 
	 * 删除日志
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, Object> deleteLogActController(String logId) {
		// 根据ID删除日志
		logActService.deleteLogAct(logId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("a", 1);
		return map;
	}

	/***************
	 * 
	 * 
	 * 
	 * 上传图片
	 */
	@RequestMapping("/shangchuan")
	public String shangchuanLogActController(@RequestParam("files") MultipartFile[] files ,HttpServletRequest request,HttpServletResponse response) {
		try {
				for (MultipartFile multipartFile : files) {
					MultipartFile file =multipartFile;
					//保存文件  
	                String filePath = request.getSession().getServletContext().getRealPath("\\imgs") +"\\"+ file.getOriginalFilename();
	        		File saveDir = new File(filePath);
	        		if (!saveDir.getParentFile().exists())
	        			saveDir.getParentFile().mkdirs();
	        		// 转存文件
	        		file.transferTo(saveDir);
				}
	    } catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return "show";
	}

	
/*	System.err.println(file.getOriginalFilename());
	// 保存的文件路径
	String filePath = request.getSession().getServletContext().getRealPath("\\imgs")+"\\"+ file.getOriginalFilename();
	File saveDir = new File(filePath);
	if (!saveDir.getParentFile().exists())
		saveDir.getParentFile().mkdirs();
	// 转存文件
	try {
		file.transferTo(saveDir);
	} catch (IllegalStateException | IOException e) {
		e.printStackTrace();
	}*/
	/***************
	 * 
	 * 
	 * 
	 * 修改日志
	 */
	@RequestMapping("/update")
	@ResponseBody
	public Map<String, Object> updateLogActController(String logId, String logTitle, String logContent) {
		// 根据ID删除日志
		try {
			logTitle = new String(logTitle.getBytes("ISO-8859-1"), "utf-8");
			logContent = new String(logContent.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		LogAct logAct = new LogAct();
		logAct.setLogId(logId);
		logAct.setLogTitle(logTitle);
		logAct.setLogContent(logContent);
		java.sql.Date logcreateTime = new java.sql.Date(System.currentTimeMillis());
		logAct.setLogcreateTime(logcreateTime);
		logActService.updateLogAct(logAct);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("a", 1);
		return map;
	}

	/***************
	 * 
	 * 
	 * 
	 * 跳转写日志
	 */
	@RequestMapping("mylog")
	public String go(ModelMap modelMap) {
		// 显示全部日志
		return "mylog";
	}
	/***************
	 * 
	 * 
	 * 
	 * 跳转写日志
	 */
	@RequestMapping("zhuye")
	public String zhuye(ModelMap modelMap) {
		// 显示全部日志
		return "zhuye";
	}
	/***************
	 * 
	 * 
	 * 
	 * 跳转写日志
	 */
	@RequestMapping("golog")
	public String golog() {
		// 显示全部日志
		return "show";
	}

	// 日志ID
	private String logId;

	public String getLogId() {
		return logId;
	}

	public void setLogId(String logId) {
		this.logId = logId;
	}

}
