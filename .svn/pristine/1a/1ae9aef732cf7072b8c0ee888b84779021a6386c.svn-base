package org.t1.qqzone.service;

import java.util.List;
import java.util.Map;

import org.t1.qqzone.domain.Activity;
import org.t1.qqzone.domain.Comment;
import org.t1.qqzone.domain.Praise;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.util.Page;

public interface ActivityService {
	/***************
	 * @author zhengkang 添加日志动态
	 * 
	 */
	public void addActivity(Activity activity);

	/********************
	 * @author suixin
	 * @param userId
	 *            当前用户ID
	 * @return 自己以及好友的全部动态
	 * 
	 *         好友动态
	 * 
	 */
	public Page<Activity> findAllActivitys(Map<String, Object> map);

	/********************
	 * 
	 * @author suixin
	 * @param actId
	 *            动态id
	 * @return 对应动态的赞数量
	 * 
	 * 
	 */
	public List<User> getPraiseNum(String actId);

	/***************
	 * 
	 * @author suixin
	 * @param praise
	 * 
	 *            赞动态
	 * 
	 */
	public void PraiseActivity(Praise praise);

	/****************
	 * 
	 * @param praise
	 * 
	 *            取消赞
	 * 
	 */
	public void backPraiseActivity(Praise praise);

	/*****************
	 * 
	 * @param actId
	 * @return
	 * 
	 * 		查询动态相关的评论列表
	 * 
	 */
	public List<Comment> queryCommentsByActId(String actId);
	
	/**
	 * @author Ashy
	 * 
	 * 添加照片动态
	 * 
	 */
	public void insertActivityByPhoto(Activity activity);
	/**
	 * Ashy
	 * 		根据照片查询动态
	 * 		修改相册权限时同时修改动态
	 * 
	 */
	public List<Comment> findActivityByPhoroId(String photoid);
	
}
