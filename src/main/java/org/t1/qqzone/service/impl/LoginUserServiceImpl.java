package org.t1.qqzone.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.t1.qqzone.domain.Dic;
import org.t1.qqzone.domain.PwdProtect;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.persistence.LoginUserMapper;
import org.t1.qqzone.service.LoginUserService;
import org.t1.qqzone.util.UserUtil;

@Service
public class LoginUserServiceImpl implements LoginUserService{
	@Autowired
	private LoginUserMapper loginUserMapper ;
	
	@Override
	public User getUserById(String userId) {
		return this.loginUserMapper.getUserById(userId);
	}

	@Override
	public User userLogin(User user) {
		if(null != user){
			User finduser = this.loginUserMapper.findUserByName(user.getUsername());
			if(null != finduser){
				//作比较
				String sqlpassword = finduser.getPassword();
				String md5passwod = user.getPassword()+finduser.getSalt();
				if(sqlpassword.equals(md5passwod)){
					String rannumSalt = (int)((Math.random()*9+1)*10000)+"";
					User newuser = new User();
					newuser.setUsername(user.getUsername());
					newuser.setPassword(user.getPassword()+rannumSalt);
					newuser.setSalt(rannumSalt);
					newuser.setUsername(user.getUsername());
					this.loginUserMapper.updateUserForPassAndSalt(newuser);
					User usermx = this.loginUserMapper.userLogin(newuser);
					return usermx;
				}
			}
		}
		return null;
	}
	
	/**@author wangchao
	 * @see 對用戶密碼修改
	 * 
	 * 
	 */
	@Override
	public String updateUser(User user) {
		if(null != user){
			//作比较
			String rannumSalt = (int)((Math.random()*9+1)*10000)+"";
			User newuser = new User();
			newuser.setUsername(user.getUsername());
			newuser.setPassword(user.getPassword()+rannumSalt);
			newuser.setSalt(rannumSalt);
			this.loginUserMapper.updateUserForPassAndSalt(newuser);
			return "success";
		}
		return null;
	}

	@Override
	public Dic findLoginUserBydicId(Integer dicId) {
		return this.loginUserMapper.findLoginUserBydicId(dicId);
	}

	/**  

	* @author wangchao

	* @see 註冊用戶

	* 

	* 

	*/  
	@Override
	public String insertUser(User user) {
		int rannum = 0;
		int next = 0;
		do {
			rannum = (int)((Math.random()*9+1)*10000000);
			user.setUsername(rannum+"");
			next = rannum;
		} while (0 == next);
		UUID uuid=UUID.randomUUID();
	    String str = uuid.toString(); 
	    String uuidStr=str.replace("-", "");
		user.setUserid(uuidStr);
		Dic dic = new Dic();
		dic.setDicid(1+"");
		user.setDic(dic);
		String salt = (int)((Math.random()*9+1)*10000)+"";
		user.setSalt(salt);
		//获得加盐后的密码
		String password = user.getPassword()+salt;
		user.setPassword(password);
		this.loginUserMapper.insertUser(user);
		return next+"";
	}

	@Override
	public User findUserUSerName(String userName) {
		return this.loginUserMapper.findUserByName(userName);
	}

	@Override
	public void updateUserForPassAndSalt(User user) {
		this.loginUserMapper.updateUserForPassAndSalt(user);
	}

	@Override
	public List<Dic> findForget() {
		return this.loginUserMapper.findForget();
	}

	@Override
	public List<PwdProtect> finduserIdGetProcte(String username) {
		List<PwdProtect> list = null;
		if(null != username){
			 list = this.loginUserMapper.finduserIdGetProcte(username);
		}
		return list;
	}
	
	/**@author wangchao
	 * @see 修改用户信息
	 * 
	 * 
	 */
	@Override
	public void updateUserData(User user) {
		this.loginUserMapper.updateUserData(user);
	}

	
	/**@author wangchao
	 * 修改密码（包含旧密码的判断）
	 * 
	 * 
	 */
	@Override
	public String updateUserForPass(UserUtil userUtil) {
		if(null != userUtil){
			User finduser = this.loginUserMapper.findUserByName(userUtil.getUsername());
			if(null != finduser){
				//作比较
				String sqlpassword = finduser.getPassword();
				String md5passwod = userUtil.getOldpassword()+finduser.getSalt();
				if(sqlpassword.equals(md5passwod)){
					String rannumSalt = (int)((Math.random()*9+1)*10000)+"";
					User newuser = new User();
					newuser.setUsername(userUtil.getUsername());
					newuser.setPassword(userUtil.getNewpassword()+rannumSalt);
					newuser.setSalt(rannumSalt);
					this.loginUserMapper.updateUserForPassAndSalt(newuser);
					return "success";
				}
			}
		}
		return null;
	}
	
	/**@author wangchao
	 * @see username 登录账号
	 * @see findByUserName 查询修改个人信息所对应的数据
	 * 
	 */
	@Override
	public User findByUserName(String username) {
		if(null != username){
			return this.loginUserMapper.findByUserName(username);
		}
		return null;
	}
}
