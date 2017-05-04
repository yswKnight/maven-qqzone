package org.t1.qqzone.service;

import java.util.List;

import org.t1.qqzone.domain.Dic;
import org.t1.qqzone.domain.PwdProtect;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.util.UserUtil;

public interface LoginUserService {
	
	/*************
	 * 
	 * @author wangchao
	 *		根据id查询用户
	 */
	public User getUserById(String userId);
	
	/*************
	 * 
	 * @author wangchao
	 *		查询登录用户是否存在
	 */
	public User userLogin(User user);
	
	/*************
	 * 
	 * @author wangchao
	 *		查询登录用户权限
	 */
	public Dic findLoginUserBydicId(Integer dicId);
	
	/*************
	 * 
	 * @author wangchao
	 *			注册用户
	 */
	public String insertUser(User user);
	
	/*************
	 * 
	 * @author wangchao
	 *			注册用户
	 */
	public User findUserUSerName(String userName);
	
	/*************
	 * 
	 * @author wangchao
	 *			用户登录成功 后修盐值 密码
	 */
	public void updateUserForPassAndSalt(User user);
	
	/*************
	 * 
	 * @author wangchao
	 *			查询所有密保问题
	 */
	public List<Dic> findForget();
	
	/**@author wangchao
	 * 根据用户id查询 其 对应的密保问题
	 * 
	 * 
	 */
	public List<PwdProtect> finduserIdGetProcte(String username);
	
	/**@author wangchao
	 * 修改密码
	 * 
	 * 
	 */
	public String updateUser(User user);
	
	/**@author wangchao
	 *修改用户信息
	 * 
	 * 
	 */
	public void updateUserData(User user);
	
	/**@author wangchao
	 * @see  updateUserForPass 修改密码（包含旧密码的判断）
	 * @see UserUtil 修改密码辅助类
	 * 
	 */
	public String updateUserForPass(UserUtil userUtil);
	
	/**@author wangchao
	 * @see username 登录账号
	 * @see findByUserName 查询修改个人信息所对应的数据
	 * 
	 */
	public User findByUserName(String username);
}
