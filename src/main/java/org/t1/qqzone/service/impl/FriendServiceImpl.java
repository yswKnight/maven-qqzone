package org.t1.qqzone.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.t1.qqzone.domain.Friend;
import org.t1.qqzone.domain.FriendMsg;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.persistence.FriendMapper;
import org.t1.qqzone.service.FriendService;

@Service
public class FriendServiceImpl implements FriendService {

	@Autowired
	private FriendMapper friendMapper;

	// 返回我的好友列表
	@Override
	public List<User> queryMyFriends(String userId) {
		return this.friendMapper.queryMyFriends(userId);
	}

	// 搜索用户
	@Override
	public List<User> seachUsers(User user) {
		return this.friendMapper.queryUsersByPersonnal(user);
	}

	// 发送验证信息
	@Override
	public void sendFriendMsg(FriendMsg msg) {

		// 生成一个随机字符串ID
		UUID uid = UUID.randomUUID();
		// 把生成的ID转为字符串
		String id = uid.toString();
		// 将生成的ID所有字母转换为大写
		id = id.toUpperCase();
		// 将生成的ID中的”-“去掉
		id = id.replaceAll("-", "");

		msg.setMsgid(id);

		this.friendMapper.sendMsg(msg);
	}

	// 添加好友
	@Override
	public void insertFriend(Friend friend) {
		// 生成一个随机字符串ID
		UUID uid = UUID.randomUUID();
		// 把生成的ID转为字符串
		String id = uid.toString();
		// 将生成的ID所有字母转换为大写
		id = id.toUpperCase();
		// 将生成的ID中的”-“去掉
		id = id.replaceAll("-", "");

		friend.setFriendid(id);

		this.friendMapper.insertFriend(friend);
		
		if (!friend.getUserid().equals( friend.getUser().getUserid())) {
			// 同意并添加
			Friend f = new Friend();

			uid = UUID.randomUUID();
			id = uid.toString();
			id = id.toUpperCase();
			id = id.replaceAll("-", "");

			f.setFriendid(id);
			f.setUserid(friend.getUser().getUserid());

			User user = new User();
			user.setUserid(friend.getUserid());

			f.setUser(user);

			this.friendMapper.insertFriend(f);
		}
	}

	// 处理验证消息
	@Override
	public void dealMsg(String msgId, Integer result, Friend friend) {
		// 再把这条消息传入处理方法
		this.friendMapper.dealMsg(msgId);

		if (result == 0) {
			this.insertFriend(friend);
		}

	}

	// 检测是否有消息
	@Override
	public List<FriendMsg> detectionMyMsg(String userId) {
		List<FriendMsg> msgs = this.friendMapper.detectionMyMsg(userId);
		if (msgs.size() > 0) {
			return msgs;
		}
		return null;
	}

	// 查询我的消息
	@Override
	public List<FriendMsg> queryMineMsgByUserId(String userId) {
		return this.friendMapper.queryMyMsgByUserId(userId);
	}

	@Override
	public FriendMsg getMsgByMsgId(String msgId) {
		return this.friendMapper.getMsgByMsgId(msgId);
	}
	
	//根据好友管理表对象删除好友
	public void deleteFriend(Friend friend){
		this.friendMapper.deleteFriend(friend);
	};

}
