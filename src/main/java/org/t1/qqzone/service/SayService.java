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
	 * @param  ����userid�鿴��Ӧ˵˵
	 */
	public List<Say> listSayallForUserid(String userid);
	/***********************
	 * @author wysheng
	 * @param  ����ID�鿴˵˵����
	 */
	public Say listSayForSayid(String sayid);
	/***********************
	 * @author wysheng
	 * @param  ����sayid�鿴��Ӧ˵˵��Ƭ
	 */
	public List<SayPhoto> listSayImg(String sayid);
	
	/***********************
	 * @author wysheng
	 * @param  ���˵˵,����ͬ�������Ѷ�̬��
	 */
	public void addSay(Say say,Activity activity,SayPhoto  sayphoto);
	/***********************
	 * @author wysheng
	 * @param  ɾ��˵˵
	 */
	public void deleteSay(String sayid);
	/***********************
	 * @author wysheng
	 * @param  ��ҳ����
	 */
}
