package org.t1.qqzone.service;

import java.util.List;

import org.t1.qqzone.domain.User;

public interface UserService {

	/***************
	 * @author suixin
	 * @param userId
	 *            �����û�Id�����û���Ϣ
	 * 
	 */
	public User getUserByUserId(String userId);

	/**********
	 * 
	 * @author suixin
	 * @param user
	 *            �޸ĸ�������
	 * 
	 */
	public void updateUser(User user);

	/**************
	 * 
	 * @author suixin
	 * @param user
	 * 
	 *            �޸�����
	 */
	public void updatePwd(User user);

	/*************************
	 * 
	 * @author suixin
	 * @param user
	 * 
	 *            �޸�ͷ��·��
	 * 
	 */
	public void updateImg(User user);

	/**********************
	 * 
	 * @param user
	 * @return
	 * 
	 * 		����������ѯ�û�
	 * 
	 */
	public List<User> queryUsersByPersonnal(User user);
}
