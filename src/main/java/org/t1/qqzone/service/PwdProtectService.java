package org.t1.qqzone.service;

import java.util.List;

import org.t1.qqzone.domain.PwdProtect;

public interface PwdProtectService {
	
	/***********
	 * 
	 * @author suixin
	 * @param userId
	 * @return �Ƿ��Ѿ����ܱ�
	 * 
	 * true��ʾ��δ�����ܱ� false��ʾ�������ܱ�
	 */
	public boolean judgePwdProtect(String userId);
	
	
	/****************
	 * @author suixin
	 * @param List
	 * 		�����ܱ�����
	 * 
	 */
	public void setAnswers(PwdProtect pwdProtect);
	
}
