package org.t1.qqzone.persistence;

import java.util.List;

import org.t1.qqzone.domain.User;

public interface UserMapper {
	// 查询所有用户
	public List<User> findUserAll();

	// 根据id查询用户
	public User getUserById(String userId);

	// 查询登录用户是否存在
	public long userLogin(User user);

	// 查询用户名是否已存在

	// 注册用户
	public void insertUser(User user);

	// 修改个人用户资料
	public void updateUser(User user);

	// 修改用户密码
	public void updateUserForPass(User user);

	// 注销用户（....暂时备用）
	public void delUser(Integer userId);

	// 根据条件查询用户
	public List<User> queryUsersByPersonnal(User user);
}
