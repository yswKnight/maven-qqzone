package org.t1.qqzone.persistence;

import java.util.List;
import java.util.Map;

import org.t1.qqzone.domain.Activity;
import org.t1.qqzone.domain.Comment;
import org.t1.qqzone.domain.Praise;

public interface ActivityMapper {

	/***************
	 * @author zhengkang 添加日志动态 activity 日志对象
	 */
	public void addActivity(Activity activity);

	/***************
	 * @author zhengkang 删除日志动态 logId 日志ID
	 */
	public void deleteActivity(String logId);

	/***********************
	 * 
	 * @param userId
	 *            登录用户的ID
	 * @return
	 * 
	 * 		查询与我相关的所有动态及评论
	 * 
	 */
	public List<Activity> queryActivitysByUserAndFriends(Map<String, Object> map);

	/*************
	 * 
	 * @param praise
	 *            赞对象
	 * 
	 *            赞动态
	 * 
	 */
	public void praiseActivity(Praise praise);

	/**********************
	 * 
	 * @param comment
	 *            评论对象
	 * 
	 *            评论动态
	 * 
	 */
	public void discussActivity(Comment comment);

	/**
	 * Ashy 根据照片查询动态 修改相册权限时同时修改动态
	 * 
	 */
	public List<Comment> findActivityByPhoroId(String photoid);

	/**
	 * 
	 * Ashy
	 * 
	 * 添加照片动态
	 * 
	 * 
	 */
	public void insertActivityByPhoto(Activity activity);

	/*******************
	 * 
	 * @param actId
	 * @return
	 * 
	 * 		查询点赞数
	 * 
	 */
	public List<Praise> getActPraiseCount(String actId);

	/*********************
	 * 
	 * @param praise
	 * 
	 *            取消赞
	 * 
	 */
	public void backPraiseActivity(Praise praise);

	/*******************
	 * 
	 * @param actId
	 * @return
	 * 
	 * 		查询动态相关评论列表
	 * 
	 */
	public List<Comment> queryCommentsByActId(String actId);

	/****************
	 * 
	 * @param sayId
	 * @return
	 * 
	 * 		返回说说的图片路径
	 * 
	 */
	public String getSayPictureSrc(String sayId);
}
