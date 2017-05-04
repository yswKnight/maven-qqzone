package org.t1.qqzone.persistence;

import java.util.List;

import org.t1.qqzone.domain.Say;

/*************
 * 
 * @author wysheng
 *
 */
public interface SayMapper {
	//����userid�鿴��Ӧ˵˵
	public List<Say> findSayallForUserid(String userid);
	//����ID�鿴˵˵����
	public Say findSayForSayid(String sayid);
	//���˵˵
	public void insertSay(Say say);
	//ɾ��˵˵
	public void deleteSay(String sayid);
	
	
}
