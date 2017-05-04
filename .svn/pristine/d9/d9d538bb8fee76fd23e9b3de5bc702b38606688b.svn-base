package org.t1.qqzone.persistence;

import java.util.List;

import org.t1.qqzone.domain.Dic;
import org.t1.qqzone.domain.PwdProtect;
import org.t1.qqzone.domain.User;

/**
 * @author 王超
 *	登录及注册
 */
public interface LoginUserMapper {

	// 根据id查询用户
	public User getUserById(String userId);

	// 查询登录用户是否存在
	public User userLogin(User user);

	//查询登录用户权限  
	public Dic findLoginUserBydicId(Integer dicId);

	// 注册用户
	public void insertUser(User user);
	
	// 判断用户名是否注册
	public User findUserByName(String userName);
	
	// 根据username 修改 密码 盐值
	public void updateUserForPassAndSalt(User user);
	
	//查询所有密保问题
	public List<Dic> findForget();
	
	//根据用户id查询 其 对应的密保问题
	public List<PwdProtect> finduserIdGetProcte(String username);
	
	//修改用户信息
	public void updateUserData(User user);
	
	//<!-- 根据username查询user信息  -->
	public User findByUserName(String username);
}
