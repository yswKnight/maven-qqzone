package org.t1.qqzone.service;

import java.util.List;

import org.t1.qqzone.domain.PwdProtect;

public interface PwdProtectService {
	
	/***********
	 * 
	 * @author suixin
	 * @param userId
	 * @return 是否已经有密保
	 * 
	 * true表示暂未设置密保 false表示已设置密保
	 */
	public boolean judgePwdProtect(String userId);
	
	
	/****************
	 * @author suixin
	 * @param List
	 * 		设置密保问题
	 * 
	 */
	public void setAnswers(PwdProtect pwdProtect);
	
}
