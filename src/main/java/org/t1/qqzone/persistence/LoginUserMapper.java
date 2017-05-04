package org.t1.qqzone.persistence;

import java.util.List;

import org.t1.qqzone.domain.Dic;
import org.t1.qqzone.domain.PwdProtect;
import org.t1.qqzone.domain.User;

/**
 * @author ����
 *	��¼��ע��
 */
public interface LoginUserMapper {

	// ����id��ѯ�û�
	public User getUserById(String userId);

	// ��ѯ��¼�û��Ƿ����
	public User userLogin(User user);

	//��ѯ��¼�û�Ȩ��  
	public Dic findLoginUserBydicId(Integer dicId);

	// ע���û�
	public void insertUser(User user);
	
	// �ж��û����Ƿ�ע��
	public User findUserByName(String userName);
	
	// ����username �޸� ���� ��ֵ
	public void updateUserForPassAndSalt(User user);
	
	//��ѯ�����ܱ�����
	public List<Dic> findForget();
	
	//�����û�id��ѯ �� ��Ӧ���ܱ�����
	public List<PwdProtect> finduserIdGetProcte(String username);
	
	//�޸��û���Ϣ
	public void updateUserData(User user);
	
	//<!-- ����username��ѯuser��Ϣ  -->
	public User findByUserName(String username);
}
