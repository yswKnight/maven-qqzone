package org.t1.qqzone.persistence;

import org.t1.qqzone.domain.PwdProtect;

/****************
 * 
 * @author suixin
 *
 */
public interface PwdProtectMapper {
	
	/***********
	 * @author suixin
	 * @param userId
	 * @return 用户密保问题答案的数量
	 */
	public long getAnswersNum(String userId);
	
	/*****************
	 * 
	 * @author suixin
	 * @param pwdProtect
	 * 
	 */
	public void setAnswers(PwdProtect pwdProtect);
	
	

}
