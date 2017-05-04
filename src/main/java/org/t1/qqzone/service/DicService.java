package org.t1.qqzone.service;

import java.util.List;

import org.t1.qqzone.domain.Dic;

public interface DicService {

	/*****************
	 * 
	 * @return
	 * 
	 * 		查询所有密保问题
	 * 
	 */
	public List<Dic> findQuestionsAll();
	
	//根据ID查询
	public Dic getDicById(String dicid);

}
