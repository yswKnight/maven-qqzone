package org.t1.qqzone.service;

import java.util.List;

import org.t1.qqzone.domain.Friend;
import org.t1.qqzone.domain.FriendMsg;
import org.t1.qqzone.domain.User;

public interface FriendService {

	/*************
	 * 
	 * @param userId
	 * @return 我的好友列表
	 * 
	 *         查询我的好友
	 * 
	 */
	public List<User> queryMyFriends(String userId);

	/******************
	 * 
	 * @param user
	 * @return 按要求搜索用户
	 * 
	 *         搜索用户
	 * 
	 */
	public List<User> seachUsers(User user);

	/***********
	 * 
	 * @param msg
	 * 
	 *            发送验证信息
	 * 
	 */
	public void sendFriendMsg(FriendMsg msg);

	/*******************
	 * 
	 * @param friend
	 * 
	 *            添加好友
	 * 
	 */
	public void insertFriend(Friend friend);

	/**********************
	 * 
	 * @param msgId
	 * @param result
	 * 
	 *            处理消息
	 * 
	 */
	public void dealMsg(String msgId, Integer result, Friend friend);

	/*******************
	 * 
	 * @param userId
	 * @return
	 * 
	 * 		检测自己是否有消息
	 */
	public List<FriendMsg> detectionMyMsg(String userId);

	/*********************
	 * 
	 * @param userId
	 * @return
	 * 
	 * 		查询我的消息
	 * 
	 */
	public List<FriendMsg> queryMineMsgByUserId(String userId);

	/********************
	 * 
	 * @param msgId
	 * @return
	 * 
	 * 		根据id查询消息
	 * 
	 */
	public FriendMsg getMsgByMsgId(String msgId);
	/*********************
	 * 
	 * @param msgId
	 * @return
	 * 
	 * 		根据好友管理表对象删除好友
	 * 
	 */
	public void deleteFriend(Friend friend);
}
