package org.t1.qqzone.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.t1.qqzone.domain.Activity;
import org.t1.qqzone.domain.Comment;
import org.t1.qqzone.domain.Praise;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.service.ActivityService;
import org.t1.qqzone.util.Page;

@Controller
public class ActivityController {

	@Autowired
	private ActivityService activityService;
	
	
	
	/*********
	 * 
	 * Ashy
	 * 
	 * 	根据照片查询评论回复
	 * 
	 * 
	 */
	@RequestMapping("/activity/showPhotoComment")
	@ResponseBody
	public List<Comment> showPhotoComment(String photoid){
		List<Comment> list=null;
		try {
			list=this.activityService.findActivityByPhoroId(photoid);
			return list;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return list;
		}
	}
	

	/********************
	 * 
	 * @return
	 * 
	 * 		去动态页面
	 * 
	 */
	@RequestMapping("/activity/toActivityInfo.htm")
	public String toActivityInfo() {

		return "friendact";
	}

	/*********************
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @param session
	 * @return
	 * 
	 * 		查询与我相关的动态
	 * 
	 */
	@RequestMapping("/act/queryMineActivity.json")
	@ResponseBody
	public Map<String, Object> findMineActivitys(Integer pageNo, HttpSession session) {
		if (pageNo == null) {
			pageNo = 1;
		}
		Map<String, Object> map = new HashMap<String, Object>();

		// 参数
		Map<String, Object> params = new HashMap<String, Object>();

		// 获取当前登录用户
		User loginUser = (User) session.getAttribute("loginUser");

		// 设置对应参数
		params.put("userId", loginUser.getUserid());
		params.put("pageNo", pageNo);

		Page<Activity> page = this.activityService.findAllActivitys(params);
		map.put("page", page);
		map.put("listSize", page.getResult().size());
		map.put("loginUserId", loginUser.getUserid());

		return map;
	}

	/*************************
	 * 
	 * @param session
	 * @param actId
	 * @return
	 * 
	 * 		点赞
	 * 
	 */
	@RequestMapping("/act/toPraiseActivity.json")
	@ResponseBody
	public Map<String, Object> praiseActivity(HttpSession session, String actId) {
		Map<String, Object> map = new HashMap<String, Object>();
		User loginUser = (User) session.getAttribute("loginUser");
		// 创建赞对象并设置参数
		Praise praise = new Praise();
		praise.setUser(loginUser);
		praise.setActid(actId);
		// 操作数据库
		try {
			this.activityService.PraiseActivity(praise);
			map.put("result", "success");
		} catch (Exception e) {
			map.put("result", "error");
		}

		return map;
	}

	/**************************
	 * 
	 * @param session
	 * @param actId
	 * @return
	 * 
	 * 		取消赞
	 * 
	 */
	@RequestMapping("/act/backPraiseActivity.json")
	@ResponseBody
	public Map<String, Object> backPraiseActivity(HttpSession session, String actId) {
		Map<String, Object> map = new HashMap<String, Object>();
		User loginUser = (User) session.getAttribute("loginUser");
		// 创建赞对象并设置参数
		Praise praise = new Praise();
		praise.setUser(loginUser);
		praise.setActid(actId);
		// 操作数据库
		try {
			this.activityService.backPraiseActivity(praise);
			map.put("result", "success");
		} catch (Exception e) {
			map.put("result", "error");
		}
		return map;
	}
}
