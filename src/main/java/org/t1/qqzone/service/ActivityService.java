package org.t1.qqzone.service;

import java.util.List;
import java.util.Map;

import org.t1.qqzone.domain.Activity;
import org.t1.qqzone.domain.Comment;
import org.t1.qqzone.domain.Praise;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.util.Page;

public interface ActivityService {
	/***************
	 * @author zhengkang �����־��̬
	 * 
	 */
	public void addActivity(Activity activity);

	/********************
	 * @author suixin
	 * @param userId
	 *            ��ǰ�û�ID
	 * @return �Լ��Լ����ѵ�ȫ����̬
	 * 
	 *         ���Ѷ�̬
	 * 
	 */
	public Page<Activity> findAllActivitys(Map<String, Object> map);

	/********************
	 * 
	 * @author suixin
	 * @param actId
	 *            ��̬id
	 * @return ��Ӧ��̬��������
	 * 
	 * 
	 */
	public List<User> getPraiseNum(String actId);

	/***************
	 * 
	 * @author suixin
	 * @param praise
	 * 
	 *            �޶�̬
	 * 
	 */
	public void PraiseActivity(Praise praise);

	/****************
	 * 
	 * @param praise
	 * 
	 *            ȡ����
	 * 
	 */
	public void backPraiseActivity(Praise praise);

	/*****************
	 * 
	 * @param actId
	 * @return
	 * 
	 * 		��ѯ��̬��ص������б�
	 * 
	 */
	public List<Comment> queryCommentsByActId(String actId);
	
	/**
	 * @author Ashy
	 * 
	 * �����Ƭ��̬
	 * 
	 */
	public void insertActivityByPhoto(Activity activity);
	/**
	 * Ashy
	 * 		������Ƭ��ѯ��̬
	 * 		�޸����Ȩ��ʱͬʱ�޸Ķ�̬
	 * 
	 */
	public List<Comment> findActivityByPhoroId(String photoid);
	
}
