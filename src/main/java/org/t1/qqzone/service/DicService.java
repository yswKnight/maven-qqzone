package org.t1.qqzone.service;

import java.util.List;

import org.t1.qqzone.domain.Dic;

public interface DicService {

	/*****************
	 * 
	 * @return
	 * 
	 * 		��ѯ�����ܱ�����
	 * 
	 */
	public List<Dic> findQuestionsAll();
	
	//����ID��ѯ
	public Dic getDicById(String dicid);

}
