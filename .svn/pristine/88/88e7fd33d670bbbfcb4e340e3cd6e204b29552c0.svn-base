package org.t1.qqzone.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.t1.qqzone.domain.Comment;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.service.CommentService;

@Controller
@RequestMapping("/com")
public class CommentController {
	@Autowired
	private CommentService commentService;

	@RequestMapping(value = "/addcomment")
	@ResponseBody
	public Map<String, Object> toregist(Integer corder, String actid, String commcontent, String adoptuserid,
			String comcommid, HttpSession session) {

		Comment comment = new Comment();
		// 接受回复的人
		User adoptuser = new User();
		adoptuser.setUserid(adoptuserid);
		comment.setAdoptuser(adoptuser);
		// 发出的用户
		User loginUser = (User) session.getAttribute("loginUser");
		comment.setGiveuser(loginUser);
		// 排序
		comment.setCorder(corder);
		// 回复的评论id
		comment.setComcommid(comcommid);
		//内容
		comment.setCommcontent(commcontent);
		//动态id
		comment.setActid(actid);

		if (null != comment) {
			try {
				this.commentService.save(comment);
				this.status = "success";
			} catch (Exception e) {
				this.status = "error";
				e.printStackTrace();
			}
		}
		this.jsonResult.put("status", status);
		return this.jsonResult;
	}
	
	@RequestMapping(value = "/comment")
	@ResponseBody
	public Map<String, Object> comment(String actid, String commcontent, String adoptuserid, HttpSession session) {

		Comment comment = new Comment();
		// 接受回复的人
		User adoptuser = new User();
		adoptuser.setUserid(adoptuserid);
		
		comment.setAdoptuser(adoptuser);
		// 发出的用户
		User loginUser = (User) session.getAttribute("loginUser");
		comment.setGiveuser(loginUser);
		//内容
		comment.setCommcontent(commcontent);
		comment.setNewcorder(0);
		//动态id
		comment.setActid(actid);

		if (null != comment) {
			try {
				this.commentService.saves(comment);
				this.status = "success";
			} catch (Exception e) {
				this.status = "error";
				e.printStackTrace();
			}
		}
		this.jsonResult.put("status", status);
		return this.jsonResult;
	}

	private Map<String, Object> jsonResult = new HashMap<String, Object>();
	private String status;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Map<String, Object> getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(Map<String, Object> jsonResult) {
		this.jsonResult = jsonResult;
	}
}
