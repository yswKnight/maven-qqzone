package org.t1.qqzone.service.test;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.t1.qqzone.domain.Friend;
import org.t1.qqzone.domain.FriendMsg;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.service.FriendService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-bean.xml", "classpath:spring-mybatis.xml", })
public class FriendServiceTest {

	@Resource
	ApplicationContext ctx;
	@Resource
	SqlSessionFactory sqlSessionFactory;
	@Resource
	FriendService friendService;

	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring-bean.xml", "spring-mybatis.xml");
		FriendService friendService = (FriendService) ac.getBean("friendServiceImpl");
		Friend friend=new Friend();
		friend.setUserid("16943abf2f6645af822871d432f7bdbf");
		User user=new User();
		user.setUserid("8edb68926f094017b569f1ca99648747");
		friend.setUser(user);
		friendService.deleteFriend(friend);
	/*	// 查询我的好友
		List<User> friends = friendService.queryMyFriends("stu1");
		for (User friend : friends) {
			System.err.println("我的好友：" + friend.toString());
		}

		// 搜索用户
		User user = new User();
		user.setSex(1);
		user.setAddress("湖北仙桃");
		List<User> users = friendService.seachUsers(user);
		for (User friend : users) {
			System.err.println("搜索用户：" + friend.toString());
		}

		// 发送验证信息
		FriendMsg msg = new FriendMsg();

		User i = new User();
		User you = new User();

		i.setUserid("stu2");
		you.setUserid("stu3");

		msg.setUser(i);
		msg.setUseuser(you);
		msg.setMsg("郑康大撒来加你了");

		friendService.sendFriendMsg(msg);

		// 添加好友
		Friend friend = new Friend();
		friend.setUserid("stu2");
		User userFriend = new User();
		userFriend.setUserid("stu3");
		friend.setUser(userFriend);

		friendService.insertFriend(friend);*/


	}
}
