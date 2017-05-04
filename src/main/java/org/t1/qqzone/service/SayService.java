package org.t1.qqzone.service;

import java.util.List;

import org.t1.qqzone.domain.Activity;
import org.t1.qqzone.domain.Say;
import org.t1.qqzone.domain.SayPhoto;

/********************
 * @author wysheng
 */
public interface SayService {
	
	/**********************
	 *  @author wysheng
	 * @param  根据userid查看对应说说
	 */
	public List<Say> listSayallForUserid(String userid);
	/***********************
	 * @author wysheng
	 * @param  根据ID查看说说详情
	 */
	public Say listSayForSayid(String sayid);
	/***********************
	 * @author wysheng
	 * @param  根据sayid查看对应说说照片
	 */
	public List<SayPhoto> listSayImg(String sayid);
	
	/***********************
	 * @author wysheng
	 * @param  添加说说,并且同步到好友动态里
	 */
	public void addSay(Say say,Activity activity,SayPhoto  sayphoto);
	/***********************
	 * @author wysheng
	 * @param  删除说说
	 */
	public void deleteSay(String sayid);
	/***********************
	 * @author wysheng
	 * @param  分页功能
	 */
}
