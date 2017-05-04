package org.t1.qqzone.service;

import java.util.List;

import org.t1.qqzone.domain.User;

public interface UserService {

	/***************
	 * @author suixin
	 * @param userId
	 *            根据用户Id返回用户信息
	 * 
	 */
	public User getUserByUserId(String userId);

	/**********
	 * 
	 * @author suixin
	 * @param user
	 *            修改个人资料
	 * 
	 */
	public void updateUser(User user);

	/**************
	 * 
	 * @author suixin
	 * @param user
	 * 
	 *            修改密码
	 */
	public void updatePwd(User user);

	/*************************
	 * 
	 * @author suixin
	 * @param user
	 * 
	 *            修改头像路径
	 * 
	 */
	public void updateImg(User user);

	/**********************
	 * 
	 * @param user
	 * @return
	 * 
	 * 		根据条件查询用户
	 * 
	 */
	public List<User> queryUsersByPersonnal(User user);
}
