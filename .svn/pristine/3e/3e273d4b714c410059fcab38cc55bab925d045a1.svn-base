package org.t1.qqzone.persistence;

import java.util.List;

import org.t1.qqzone.domain.Friend;
import org.t1.qqzone.domain.FriendMsg;
import org.t1.qqzone.domain.User;

public interface FriendMapper {

	/************
	 * 
	 * @param userId
	 *            用户id
	 * @return
	 * 
	 * 		查询我的好友
	 * 
	 */
	public List<User> queryMyFriends(String userId);

	/*************
	 * 
	 * @param user
	 * @return
	 * 
	 * 		根据条件查询用户
	 * 
	 */
	public List<User> queryUsersByPersonnal(User user);

	/*************
	 * 
	 * @param friend
	 * 
	 *            添加好友
	 * 
	 */
	public void insertFriend(Friend friend);

	/**************************
	 * 
	 * @param msg
	 * 
	 *            发送验证信息
	 * 
	 */
	public void sendMsg(FriendMsg msg);

	/**************
	 * 
	 * @param msgId
	 * @return
	 * 
	 * 		按ID查询消息
	 * 
	 */
	public FriendMsg getMsgById(String msgId);

	/****************
	 * 
	 * @param msgId
	 * 
	 *            处理消息
	 * 
	 */
	public void dealMsg(String msgId);

	/******************
	 * 
	 * @param msg
	 * 
	 *            检测自己是否有消息
	 * 
	 */
	public List<FriendMsg> detectionMyMsg(String userId);

	/********************
	 * 
	 * @param userId
	 * @return
	 * 
	 * 		查询我的消息
	 * 
	 */
	public List<FriendMsg> queryMyMsgByUserId(String userId);

	/*********************
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
