package org.t1.qqzone.service;

import java.util.List;

import org.t1.qqzone.domain.Friend;
import org.t1.qqzone.domain.FriendMsg;
import org.t1.qqzone.domain.User;

public interface FriendService {

	/*************
	 * 
	 * @param userId
	 * @return �ҵĺ����б�
	 * 
	 *         ��ѯ�ҵĺ���
	 * 
	 */
	public List<User> queryMyFriends(String userId);

	/******************
	 * 
	 * @param user
	 * @return ��Ҫ�������û�
	 * 
	 *         �����û�
	 * 
	 */
	public List<User> seachUsers(User user);

	/***********
	 * 
	 * @param msg
	 * 
	 *            ������֤��Ϣ
	 * 
	 */
	public void sendFriendMsg(FriendMsg msg);

	/*******************
	 * 
	 * @param friend
	 * 
	 *            ��Ӻ���
	 * 
	 */
	public void insertFriend(Friend friend);

	/**********************
	 * 
	 * @param msgId
	 * @param result
	 * 
	 *            ������Ϣ
	 * 
	 */
	public void dealMsg(String msgId, Integer result, Friend friend);

	/*******************
	 * 
	 * @param userId
	 * @return
	 * 
	 * 		����Լ��Ƿ�����Ϣ
	 */
	public List<FriendMsg> detectionMyMsg(String userId);

	/*********************
	 * 
	 * @param userId
	 * @return
	 * 
	 * 		��ѯ�ҵ���Ϣ
	 * 
	 */
	public List<FriendMsg> queryMineMsgByUserId(String userId);

	/********************
	 * 
	 * @param msgId
	 * @return
	 * 
	 * 		����id��ѯ��Ϣ
	 * 
	 */
	public FriendMsg getMsgByMsgId(String msgId);
	/*********************
	 * 
	 * @param msgId
	 * @return
	 * 
	 * 		���ݺ��ѹ�������ɾ������
	 * 
	 */
	public void deleteFriend(Friend friend);
}
