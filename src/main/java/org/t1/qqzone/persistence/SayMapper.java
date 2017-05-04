package org.t1.qqzone.persistence;

import java.util.List;

import org.t1.qqzone.domain.Say;

/*************
 * 
 * @author wysheng
 *
 */
public interface SayMapper {
	//根据userid查看对应说说
	public List<Say> findSayallForUserid(String userid);
	//根据ID查看说说详情
	public Say findSayForSayid(String sayid);
	//添加说说
	public void insertSay(Say say);
	//删除说说
	public void deleteSay(String sayid);
	
	
}
