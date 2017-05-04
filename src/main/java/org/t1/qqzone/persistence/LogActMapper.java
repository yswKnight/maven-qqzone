package org.t1.qqzone.persistence;

import java.util.List;

import org.t1.qqzone.domain.LogAct;


/*************
 * 
 * @author zhengkang
 *
 */
public interface LogActMapper {
	
	//显示所有日志
	public List<LogAct> findLogActAll(String userId);
	//根据ID查看日志明细
	public LogAct getLogActById(String logId);
	//添加日志
	public void addLogAct(LogAct logAct);
	//修改日志
	public void updateLogAct(LogAct logAct);
	//根据ID删除日志
	public void deleteLogAct(String logId);
}
