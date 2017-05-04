package org.t1.qqzone.service;

import java.util.List;

import org.t1.qqzone.domain.Activity;
import org.t1.qqzone.domain.LogAct;

/*************
 * 
 * @author zhengkang
 *
 */
public interface LogActService {
	/***************
	 * @author zhengkang 显示所有日志
	 * 
	 */
	public List<LogAct> findLogActAll(String userId);


	/***************
	 * @author zhengkang 根据ID查看日志明细
	 * 
	 */
	public LogAct getLogActById(String logId);


	/***************
	 * @author zhengkang 添加日志
	 * 
	 */
	public void addLogAct(LogAct logAct,Activity activity);
	/***************
	 * @author zhengkang 修改日志
	 * 
	 */
	public void updateLogAct(LogAct logAct);
	/***************
	 * @author zhengkang 根据ID删除日志
	 * 
	 */
	public void deleteLogAct(String logId);
}
