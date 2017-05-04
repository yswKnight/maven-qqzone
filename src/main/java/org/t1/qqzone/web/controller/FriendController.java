package org.t1.qqzone.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.t1.qqzone.domain.City;
import org.t1.qqzone.domain.District;
import org.t1.qqzone.domain.Friend;
import org.t1.qqzone.domain.FriendMsg;
import org.t1.qqzone.domain.Province;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.service.FriendService;
import org.t1.qqzone.service.RegionService;
import org.t1.qqzone.service.UserService;

@Controller
public class FriendController {

	@Autowired
	private FriendService friendService;

	@Autowired
	private RegionService regionService;

	@Autowired
	private UserService userService;

	/**********************
	 * 
	 * @param session
	 * @param map
	 * @return
	 * 
	 * 		ȥ�����б�
	 * 
	 */
	@RequestMapping("/friend/toFriendHome.htm")
	public String toFriendsInfo(HttpSession session, ModelMap map) {

		User user = (User) session.getAttribute("loginUser");
		List<User> friends = this.friendService.queryMyFriends(user.getUserid());
		System.err.println("================="+friends.toString());
		map.put("friends", friends);
		return "friendhome";
	}

	/***********************
	 * 
	 * @return
	 * 
	 * 		ȥ��Ӻ���ҳ��
	 */
	@RequestMapping("/friend/toAddFriend.htm")
	public String toAddFriend(ModelMap map) {
		List<Province> provinces = this.regionService.findAllProvinces();

		map.put("provinces", provinces);

		return "addfriend";
	}

	/**************
	 * 
	 * @param provinceId
	 * @return
	 * 
	 * 		����ʡ��id��ѯ����
	 * 
	 */
	@RequestMapping("/friend/queryCitys.json")
	@ResponseBody
	public Map<String, Object> queryAllCitysByProvinceId(Integer provinceId) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<City> citys = this.regionService.queryAllCitysByProvinceId(provinceId);

		map.put("citys", citys);

		return map;
	}

	/*****************
	 * 
	 * @param cityId
	 * @return
	 * 
	 * 		���ݳ���id��ѯ��
	 * 
	 */
	@RequestMapping("/friend/queryDistricts.json")
	@ResponseBody
	public Map<String, Object> queryAllDistrictAllByCityId(Integer cityId) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<District> districts = this.regionService.queryAllDistrictsByCityId(cityId);

		map.put("districts", districts);

		return map;
	}

	/********************
	 * 
	 * @param user
	 * @return
	 * 
	 * 		�������������û�
	 * 
	 */
	@RequestMapping("/friends/queryUsersByPersonnal.json")
	@ResponseBody
	public Map<String, Object> queryUsersByPersonnal(String username, String adress, Integer sex, String realname) {
		User user = new User();
		Map<String, Object> map = new HashMap<String, Object>();

		if (username != "") {
			user.setUsername(username);
		} else {
			if (adress != "") {
				user.setAddress("%"+adress+"%");
			}
			if (sex != -1) {
				user.setSex(sex);
			}
			if (realname != "") {
				user.setRealname("%"+realname+"%");
			}
		}
		List<User> users = this.userService.queryUsersByPersonnal(user);
		
		map.put("users", users);
		return map;
	}

	/**************
	 * 
	 * @param userId
	 * @return
	 * 
	 * 		�����û�id��ѯ�û���Ϣ
	 * 
	 */
	@RequestMapping("/friend/getUser.json")
	@ResponseBody
	public Map<String, Object> getUserByUserId(String userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		User user = this.userService.getUserByUserId(userId);
		map.put("user", user);
		return map;
	}

	/***************************
	 * 
	 * @param friendId
	 * @param msg
	 * @param session
	 * 
	 *            ��Ӻ���
	 * 
	 */
	@RequestMapping("/friend/addFriend.json")
	@ResponseBody
	public Map<String, Object> addFriendWithUserId(String friendId, String addMsg, HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		FriendMsg msg = new FriendMsg();
		// ��֤��Ϣ
		msg.setMsg(addMsg);
		// ��¼�û�
		msg.setUser((User) session.getAttribute("loginUser"));
		// ���ӵĺ���
		User myFriend = new User();
		myFriend.setUserid(friendId);
		msg.setUseuser(myFriend);
		// ״̬
		msg.setStatus("1");
		// ����ʱ��
		msg.setMsgcreatetime(new Date());

		this.friendService.sendFriendMsg(msg);

		map.put("msg", "success");

		return map;
	}

	/********************
	 * 
	 * @param map
	 * @param session
	 * @return
	 * 
	 * 		ȥ��Ϣ���Ľ���
	 * 
	 */
	@RequestMapping("/friend/myMsg.htm")
	public String toFriendsMsgInfo(ModelMap map, HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		List<FriendMsg> msgs = this.friendService.queryMineMsgByUserId(loginUser.getUserid());
		map.put("mymsgs", msgs);
		return "friendmsghome";
	}

	/******************
	 * 
	 * @param msgId
	 * @return
	 * 
	 * 		������֤��Ϣ
	 * 
	 */
	@RequestMapping("/friend/getMsg.json")
	@ResponseBody
	public Map<String, Object> getMsgByMsgId(String msgId) {
		Map<String, Object> map = new HashMap<String, Object>();
		FriendMsg msg = this.friendService.getMsgByMsgId(msgId);
		map.put("msg", msg);
		return map;
	}

	/****************
	 * 
	 * @param msgId
	 * @param result
	 * @param session
	 * @param userId
	 * @return
	 * 
	 * 		������Ϣ
	 * 
	 */
	@RequestMapping("/friend/dealMas.json")
	@ResponseBody
	public Map<String, Object> dealMsg(String msgId, Integer result, HttpSession session, String userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		Friend f = new Friend();
		// ����
		f.setUserid(userId);
		// �Լ�
		User loginUser = (User) session.getAttribute("loginUser");
		f.setUser(loginUser);

		this.friendService.dealMsg(msgId, result, f);

		map.put("rlt", "success");

		return map;
	}
	/**************
	 * 
	 * @param provinceId
	 * @return
	 * 
	 * 		����ʡ��id��ѯ����
	 * 
	 */
	@RequestMapping("/friend/delete")
	@ResponseBody
	public Map<String, Object> delete(HttpSession session,String userid) {
		User loginUser = (User) session.getAttribute("loginUser");
		System.err.println("============"+userid+"========="+loginUser.getUserid());
		Friend friend=new Friend();
		friend.setUserid(loginUser.getUserid());
		User user=new User();
		user.setUserid(userid);
		friend.setUser(user);
		
		Friend friend2=new Friend();
		friend2.setUserid(userid);
		User user2=new User();
		user2.setUserid(loginUser.getUserid());
		friend2.setUser(user2);
		
		this.friendService.deleteFriend(friend);
		this.friendService.deleteFriend(friend2);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("a", 1);
		return map;
	}
}
