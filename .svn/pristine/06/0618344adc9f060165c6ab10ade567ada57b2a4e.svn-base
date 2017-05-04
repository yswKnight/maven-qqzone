package org.t1.qqzone.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.persistence.UserMapper;
import org.t1.qqzone.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public User getUserByUserId(String userId) {
		User user = this.userMapper.getUserById(userId);
		return user;
	}

	@Override
	public void updateUser(User user) {
		if (user != null) {
			this.userMapper.updateUser(user);
		}
	}

	@Override
	public void updatePwd(User user) {
		if (user.getUserid() != null && user.getPassword() != null) {
			// 修改密码用专门的方法
			this.userMapper.updateUserForPass(user);
		}
	}

	@Override
	public void updateImg(User user) {
		// 先根据id查出此用户
		User newUser = this.getUserByUserId(user.getUserid());
		// 再讲新的密码赋予此用户
		newUser.setImg(user.getImg());
		// 然后执行修改操作
		this.userMapper.updateUser(newUser);
	}

	@Override
	public List<User> queryUsersByPersonnal(User user) {
		return this.userMapper.queryUsersByPersonnal(user);
	}
}
