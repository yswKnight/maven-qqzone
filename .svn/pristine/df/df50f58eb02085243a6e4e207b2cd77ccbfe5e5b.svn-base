package org.t1.qqzone.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.t1.qqzone.domain.FriendMsg;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.service.FriendService;
import org.t1.qqzone.service.UserService;

@Controller
public class MyFriendController {

	@Autowired
	private FriendService friendService;

	@Autowired
	private UserService userService;

	/****************
	 * 
	 * @return
	 * 
	 * 		œ˚œ¢Ã·–—
	 * 
	 */
	@RequestMapping("/remind/detectionMine.json")
	@ResponseBody
	public Map<String, Object> msgRemind(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User) session.getAttribute("loginUser");
		if (user != null) {
			List<FriendMsg> msgs = this.friendService.detectionMyMsg(user.getUserid());
			if (msgs != null) {
				User luser = this.userService.getUserByUserId(user.getUserid());
				map.put("msgs", msgs);
				map.put("msgsSize", msgs.size());
				map.put("user", luser);
			}
		}
		return map;
	}
}
